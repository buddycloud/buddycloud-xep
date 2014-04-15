buddycloud-xep
==============

This XEP defines the XMPP protocol for buddycloud servers and clients.

Built using https://github.com/lloydwatkin/xep-builder

## Building the XEP

```bash
make
open index.html
```

## Editing the XEP

XEP sections are held in the subdirectory. Edit these as appropriate and then build as above.

When files are pushed to the master branch in buddycloud/buddycloud-xep if valid travis-ci will build the HTML file and deploy to the URLs below.

### Building the XEP as you work

```
npm install -g grunt-cli
npm i .
grunt
```

Every time you now edit an xml file the XEP will be rebuilt

## Build status

[![Build Status](https://travis-ci.org/buddycloud/buddycloud-xep.png?branch=gh-pages)](https://travis-ci.org/buddycloud/buddycloud-xep)

http://buddycloud.github.io/buddycloud-xep/

## Next steps

* restructure according to https://github.com/buddycloud/buddycloud-xep/issues/6

- 1. Introduction
- 2. what is a channel?
- 3. Register
  - creates your channels
  - default set is...
- 4. discovery
  - DISCO
  - DNS (implement this SRV record)
- 5. node configuration
  - get 
  - set
    - minimum setting/optional
    - recommended fallbacks
- 6. items
  - publish 
     - rules
  - retract
  - retrieve (mention mam)
    - search
    - firehose
- 7. subscriptions 
  - retrieve (mention mam)
  - subscribe
  - unsubscribe
  - manange
- 8. affiliations
  - retrieve (mention mam)
  - manage
- 9. federation
  - inbox
  - interaction with other services
