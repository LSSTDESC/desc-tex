export TEXINPUTS := ../styles/:../logos/:

# for bibliography tests
BIB := ../bib/lsstdesc.bib
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
HTML := $(ROOT).html

# for macro tests
MACROS := ../styles/lsstdesc_macros.sty
MACROROOT := macro_demo
MACROTEX := $(MACROROOT).tex
MACROPDF := $(MACROROOT).pdf
JUNK += $(MACROROOT).aux $(MACROROOT).log $(MACROTEX)



.PHONY: default tidy clean bibtest macrotest

default: bibtest macrotest

bibtest: $(PDF) $(HTML)

macrotest: $(MACROPDF)

tidy:
	rm -f $(JUNK) $(AUX) $(BBL)

clean: tidy
	rm -f $(PDF) $(HTML) $(MACROPDF)


# bibliography tests

$(AUX) $(ROOTNOTES): $(TEX)
	pdflatex $(TEX)

%.bbl: %.aux $(BIB) $(NOTES)
	bibtex $<

%Notes.bib: $(ROOTNOTES)
	cp -f $< $@

$(PDF): $(TEX) $(BBL)
	pdflatex $(TEX)

$(HTML): $(BIB)
	#pip list 2>/dev/null | grep -q bibtexparser || pip install --upgrade-strategy only-if-needed bibtexparser
	python make_publication_list.py > $@


# macros test

$(MACROTEX): $(MACROS)
	gawk -f make_macro_demo.awk $< > $@

$(MACROPDF): $(MACROTEX)
	pdflatex $<

