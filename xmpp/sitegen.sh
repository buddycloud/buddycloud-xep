#!/bin/sh
# copies permanent files for the xmpp.org website
# usage: ./sitegen.sh
#
# NOTE: after running this script, you still need to 
# run the all.sh scripts from the following directories:
#
# extensions/
# internet-drafts/
# registrar/
# rfcs/
# 

basepath=/var/www/vhosts/xmpp.org

cp about/*.* $basepath/about/
cp ca/*.* $basepath/ca/
cp council/*.* $basepath/council/
cp council/agendas/*.* $basepath/council/agendas/
cp council/members/*.* $basepath/council/members/
cp extensions/*html $basepath/extensions/
cp images/*.* $basepath/images/
cp includes/*.* $basepath/includes/
cp index.shtml $basepath/
cp favicon.ico $basepath/
cp interop/*.* $basepath/interop/
cp non-free/gps_datum.html $basepath/extensions/
cp non-free/*.gif $basepath/images/
cp non-free/*.jpg $basepath/images/
cp non-free/*.png $basepath/images/
cp robots.txt $basepath/
cp protocols/*.shtml $basepath/protocols/
cp registrar/*.html $basepath/registrar/
cp schemas/*.* $basepath/schemas/
cp services/*.* $basepath/services/
cp sitemap.xml $basepath/
cp software/*.* $basepath/software/
cp sorttable.js $basepath/
cp summit/*.* $basepath/summit/
cp tech/*.* $basepath/tech/
cp trademark/*.* $basepath/trademark/
cp xmpp.css $basepath/
cp xsf/*.* $basepath/xsf/
cp xsf/board/*.* $basepath/xsf/board/
cp xsf/board/meetings/*.* $basepath/xsf/board/meetings/
cp xsf/docs/*.* $basepath/xsf/docs/
cp xsf/members/*.* $basepath/xsf/members/
cp xsf/members/meetings/*.* $basepath/xsf/members/meetings/
cp xsf/people/*.* $basepath/xsf/people/
cp xsf/press/*.* $basepath/xsf/press/
cp xsf/proposals/*.* $basepath/xsf/proposals/
cp xsf/sponsors/*.* $basepath/xsf/sponsors/
cp xsf/teams/*.* $basepath/xsf/teams/
cp xsf/teams/infrastructure/*.* $basepath/xsf/teams/infrastructure/
cp xsf/teams/communication/*.* $basepath/xsf/teams/communication/
cp xsf/teams/techreview/*.* $basepath/xsf/teams/techreview/
cp js/*.* $basepath/js/

# END
