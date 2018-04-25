SVGS=$(wildcard *.svg)
SVGZS=$(wildcard *.svgz)

all: $(SVGS:.svg=.pdf) $(SVGZS:.svgz=.pdf) $(FIGURE_TARGETS)

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

