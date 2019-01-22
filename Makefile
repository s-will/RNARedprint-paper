DOCUMENTS=BMC-Response-Round1 RNARedPrint supplement

all: figs $(DOCUMENTS:=.pdf)
pdf: all
figs:
	make -C Figs

RNARedPrint.pdf: RNARedPrint.aux supplement.aux
supplement.pdf: RNARedPrint.aux supplement.aux

# compile the response letter w/o bibtex
BMC-Response-Round1.pdf: BMC-Response-Round1.tex
	pdflatex BMC-Response-Round1.tex

%.pdf: %.tex %.aux
	pdflatex $<
	pdflatex $<

%.aux: %.tex
	pdflatex $<
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
