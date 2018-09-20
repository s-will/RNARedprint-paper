SVGS=$(wildcard *.svg)
SVGZS=$(wildcard *.svgz)

all: $(SVGS:.svg=.pdf) $(SVGZS:.svgz=.pdf)

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

%.pdf: %.ps
	epstopdf --gsopt -dCompatibilityLevel=1.4 $< --outfile $@

