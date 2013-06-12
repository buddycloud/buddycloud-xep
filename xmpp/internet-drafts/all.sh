#!/bin/sh
# for each Internet-Draft XML file, generates HTML file and TXT file
# usage: ./all.sh

idpath=/var/www/vhosts/xmpp.org/internet-drafts

xml2html=/usr/local/share/xml2rfc/xml2html
xml2txt=/usr/local/share/xml2rfc/xml2txt

ls draft-*.xml > tmp.txt
sed s/.xml// tmp.txt > names.txt
rm tmp.txt

while read f
do
    $xml2html $f.xml
    $xml2txt $f.xml
done < names.txt

rm names.txt

mv draft-*.html $idpath/
mv draft-*.txt $idpath/
cp draft-*.xml $idpath/
cp index.shtml $idpath/

# END
