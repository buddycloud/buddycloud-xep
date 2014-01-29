#!/usr/bin/env python

# File: calgen.py
# Version: 0.1
# Description: generate various calendar files
# Last Modified: 2009
# Author: Tobias Markmann (tm@ayena.de)
# HowTo: ./calgen.py

## LICENSE ##
#
# Copyright (c) 1999 - 2009 XMPP Standards Foundation
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
## END LICENSE ##

import pickle
import commands
import os
import re
import sys
import getopt
import glob
import traceback

from xml.dom.minidom import parse,parseString,Document,getDOMImplementation
from datetime import datetime, timedelta
from icalendar import Calendar, Event, Alarm, UTC, vText

CALPATH = "/var/www/vhosts/xmpp.org/calendar"

allevents = [];

def getText(nodelist):
    thisText = ""
    for node in nodelist:
        if node.nodeType == node.TEXT_NODE:
            thisText = thisText + node.data
    return thisText

class XEPInfo:
	def __init__(self, filename):
		thexep = parse(filename)
		xepNode = (thexep.getElementsByTagName("xep")[0])
		headerNode = (xepNode.getElementsByTagName("header")[0])
		titleNode = (headerNode.getElementsByTagName("title")[0])
		self.title = getText(titleNode.childNodes)
		self.nr = getText((headerNode.getElementsByTagName("number")[0]).childNodes)
		abstractNode = (headerNode.getElementsByTagName("abstract")[0])
		abstract = getText(abstractNode.childNodes)
		statusNode = (headerNode.getElementsByTagName("status")[0])
		self.status = getText(statusNode.childNodes)
		lastcallNode = (headerNode.getElementsByTagName("lastcall"))
		if lastcallNode:
			lastcallNode = lastcallNode[0]
			self.lastcall = getText(lastcallNode.childNodes)
		else:
			self.lastcall = False
		self.type = getText((headerNode.getElementsByTagName("type")[0]).childNodes)
		revNode = (headerNode.getElementsByTagName("revision")[0])
		version = getText((revNode.getElementsByTagName("version")[0]).childNodes)
		self.date = getText((revNode.getElementsByTagName("date")[0]).childNodes)
	
	def getNr(self):
		return self.nr
	
	def getTitle(self):
		return self.title
	
	def getStatus(self):
		return self.status
	
	def getType(self):
		return self.type
	
	def getDate(self):
		return self.date
		
	def getLastCall(self):
		return self.lastcall

class SimpleEvents:
	def __init__(self, filename):
		self.eventList = []
		eventfile = parse(filename)
		eventsNode = (eventfile.getElementsByTagName("events")[0])
		for event in eventsNode.getElementsByTagName("event"):
			ev = {}
			if event.getElementsByTagName("all-day"):
				ev['all-day'] = True
				
			if event.getElementsByTagName("date"):
				ev['date'] = getText((event.getElementsByTagName("date")[0]).childNodes)
			
			if event.getElementsByTagName("duration"):
				ev['duration'] = getText((event.getElementsByTagName("duration")[0]).childNodes)
			
			if event.getElementsByTagName("summary"):
				ev['summary'] = getText((event.getElementsByTagName("summary")[0]).childNodes)
			
			if event.getElementsByTagName("description"):
				ev['description'] = getText((event.getElementsByTagName("description")[0]).childNodes)
			
			if event.getElementsByTagName("url"):
				ev['url'] = getText((event.getElementsByTagName("url")[0]).childNodes)
				
			if event.getElementsByTagName("alarm"):
				ev['alarm'] = True
			
			self.eventList.append(ev)
		
	def getEventList(self):
		return self.eventList

def parseXEP( cal, xep_file ):
	xep = XEPInfo(xep_file)
	day = timedelta(days=1)
	if xep.getStatus() == "Experimental":
		date = xep.getDate()
		last_updated = datetime.strptime(xep.getDate(), "%Y-%m-%d")
		expires = last_updated + timedelta(days=365)
		# print "XEP-" + xep.getNr() + ": " + xep.getTitle() + " expires on " + str(expires)
		event = Event()
		event.add('summary', "XEP-" + xep.getNr() + ": " + xep.getTitle() + " expires")
		event.add('dtstart', expires.date())
		event.add('dtend', (expires + day).date())
		event.add("dtstamp", (expires + day).date())
		event.add("url", "http://xmpp.org/extensions/xep-" + xep.getNr() + ".html")
		cal.add_component(event)
		allevents.append(event)
	elif xep.getLastCall():
		lastcall_end = datetime.strptime(xep.getLastCall(), "%Y-%m-%d")
		event = Event()
		event.add('summary', "Last Call for XEP-" + xep.getNr() + ": " + xep.getTitle() + " ends")
		event.add('dtstart', lastcall_end.date())
		event.add('dtend', (lastcall_end + day).date())
		event.add('dtstamp', (lastcall_end + day).date())
		event.add('url', "http://xmpp.org/extensions/xep-" + xep.getNr() + ".html")
		cal.add_component(event)
		allevents.append(event)

