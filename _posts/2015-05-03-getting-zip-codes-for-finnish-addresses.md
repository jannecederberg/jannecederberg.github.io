---
layout:     post
title:      Getting zip codes for Finnish addresses
subtitle:   and automating the process using Python
date:       2015-05-03 09:00:00
header-img: "img/post_2015-05-03.jpg"
---

## Background

Should you ever be looking to find postal codes (or ZIP codes as you Americans like to call them) for Finnish cities and/or street addresses, the Finnish Postal service ([Posti][posti]) offers a [manual postal code search interface][postinrohaku].

On quick inspection I was unable to find a Posti-provided English UI for the postal code search but it seems someone has [implemented the same functionality][postal-search] elsewhere.

Using the search UI provided by Posti is of course is very useful for making a small amount of searches now and then; but should you need to run a larger amount of searches, it gets pretty tedious pretty darn quick.

## In search for an API

(In case you're thinking *"What the heck is an API?"*, it stands for [*Application Programming Interface*][api]. APIs  can take varied forms but the main idea is that they're an alternative user interface (UI) to using some system. Using an API takes more skill as it's not point-n-click like the a browser interface for example. On the flipside, you gain possibilities not easily achievable in point-n-click UIs; for example easier automation.)

So roughly a month ago I needed to get postal codes for a large amount Finnish cities. I was fine with simply getting the postal code for the city center.

So the obvious is to embark on a mission to find an API to help me get this done. It didn't take more than one zip of coffee and the same amount of [Google search][lmgtfy-postal]es to spot [{API:Suomi}][apisuomi-postal]'s entry depicting an [API for Finnish postal codes][floapps-postal] created by a company called [Flo Apps][floapps].

"The API seems to be able to provide data in both XML and JSON, cool, seems all good!", I thought after a quick skim.

The thing that put me off from using the API though was the requirement to register by email; or actually not so much that as the statement that followed: *"Tunnuksia aktivoidaan noin kerran kuussa."* In case you don't read Finnish, it translates to: *"New accounts will be activated approximately once a month."*

Unfortunately, I didn't have a month to wait. It was a weekend and I wanted to be done with the whole thing and postal-codes-in-hand within a few hours if possible.

## Other options?

### Posti's address data dump files

Now while writing this article I found source data for another approach which I didn't use a month ago though. It turns out Posti does offer [Finnish address data in machine-readable format][address-data]! It appears this data has been publicly available only since the beginning of 2015! Cool :) See also the [Terms of Service][address-data-tos] and [FAQ][address-data-faq].

### The approach I opted for

As I didn't come across the aforementioned address data a month ago when needing it, I resorted to writing a [Python][python] script to simply query the [Postinumerohaku][postinrohaku] browser UI and scraping data from the result pages' HTML output.

## Let's get coding

### Examining HTML

Once settled with the approach to solving the problem I whipped out my code editor and also started looking at the HTML markup on a [random postal code search result page][julkulanniementie]<sup>1</sup>. The essential part of the HTML looks like this (after a bit of cleaning up):

{% highlight html linenos=table %}
...
<table class="hidden-xs" width="740">
  <tr class="table-head">
    <th>Kadunnimi</th>
    <th>&nbsp;</th>
    <th>Toimipaikka</th>
    <th>Kunta</th>
  </tr>
  <tr>
    <td>	
      <div>Julkulanniementie&nbsp;</div>
    </td>
    <td></td>
    <td>
      70260&nbsp;&nbsp;&nbsp;
      KUOPIO&nbsp;
    </td>
    <td>
      Kuopio&nbsp;
    </td>
  </tr>
</table>
...
{% endhighlight %}

The HTML doesn't contain much of any useful class or id names. There is the <kbd>hidden-xs</kbd> class on the <kbd>table</kbd> tag as seen on line 2, which later helps in identifying the correct portion of HTML in our Python code.

As you can see, the result (postal code) we want to be able to extract is located on line 15 above. It's obviously not line 15 of the actual output though as the above is only a segment thereof.

### Let's have our pet Python eat some HTML

I'll just present the code first and then explain parts of it.

Please notice that there is a small deliberate error in the code so you can't abuse Posti's servers without first correcting the error and hence knowing at least partially what you're doing:

{% highlight python linenos %}
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from bs4 import BeautifulSoup
import requests as req
from urllib2 import quote

API_URL = 'http://www.verkkoposti.com/e3/postinumeroluettelo?po_commune_radio=zip&streetname=%s&po_commune=%s&zipcode='

def get_zipcode(street, community)
  street = street.decode('utf-8').encode('iso-8859-1')
  community = community.decode('utf-8').encode('iso-8859-1')

  r = req.get(API_URL % (quote(street), quote(community)))
  data = BeautifulSoup(r.text)

  if r.status_code == 200:
    try:
      if street == '':
        # If only city name was provided
        return data.body.find('tr', {'class': 'table-head'}).parent.find_all('tr')[1].find('td').find('a').string.strip()
      else:        
        # If both street name and city name were provided
        return data.body.find('table', {'class': 'hidden-xs'}).find_all('tr')[1].find_all('td')[2].string.strip()[0:5]
    except Exception, e:
      return ''
  else:
    return ''


# MAIN
if __name__ == '__main__':
  if len(sys.argv) == 3:
    street = sys.argv[1]
    community = sys.argv[2]
  elif len(sys.argv) == 2:
    street = ''
    community = sys.argv[1]
  else:
    print 'Usage: python %s [<street>] <community/city>' % sys.argv[0]
    exit(0)

  try:
    print get_zipcode(street, community)
  except Exception, e:
    raise e

{% endhighlight %}

So I saved this file as <kbd>postinumerot.py</kbd> which stands for *postalcodes.py* in Finnish. On lines 4-7 we first import some libraries we'll be needing:

{% highlight python %}
import sys
from bs4 import BeautifulSoup
import requests as req
from urllib2 import quote
{% endhighlight %}

We'll use <kbd>sys.argv</kbd> for accessing command-line parameters, [<kbd>BeautifulSoup</kbd>][bs4] is an HTML parser, *[<kbd>Requests</kbd>][requests] is an HTTP library for human beings* :D and from <kbd>urllib2</kbd> we'll be using the <kbd>quote</kbd> method for some URL escaping.

Line 9 defines the URL that we'll be sending our queries to. The <kbd>%s</kbd> symbols are placeholders for character sequences (also called *strings*, hence the *s*) to be inserted into them upon query execution:

{% highlight python %}
API_URL = 'http://www.verkkoposti.com/e3/postinumeroluettelo?po_commune_radio=zip&streetname=%s&po_commune=%s&zipcode='
{% endhighlight %}

Lines 11-29 define a function called <kbd>get_zipcode</kbd> that takes <kbd>street</kbd> and <kbd>community</kbd> strings as parameters. The first parameter can be an empty string:

{% highlight python linenos %}
def get_zipcode(street, community)
  street = street.decode('utf-8').encode('iso-8859-1')
  community = community.decode('utf-8').encode('iso-8859-1')

  r = req.get(API_URL % (quote(street), quote(community)))
  data = BeautifulSoup(r.text)

  if r.status_code == 200:
    try:
      if street == '':
        # If only city name was provided
        return data.body.find('tr', {'class': 'table-head'}).parent.find_all('tr')[1].find('td').find('a').string.strip()
      else:        
        # If both street name and city name were provided
        return data.body.find('table', {'class': 'hidden-xs'}).find_all('tr')[1].find_all('td')[2].string.strip()[0:5]
    except Exception, e:
      return ''
  else:
    return ''
{% endhighlight %}

Someone might argue that a better order of parameters would've been *community* followed by *street* and they would correct. I'm presenting the code unmodified/unpolished based :)

