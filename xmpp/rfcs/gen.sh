#!/bin/sh
# for one RFC XML file, generates HTML file and TXT file
# usage: ./gen.sh num

rfcpath=/var/www/vhosts/xmpp.org/rfcs
xml2html=/usr/local/share/xml2rfc/xml2html
xml2txt=/usr/local/share/xml2rfc/xml2txt

$xml2html rfc$1.xml
$xml2txt rfc$1.xml

mv rfc$1.html $rfcpath/
mv rfc$1.txt $rfcpath/
cp reference.RFC.$1.xml $rfcpath/
cp index.shtml $rfcpath/

# END
