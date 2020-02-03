#Rafael Marinho
#Latex Makefile

.PHONY: all clean

SRC=src

THESIS=thesis

all:	thesis

thesis:	bib abbreviation
	pdflatex $(THESIS)
	pdflatex $(THESIS)
#	latex $(SRC)/$(THESIS)
#	dvipdf $(THESIS:%.tex=%.dvi)
#	rm *dvi

doc:
	pdflatex $(THESIS)

html:
	htlatex $(THESIS)

bib:	doc $(THESIS)
	bibtex $(THESIS)
	
abbreviation: doc $(THESIS)
	makeindex -s thesis.ist -o thesis.gls thesis.glo
	makeindex -l -s thesis.ist -o thesis.gls thesis.glo

small:	thesis.pdf
	 gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.6 -r600 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=small_thesis.pdf thesis.pdf

clean:
	rm -rf *.aux *.log *.out *.bbl *.blg *.toc *.lot *.lof *.glo *.gls *.ist *.ilg

fullclean:
	rm -rf *.aux *.log *.out *.bbl *.blg *.toc *.lot *.lof *.glo *.gls *.ist *.ilg
	rm -rf small_thesis.pdf
	rm -rf $(THESIS).pdf
