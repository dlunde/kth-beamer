.PHONY: example clean

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

example: example.pdf \
	     example-aspect32.pdf \
	     example-aspect43.pdf \
	     example-aspect54.pdf \
	     example-aspect149.pdf \
	     example-aspect1609.pdf \
	     example-aspect1610.pdf

clean:
	git clean -Xdf
