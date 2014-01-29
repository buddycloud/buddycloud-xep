buddycloud.html:
	if [ -e buddycloud.xml ]; then rm buddycloud.xml; fi;
	touch buddycloud.xml; 
	for i in `ls ./sections/ | sort -n`; do \
		cat ./sections/$$i >> buddycloud.xml;  \
	done;
	sed -i s/{{DATE}}/`date +%Y-%m-%d`/g buddycloud.xml
	sed -i s/{{YEAR}}/`date +%Y`/g buddycloud.xml
	xsltproc xep.xsl buddycloud.xml > $@
