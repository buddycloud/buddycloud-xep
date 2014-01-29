buddycloud-xep
==============

http://buddycloud.com/buddycloud-xep/buddycloud.html
http://buddycloud.com/buddycloud-xep/buddycloud.xml

This XEP defines the XMPP protocol for buddycloud servers and clients.

building the XEP

```bash
edit ./sections/{{ APPROPRIATE FILE }}
make
```

Next steps
----------

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