Anyway, on line 5 of the above listing is an important part: that's where we actually make a request to the Posti servers. On line 6 we use <kbd>BeautifulSoup</kbd> to create an object based representation of the textual data we obtained using the call on line 5. On line 8 we're referring to [HTTP status codes][http-status] in which 200 indicates the preceding request succeeded.

Lines 12 and 15 traverse the object tree derived from raw HTML and find the data we want, postal codes that is. Please notice that the result page markup differs depending on whether you search on community/city name only or if you also include the address. Try [address and city][julkulanniementie] and [city only][kuopio] searches to see for yourself.

## Done, mostly

That's most of the work done right there. The lines at the end define what happens when the file is run from command line:

{% highlight python %}
# MAIN
if __name__ == '__main__':
  if len(sys.argv) == 3:
    street = sys.argv[1]
    community = sys.argv[2]
  elif len(sys.argv) == 2:
    street = ''
    community = sys.argv[1]
  else:
    print 'Usage: python %s [<street>] <community/city>' % sys.argv[0]
    exit(0)

  try:
    print get_zipcode(street, community)
  except Exception, e:
    raise e
{% endhighlight %}

So basically we can now get postal code data for an address as follows on the command line:

{% highlight bash %}
python postinumerot.py "Julkulanniementie 2" Kuopio
{% endhighlight %}

