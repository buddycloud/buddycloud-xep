#!/bin/sh
# for one Internet-Draft XML file, generates HTML file and TXT file
# usage: ./gen.sh filename
# where filename is what comes after "draft-" and before ".xml"

idpath=/var/www/vhosts/xmpp.org/internet-drafts

xml2html=/usr/local/share/xml2rfc/xml2html
xml2txt=/usr/local/share/xml2rfc/xml2txt

$xml2html draft-$1.xml
$xml2txt draft-$1.xml

mv draft-$1.html $idpath/
mv draft-$1.txt $idpath/
cp index.shtml $idpath/

# END
