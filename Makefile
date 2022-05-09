PROJECT=main
TEX=pdflatex
LATEXFLAGS+=	-file-line-error -halt-on-error -interaction nonstopmode
BIBTEX=bibtex
BUILDTEX=$(TEX) $(LATEXFLAGS) $(PROJECT).tex

EXAMPLES=$(wildcard examples/*.tex) 

all:	clean
	$(BUILDTEX)
	$(BIBTEX) $(PROJECT).aux
	$(BUILDTEX)
	$(BUILDTEX)

examples:$(EXAMPLES)
	pdflatex $(LATEXFLAGS) $^

clean-all:
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~ 

clean:
	rm -f *.log *.bak *.aux *.bbl *.blg *.idx *.toc *.out *~

.PHONY: examples test clean