Which should simply print: *70260*

## Making the script executable

To make your script executable and hence to not have to type in <kbd>python</kbd> at the beginning of the command every time, you can run this command:

{% highlight bash %}
chmod u+x postinumerot.py
{% endhighlight %}

Now you could run the command in a slightly shorter form, namely:

{% highlight bash %}
./postinumerot.py "Julkulanniementie 2" Kuopio
{% endhighlight %}

## What's next?

This code will only run a single query per call. The next part would be to have your whatever data source (for example CSV file) and then run queries for each of the records in the CSV/database. That's going to be the topic of the next article though.

## Disclaimer

Code in this article is provided the way it ended up when I was done with it and succeeded in getting the data I needed.

There is a deliberate error in the code presented to prevent the reader from running it without understanding what they're doing. This is to prevent the reader from possibly getting into trouble with Posti. I won't be putting the code on GitHub or other code hosting platform before making sure it's ok with Posti.

By using code presented here, you're doing it on your own responsibility. This article is provided for educational purposes. Respect Posti's terms of service.

## Footnotes

- <sup>1</sup> This is the address I grew up/lived at between ages 6-19.


[address-data]: http://www.posti.fi/business/send/postal-code-services/
[address-data-tos]: http://www.posti.fi/liitteet-yrityksille/ehdot/postinumeropalvelut-palvelukuvaus-ja-kayttoehdot-en.pdf
[address-data-faq]: http://www.posti.fi/liitteet-yrityksille/muut/postinumeropalvelut-faq-en.pdf
[address-dump]: ftp://webpcode:webpcode@ftp2.itella.com/unzip/BAF_20150418.dat
[api]: http://en.wikipedia.org/wiki/Application_programming_interface
[apisuomi-postal]: http://apisuomi.fi/shop/json/ilmainen-postinumerorajapinta/
[bs4]: http://www.crummy.com/software/BeautifulSoup/bs4/doc/
[floapps-postal]: http://www.floapps.com/lab/postinumerot/
[floapps]: http://www.floapps.com/
[http-status]: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes#2xx_Success
[julkulanniementie]: http://www.verkkoposti.com/e3/postinumeroluettelo?po_commune_radio=zip&streetname=Julkulanniementie+2&po_commune=kuopio&zipcode=
[kuopio]: http://www.verkkoposti.com/e3/postinumeroluettelo?po_commune_radio=zip&streetname=&po_commune=kuopio&zipcode=
[lmgtfy-postal]: http://lmgtfy.com/?q=postinumerohaku+api
[posti]: http://www.posti.fi/index-en.html
[posti-license]: http://www.posti.com/kayttoehdot/
[postinrohaku]: http://www.posti.fi/postinumerohaku/
[postal-search]: http://postalcode.globefeed.com/Finland_Postal_Code.asp
[python]: http://en.wikipedia.org/wiki/Python_%28programming_language%29
[requests]: http://docs.python-requests.org/en/latest/