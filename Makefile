DOCUMENTS=RNARedPrint-Bioinfo2018 supplement

all: $(DOCUMENTS:=.pdf)

RNARedPrint-Bioinfo2018.pdf: RNARedPrint-Bioinfo2018.aux supplement.aux
supplement.pdf: RNARedPrint-Bioinfo2018.aux supplement.aux

%.pdf: %.tex %.aux
	pdflatex --interaction=nonstopmode $<
	pdflatex --interaction=nonstopmode $<

%.aux: %.tex
	pdflatex --interaction=nonstopmode $<
	bibtex ${<:.tex=}

watch:
	while [ "`command -v inotifywait | wc -c`" != "0" ]; do \
	    FILE=`inotifywait -qre close_write --exclude '.git' . | sed -n 's/.*\s\(\w\)/\1/p'`; \
	    echo ${FILE}; \
	    sleep 0.2; \
            make all; \
	done

clean:
	rm -f *.dvi *.aux *.log *.lof *.lot *.toc *.bbl *.blg *.out *.run.xml *blx.bib ${DOCUMENTS:=.pdf}
