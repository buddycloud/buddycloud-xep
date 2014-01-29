buddycloud.html:
	if [ -e buddycloud.xml ]; then rm buddycloud.xml; fi;
	touch buddycloud.xml; 
	for i in `ls ./sections/ | sort -n`; do \
		cat ./sections/$$i >> buddycloud.xml;  \
	done;
	xsltproc xep.xsl buddycloud.xml > $@
