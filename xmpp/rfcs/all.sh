#!/bin/sh
# for each RFC XML file, generates HTML file and TXT file
# usage: ./all.sh

rfcpath=/var/www/vhosts/xmpp.org/rfcs

xml2html=/usr/local/share/xml2rfc/xml2html
xml2txt=/usr/local/share/xml2rfc/xml2txt

ls rfc*.xml > tmp1.txt
sed s/^rfc// tmp1.txt > tmp2.txt
sed s/.xml$// tmp2.txt > names.txt
rm tmp*.txt

while read f
do
    $xml2html rfc$f.xml
    $xml2txt rfc$f.xml
done < names.txt

rm names.txt

cp rfc*.xml $rfcpath/
mv rfc*.html $rfcpath/
mv rfc*.txt $rfcpath/
cp reference*.xml $rfcpath/
cp index.shtml $rfcpath/

# END
