index.html:
	if [ -e $@ ]; then rm $@; fi;
	xsltproc --xinclude xep.xsl main.xml > $@
	sed -i s/{{DATE}}/`date +%Y-%m-%d`/g $@
	sed -i s/{{YEAR}}/`date +%Y`/g $@
