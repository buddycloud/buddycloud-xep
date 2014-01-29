#!/usr/bin/env python

# File: announce.py
# Version: 0.1
# Description: a script for announcing registry changes
# Last Modified: 2004-10-27
# Author: Peter Saint-Andre (stpeter@jabber.org)
# License: public domain
# HowTo: ./announce.py filename (without extension!)

# IMPORTS:
#
import glob
import os
from select import select
import smtplib
import socket
from string import split,strip,join,find
import sys
import time
from xml.dom.minidom import parse,parseString,Document

def getText(nodelist):
    thisText = ""
    for node in nodelist:
        if node.nodeType == node.TEXT_NODE:
            thisText = thisText + node.data
    return thisText

# READ IN ARGS: 
#
# 1. registry file name
regname = sys.argv[1];

regfile = regname + '.xml'

# PARSE REGISTRY HEADERS:
#
# - title
# - version
# - initials
# - remark

thereg = parse(regfile)
regNode = (thereg.getElementsByTagName("registry")[0])
headerNode = (regNode.getElementsByTagName("meta")[0])
titleNode = (headerNode.getElementsByTagName("title")[0])
title = getText(titleNode.childNodes)
revNode = (headerNode.getElementsByTagName("revision")[0])
versionNode = (revNode.getElementsByTagName("version")[0])
version = getText(versionNode.childNodes)
initialsNode = (revNode.getElementsByTagName("initials")[0])
initials = getText(initialsNode.childNodes)
remarkNode = (revNode.getElementsByTagName("remark")[0])
remark = getText(remarkNode.childNodes)

# what kind of action are we taking?
regflag = ""
if (version == "0.1"):
    regflag = "new"

# SEND MAIL:
#
# From: registrar@xmpp.org
# To: standards@xmpp.org
# Subject: UPDATED REGISTRY: $title
# [or "NEW REGISTRY:" if version 0.1]
# Body:
#    The $title registry has been updated.
#    Version: $version
#    Changelog: $remark ($initials)
#    URL: http://www.xmpp.org/registrar/$regname.html

fromaddr = "registrar@xmpp.org"
# for testing...
# toaddrs = "stpeter@jabber.org"
# for real...
toaddrs = "standards@xmpp.org"

if regflag == "new":
    thesubject = 'NEW REGISTRY: '
    announceline = 'The ' + title + ' registry has been created.'
else:
    thesubject = 'UPDATED REGISTRY: '
    announceline = 'The ' + title + ' registry has been updated.'
thesubject = thesubject + title

versionline = 'Version: ' + version
changelogline = 'Changelog: ' + remark + ' (' + initials + ')'
urlline = 'URL: http://www.xmpp.org/registrar/' + regname + '.html'

msg = "From: XMPP Registrar <%s>\r\n" % fromaddr
msg = msg + "To: %s\r\n" % toaddrs
msg = msg + "Subject: %s\r\n" % thesubject
msg = msg + announceline
msg = msg + "\r\n\n"
msg = msg + versionline
msg = msg + "\r\n\n"
msg = msg + changelogline
msg = msg + "\r\n\n"
msg = msg + urlline
msg = msg + "\r\n"

server = smtplib.SMTP('localhost')
server.set_debuglevel(1)
server.sendmail(fromaddr, toaddrs, msg)
server.quit()

# END

