buddycloud.html: buddycloud.xml
	xsltproc xep.xsl $< > $@
