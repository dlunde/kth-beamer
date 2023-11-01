.PHONY: example package clean \
        install-texlive \
        uninstall-texlive

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
	$(PDFLATEX) $(TEXFILE)
	mv $(PDFFILE) .

example-aspect%.pdf:
	$(eval TEXFILE := $(BUILD-DIR)/example-aspect$*.tex)
	$(eval PDFFILE := $(BUILD-DIR)/example-aspect$*.pdf)
	mkdir -p $(BUILD-DIR)
	tail --lines=+2 example.tex | cat <(echo "\documentclass[aspectratio=$*]{beamer}") - > $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)
	mv $(PDFFILE) .

example: example.pdf $(foreach ar, 32 43 54 149 169 1610, example-aspect$(ar).pdf)

# Builds a .zip package according to CTAN guidelines:
# https://ctan.org/help/upload-pkg
package:
	$(eval PKG-DIR := $(BUILD-DIR)/_package)
	rm -rf $(PKG-DIR)
	mkdir -p $(PKG-DIR)

	mkdir $(PKG-DIR)/kth-beamer
	cp *kth.sty README.md $(PKG-DIR)/kth-beamer
	cp -r img $(PKG-DIR)/kth-beamer/img
	cd $(PKG-DIR) && zip -r kth-beamer.zip kth-beamer
	mv $(PKG-DIR)/kth-beamer.zip .

# Locally install for texlive on Linux
install-texlive:
	$(eval PWD := $(shell pwd -P))
	$(eval TEXMFHOME := $(shell kpsewhich --var-value TEXMFHOME))
	$(eval TEXMFLOCAL := $(shell kpsewhich --var-value TEXMFLOCAL))
	$(eval TEXMFDIST := $(shell kpsewhich --var-value TEXMFDIST))
	@echo "Locally installing kth-beamer for texlive."
	@echo -e "(\033[1;31mEXPERIMENTAL FEATURE.\033[0m For testing purposes only. Use CTAN package otherwise.)"
	@read -p "Are you sure you want to proceed? [y/N] " choice && if [[ "$${choice,,}" != "y" ]]; then exit 1; fi
	@echo "TEXMFHOME = $(TEXMFHOME)"
	@echo "TEXMFLOCAL = $(TEXMFLOCAL)"
	@echo "TEXMFDIST = $(TEXMFDIST)"
	$(eval INSTALL_ROOT := /usr/local/share/texmf/tex/latex)
	@echo "Installing package at $(INSTALL_ROOT)"
	mkdir -p $(INSTALL_ROOT)
	cd $(INSTALL_ROOT) && unzip $(PWD)/kth-beamer.zip
	mktexlsr

uninstall-texlive:
	$(eval INSTALL_PATH := /usr/local/share/texmf/tex/latex/kth-beamer)
	@echo "Uninstalling package at $(INSTALL_PATH)"
	rm -r $(INSTALL_PATH)
	mktexlsr

clean:
	git clean -Xdf
