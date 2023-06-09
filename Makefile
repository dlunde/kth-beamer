.PHONY: example clean

SHELL = bash

BUILD-DIR = _build
PDFLATEX = pdflatex -output-directory=$(BUILD-DIR)

example.pdf:
	$(eval TEXFILE := $(BUILD-DIR)/example.tex)
	$(eval PDFFILE := $(BUILD-DIR)/example.pdf)
	mkdir -p $(BUILD-DIR)
	cp example.tex $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)
	mv $(PDFFILE) .

example-aspect%.pdf:
	$(eval TEXFILE := $(BUILD-DIR)/example-aspect$*.tex)
	$(eval PDFFILE := $(BUILD-DIR)/example-aspect$*.pdf)
	mkdir -p $(BUILD-DIR)
	tail --lines=+2 example.tex | cat <(echo "\documentclass[aspectratio=$*]{beamer}") - > $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)
	mv $(PDFFILE) .

example: example.pdf $(foreach ar, 32 43 54 149 1609 1610, example-aspect$(ar).pdf)

clean:
	git clean -Xdf
