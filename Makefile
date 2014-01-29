index.html:
	if [ -e $@ ]; then rm $@; fi;
	xsltproc --xinclude xep.xsl main.xml > $@
	[ $? -ne 0 ]; then
    		echo "xsltproc build failed";
		exit 1;
	fi;
	sed -i s/{{DATE}}/`date +%Y-%m-%d`/g $@
	sed -i s/{{YEAR}}/`date +%Y`/g $@
