DOCUMENT="RNARedPrint-Bioinfo2018"

all: thesis

thesis:
	pdflatex --interaction=nonstopmode ${DOCUMENT}
	bibtex ${DOCUMENT}
	pdflatex --interaction=nonstopmode ${DOCUMENT}
	pdflatex --interaction=nonstopmode ${DOCUMENT}

watch:
	while [ "`command -v inotifywait | wc -c`" != "0" ]; do \
	    FILE=`inotifywait -qre close_write --exclude '.git' . | sed -n 's/.*\s\(\w\)/\1/p'`; \
	    echo ${FILE}; \
	    sleep 0.2; \
            make all; \
	done

clean:
	rm -f *.dvi *.aux *.log *.lof *.lot *.toc *.bbl *.blg *.out *.run.xml *blx.bib ${DOCUMENT}.pdf

.PHONY: thesis
