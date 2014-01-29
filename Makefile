buddycloud.html:
	if [ -e buddycloud.xml ]; then rm buddycloud.xml; fi;
	touch buddycloud.xml; 
	for i in `ls ./sections/ | sort -n`; do \
		cat ./sections/$$i >> buddycloud.xml;  \
	done;
	xsltproc xep.xsl buddycloud.xml > $@
	git config user.email "deploy@travis-ci.org"
	git config user.name "Travis deploy"
	git add -f buddycloud.xml buddycloud.html
	echo "Added generated files"
	git config credential.helper "store --file=.git/credentials"
	echo "https://${GH_TOKEN}@github.com" > .git/credentials
	git commit -a -m "Updating XEP"
	git push origin gh-pages
