---
layout:     post
title:      Get graded on your website SSL/TLS certificate implementation
subtitle:   Not all SSL/TLS implementations are the same
date:       2016-01-27 15:00:00
header-background: "#06B006"
light-heading: false
category:   webdev
---

I think it was earlier this month when I came across an SSL/TLS certificate grading system that seemed very similar in idea as Google's [PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/). The way I understood it, the idea is simple: specify a URL for an `https://` website and it'll take a look at security aspects and possible concerns of the implementation.

**Take a look: <https://www.ssllabs.com/ssltest>**

Check some sites you commonly visit for example and see their grade :)

I personally learned a few new things and upped my certificate grades from the B-C range to A+.

![Partial example of SSL/TLS grading result](/img/ssl-labs-grading.png)

The above is actually a mere fraction of the report provided by the service.

## What's SNI and how does it relate to HTTP/2?

The example report states: *This site works only in browsers with SNI support.* *SNI* stands for [*Server Name Indication*](https://en.wikipedia.org/wiki/Server_Name_Indication) and it's GREAT!

Back in the day, before SNI, you could host a maximum of only one *SSL/TLS* certificate per IP address. Technically the certificate could've been issued covering multiple domains but nevertheless it was very limiting for running websites as `https://`. With the new [*HTTP/2* protocol](https://en.wikipedia.org/wiki/HTTP/2) certificates will be mandatory for pretty much all practical applications ([though not by the spec](https://en.wikipedia.org/wiki/HTTP/2#Encryption)) and hence, especially for smaller sites and webhotel services *SNI* is going to be a BIG deal.

You may also want to listen to Google's [Ilya Grigorik talk about the HTTP/2 protocol](https://changelog.com/161/) on the [Changelog](https://changelog.com/) podcast:

<audio src="http://fdlyr.co/d/changelog/cdn.5by5.tv/audio/broadcasts/changelog/2015/changelog-161.mp3" controls="controls" preload="none" style="width:100%;"></audio>

## SSL/TLS grades for a few websites

The grades in parenthesis are the grades the services received from SSL Labs test at the time of writing in the American grading of A+ to F with F meaning failing:

- [Facebook.com](https://www.ssllabs.com/ssltest/analyze.html?d=facebook.com) (B)
- [Google.com](https://www.ssllabs.com/ssltest/analyze.html?d=google.com) (B)
- [LinkedIn](https://www.ssllabs.com/ssltest/analyze.html?d=linkedin.com) (A)
- [Twitter.com](https://www.ssllabs.com/ssltest/analyze.html?d=twitter.com) (A+)
- [Changelog.com](https://www.ssllabs.com/ssltest/analyze.html?d=changelog.com) (A+) - the source of the great podcast above

Please notice that running the test takes a few minutes if results are not in the cache of the service.

## Further reading on SSL/TLS

- [Basics of TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security)
- [Detecting Certificate Authority compromises and web browser collusion](https://blog.torproject.org/blog/detecting-certificate-authority-compromises-and-web-browser-collusion)
- [The EFF SSL Observatory](https://www.eff.org/observatory)
- [Letsencrypt.org](https://letsencrypt.org) - They offer FREE domain-validated certificates! Sponsored by Chrome, Firefox, Facebook, Cisco, EFF and others.