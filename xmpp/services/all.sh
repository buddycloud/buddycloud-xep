#!/bin/sh
# usage: ./all.sh

servpath=/var/www/vhosts/xmpp.org/services

# copy index page
cp index.shtml $servpath/
xsltproc basic.xsl source.xml > $servpath/services.xml
xsltproc full.xsl source.xml > $servpath/services-full.xml
xsltproc table.xsl source.xml > $servpath/rows.txt

# END
