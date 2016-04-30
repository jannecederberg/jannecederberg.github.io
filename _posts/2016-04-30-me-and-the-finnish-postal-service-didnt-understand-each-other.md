---
layout:     post
title:      Me and the Finnish postal service didn't understand each other
subtitle:   "Note to self: keep tech jargon to a minimum if you're not SURE you'll be understood :)"
description: "I tried to tell the Finnish postal service that their SSL/TLS certificate had expired. I ended up failing due to - I guess - using too technical language."
keywords:   "ssl,tls,certificate,expiry,posti,itella,prinetti"
date:       2016-04-30 13:20:00 +0300
header-background: "#ff9326"
light-heading: true
category:   infosec
langcode:   en
colorbox:   false
---

I learned a lesson on clear communication today :)

Today in the morning I was going to print some mailing labels for my [Nettiniilo](https://nettiniilo.fi) products for shipping them to clients. Went I went to log into the Finnish postal service's webservice to create the mailing labels I was faced with first this:

![Connection to label creation service simply died](/img/posti-prinetti-certificate-dead.png)

And with a bit more inspection this:

![Certificate seems to have been expired](/img/posti-prinetti-certificate-dead2.png)

This was late in the evening so I simply tweeted [@Postigroup](https://twitter.com/postigroup) about it. It turned out my message apparently was not understood and in the morning they asked me to contact their (semi-expensive) helpdesk number thinking this was yet another support request. I needed to explain: "No, this is not only affecting me, this is affecting ALL of YOUR clients. YOU should fix it asap."

I did apologize for starting out [the conversation](https://twitter.com/jrcberg/status/726284457020395520) with such tech jargon though :)

[![Twitter discussion regarding Prinetti certificate expiration](/img/posti-prinetti-certificate-twitter-conversation.png)](https://twitter.com/jrcberg/status/726284457020395520)

As summary, note to self: don't use technical terms unless you're sure the recipient understands them :)