index.html:
	if [ -e buddycloud.xml ]; then rm buddycloud.xml; fi;
	xsltproc --xinclude xep.xsl main.xml > $@
	sed -i s/{{DATE}}/`date +%Y-%m-%d`/g buddycloud.html
	sed -i s/{{YEAR}}/`date +%Y`/g buddycloud.html
