SVGS=$(wildcard *.svg) $(wildcard Workflow/*.svg)
SVGZS=$(wildcard *.svgz)

all: $(SVGS:.svg=.pdf) $(SVGZS:.svgz=.pdf)  Workflow.pdf $(FIGURE_TARGETS) # $(SVGS:.svg=.ps) $(SVGZS:.svgz=.ps)


Workflow.pdf: Workflow/Workflow.tex
	cd Workflow; pdflatex Workflow.tex
	if [ ! -e Workflow.pdf ] ; then \
	   mv Workflow/Workflow.pdf . ;\
        fi

%.pdf: %.R
	Rscript $<

%.pdf: %.png
	convert $< $@

%.pdf: %.jpg
	convert $< $@

%.pdf: %.svg
	inkscape --export-pdf $@ $<

%.pdf: %.svgz
	inkscape --export-pdf $@ $<

%.ps: %.svg
	inkscape --export-ps $@ $<

%.ps: %.svgz
	inkscape --export-ps $@ $<

clean:
	$(RM) $(SVGS:.svg=.pdf) $(SVGZS:.svgz=.pdf)
	$(RM) simpletd-basepair-{plain,functions}.svg
	$(RM) simpletd-basepair-td-*.svg

%.pdf: %.ps
	epstopdf --gsopt -dCompatibilityLevel=1.4 $< --outfile $@

%-greyed.pdf: %.pdf
	convert $< -brightness-contrast 80 $@

%_ss.svg: %.fa
	RNAplot -o svg <$<

%-crop.pdf: %.pdf
	pdfcrop $<

