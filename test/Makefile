export TEXINPUTS := ../styles/:../logos/:

ROOT := bibtest
BSTS := apj mnras
TEX := $(ROOT).tex
AUX := $(foreach b,$(BSTS),$(b).aux) # $(ROOT).aux
BBL := $(foreach b,$(BSTS),$(b).bbl) # $(ROOT).bbl
BLG := $(foreach b,$(BSTS),$(b).blg) # $(ROOT).blg
PDF := $(ROOT).pdf
NOTES := $(foreach b,$(BSTS),$(b)Notes.bib) # $(ROOT)Notes.bib 
ROOTNOTES := $(ROOT)Notes.bib 
JUNK := $(BLG) $(ROOT).aux $(ROOT).log $(NOTES) $(ROOTNOTES)

BIB := ../bib/lsstdesc.bib

.PHONY: default tidy clean

default: $(PDF)

tidy:
	rm -f $(JUNK) $(AUX) $(BBL)

clean: tidy
	rm -f $(PDF)

$(AUX) $(ROOTNOTES): $(TEX)
	pdflatex $(TEX)

%.bbl: %.aux $(BIB) $(NOTES)
	bibtex $<

%Notes.bib: $(ROOTNOTES)
	cp -f $< $@

$(PDF): $(TEX) $(BBL)
	pdflatex $(TEX)
