buddycloud-protocol.html: buddycloud-protocol.xml
	xsltproc xmpp/extensions/xep.xsl $< > $@