def genExtensionsCalendar( cal_file ):
	cal = Calendar()
	cal.add('prodid', '-//calgen.py//xmpp.org//')
	cal.add('version', '2.0')
	files = glob.glob('extensions/xep-????.xml')
	files.sort(key=lambda x: x.lower())
	for file in files:
		parseXEP( cal, file)
	
	f = open( cal_file , 'wb')
	f.write(cal.as_string())
	f.close()

def genCalendarFromEventsFile( events_file, cal_file ):
	try:
		events = SimpleEvents( events_file )
		cal = Calendar()
		cal.add('prodid', '-//calgen.py//xmpp.org//')
		cal.add('version', '2.0')
		day = timedelta(days=1)
	
		for ev in events.getEventList():
			event = Event()
			if "date" in ev:
				ev["date"] = ev["date"].rstrip("Z")
			
			if "all-day" in ev:
				start = datetime.strptime(ev["date"], "%Y-%m-%d") # T%H:%M:%S
				event.add('dtstart', start.date())
				event.add('dtend', (start + day).date())
				event.add("dtstamp", (start + day).date())
			else:
				start = datetime.strptime(ev["date"], "%Y-%m-%dT%H:%M:%S")
				start = start.replace(tzinfo=UTC)
				duration = timedelta(minutes=int(ev["duration"]))
				event.add('dtstart', start)
				event.add('dtend', (start + duration))
				event.add("dtstamp", (start + duration))
			if "alarm" in ev:
				alarm = Alarm()
				alarm_time = datetime.strptime(ev["date"], "%Y-%m-%dT%H:%M:%S")
				alarm_time = alarm_time.replace(tzinfo=UTC)
				alarm_time = alarm_time - timedelta(minutes=15)
				alarm.add("trigger", alarm_time)
				alarm.add("action", "display")
				event.add_component(alarm)
			if "summary" in ev:
				event.add('summary', ev["summary"])
			if "description" in ev:
				event.add('description', ev["description"])
			if "url" in ev:
				event.add('url', ev["url"])
			
			cal.add_component(event)
			allevents.append(event)
	
		f = open( cal_file , 'wb')
		f.write(cal.as_string())
		f.close()
	except:
		print "File not found! - " + events_file
		print "Unexpected error:", sys.exc_info()[0]
		traceback.print_exc(file=sys.stdout)

def genCalendarForTeam( name ):
	genCalendarFromEventsFile("xsf/teams/" + name + "/events.xml", CALPATH + "/team-" + name + ".ics")

def genAllEventsCalendar( cal_file ):
	cal = Calendar()
	cal.add('prodid', '-//calgen.py//xmpp.org//')
	cal.add('version', '2.0')
	for event in allevents:
		cal.add_component(event)
	
	f = open( cal_file , 'wb')
	f.write(cal.as_string())
	f.close()

def main(argv):
	os.umask(0012)
	# TODO jabbers anniversary January 4 1999 in the all and XSF calendar 
	# General XSF
	genCalendarFromEventsFile("council/events.xml", CALPATH + "/xsf-council.ics")
	genCalendarFromEventsFile("xsf/board/events.xml", CALPATH + "/xsf-board.ics")
	genCalendarFromEventsFile("xsf/events.xml", CALPATH + "/xsf-xsf.ics")
	
	# XSF Teams
	genCalendarForTeam("communication")
	genCalendarForTeam("infrastructure")
	genCalendarForTeam("techreview")
	
	genExtensionsCalendar(CALPATH + "/xsf-extensions.ics")
	genAllEventsCalendar(CALPATH + "/xsf-all.ics")
	
	genCalendarFromEventsFile("summit/events.xml", CALPATH + "/xsf-summit.ics")

if __name__ == "__main__":
	main(sys.argv[1:])
