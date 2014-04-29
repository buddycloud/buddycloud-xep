.PHONY: default

DATE=$(shell date +%Y-%m-%d)
YEAR=$(shell date +%Y)

default: index.html index.xml

index.html:
	xsltproc --xinclude --output $@ xep.xsl main.xml; if [ $$? -ne 0 ]; then echo "xsltproc build failed"; exit 1; fi;
	sed -i s/{{DATE}}/$(DATE)/g $@
	sed -i s/{{YEAR}}/$(YEAR)/g $@

index.xml:
	if [ -e $@ ]; then rm $@; fi;
	xmllint --xinclude --output $@ main.xml
	sed -i s/{{DATE}}/$(DATE)/g $@
	sed -i s/{{YEAR}}/$(YEAR)/g $@
