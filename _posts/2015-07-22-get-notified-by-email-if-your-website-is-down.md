---
layout:     post
title:      Get notified by email if your website is down
subtitle:   A simple home-grown solution implemented with RaspberryPi and Python
date:       2015-07-22 08:00:00
header-img: "img/post_2015-07-22.jpg"
---

## Background

Say you run a website or a few, maybe even as a part of your business. It's naturally in your interest to minimize the amount of downtime your site(s) experience. In case you run your own (virtual) servers, you wanna be notified as soon as possible if there's some abnormalities with your sites' operation.

## Idea

Have a credit-card sized computer (RaspberryPi) running a script at certain intervals (say, every 5min) that requests the desired URL(s) and checks that

1. the HTTP server responded/didn't time out and
2. the response received contained some predefined text

The predefined text searched for in #2 should be unlikely to change by content modifications and should also be unlikely to exist in possible error messages issued by the HTTP server.

If both of the above conditions are met, let's consider the URL/site in question to be operating as expected.

## What you'll need

## Hardware and software
- [RaspberryPi][rpi] with ethernet
	- either RPi1 model B/B+ or RPi2
	- these are probably available at your local dealer
- At least a 4GB SD card with the [Raspbian operating system][raspbian] on it
	- with RPi2 you'll need to use a microSD card
	- Instructions for [writing Raspbian to SD card][raspbian-to-sd]
- An Internet connection to connect the RPi to

It's possible to use other hardware than the RaspberryPi (for example [BananaPi][bananapi], [Beaglebone][beaglebone], your old laptop, a virtual server different than the ones you're monitoring) and another OS than Raspbian, but for the sake of this article, we'll stick with RPi and Raspbian.

### Credentials

- SMTP server settings of your Internet Service Provider
	- and possibly username/password for the SMTP server

Due to Gmail nowadays requiring OAuth2 for using Gmail SMTP, and since using plain password-based SMTP was more straight-forward for me to implement in a short time, the solution presented here will not work with Gmail's SMTP servers.

## Costs

A RaspberryPi, depending on the model, will run you roughly a maximum of around 50 euros/dollars. Add a 4GB or larger (micro) SD card and you're in the 55 euros/dollars ballpark.

## Building our home-grown solution

Boot up your RaspberryPi and hook it with a monitor and keyboard or alternatively log into it using SSH. If you're running Windows on your laptop/desktop that you're reading this on, use [PuTTY for the SSH connection][putty-to-rpi]. The default Raspbian username and password can be seen on the Raspbian download page.

### Changing your RaspberryPi password

You SHOULD NOT be running your RaspberryPi with the default username and password. Change your password now by running:

{% highlight bash %}
passwd
{% endhighlight %}

### Installing dependencies

Now that you've got your RaspberryPi "under your fingertips", either with monitor+keyboard or over SSH, issue the following command at the shell (the black screen with white text):

{% highlight bash %}
sudo apt-get install python-requests -y
{% endhighlight %}

If you received no errors, you're ready to move forward.

### The monitoring script

Here's the Python script that will do most of the job. This is a Python2 script and will not work with Python3:

{% highlight python %}
#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author:     Janne Cederberg (http://jannecederberg.fi)
# License:    http://unlicense.org/
# Disclaimer: Use at your own risk. This is a Python2 script and will not work with Python3.

import smtplib, requests, socket

SMTP_SERVER = 'your.smtp-server.isp.com:587'
SENDER      = 'sender@isp.com' # ISP's SMTP policy might require "...@isp.com"
RECIPIENT   = 'your@email.com'
SMTP_USER   = 'smtp-username'
SMTP_PASS   = 'smtp-password'
EMAIL_TITLE = 'Websites down?'
EMAIL_BODY  = 'The following addresses/sites do not seem to work normally:'

# THIS IS THE LIST OF URLs AND TEXT STRINGS TO LOOK FOR IN EACH URL
checklist = [
    {'url': 'http://example.com', 'html': u'text to look for'},
    {'url': 'http://example2.com/sub/page/', 'html': u'text to look for'}
]

# NO NEED TO EDIT BEYOND THIS POINT

problems = []

for item in checklist:
    try:
        r = requests.get(item['url'])
        index = r.text.find(item['html'])
        if index == -1:
            problems.append(item['url'])
    except requests.exceptions.ConnectionError:
        problems.append(item['url'])

if len(problems) > 0:
    try:
        server = smtplib.SMTP(SMTP_SERVER)
        server.starttls()
        server.login(SMTP_USER, SMTP_PASS)
        msg = 'From: %s\nTo: %s\nSubject: %s\n\n%s\n' % (SENDER, RECIPIENT, EMAIL_TITLE, EMAIL_BODY)
        for p in problems:
            msg += '  - %s\n' % p
        print 'Sending email to %s' % RECIPIENT
        server.sendmail(SENDER, RECIPIENT, msg)
        server.quit()
    except smtplib.SMTPException:
        print 'Sending notification email failed.'
    except socket.gaierror:
        print 'Unable to access SMTP server.'
{% endhighlight %}

### Saving the script to your RPi

#### Method 1: Copy and paste

To get a copy of the script to your RaspberryPi, either run the following command on the RPi

{% highlight bash %}
nano monitor-websites.py
{% endhighlight %}

and then paste the code in and hit <kbd>Ctrl+X</kbd> followed by <kbd>Y</kbd>.

#### Method 2: Download the script

Make sure your RPi is connected to the Internet and run the following command on it:

{% highlight bash %}
wget http://jannecederberg.fi/files/monitor-websites.py
{% endhighlight %}

### Making the script file executable

Next, make the script executable by running the following on the RPi:

{% highlight bash %}
chmod 700 monitor-websites.py
{% endhighlight %}

This will set the read (4), write (2) and execute (1) permission (4+2+1 = 7) for script owner (you) and no permissions (0) for group and world.

The reason for revoking permissions from group and all was since the script contains our SMTP username and password.

More info on [Linux file permissions][linux-file-perm].

### Running the script manually

Ok, we're almost done. Currently we can run the above script manually by typing:

{% highlight bash %}
./monitor-websites.py
{% endhighlight %}

You can try purposefully setting the script so that it looks for text the corresponding URL does not contain in order to make sure it's working and sending you the expected notification email. This will simulate a situation where your website is running some CMS (like WordPress) and for example WordPress has lost it's connection to its database.

On the other hand, if you have the technical possibility of shutting down the server running the URL, you can try this as well to see what happens when the server is entirely unreachable.

### Running the script automatically at desired intervals

For the actual implementation, we don't want to be running the monitoring script manually. We want our RPi to run it for us, for example every 5 minutes. 

To make that happen, we need a standard Linux tool called [Cron][cron].

#### Finding script's absolute path

To use Cron, we need to know the full path of our script. To find this out, run the following command:

{% highlight bash %}
pwd
{% endhighlight %}

Most likely the output will be <kbd>/home/pi</kbd> which would mean that the full path of your script is <kbd>/home/pi/monitor-websites.py</kbd>.

#### Setting Cron to run our script

Cron has its own syntax for defining which a script/program gets run. Possibilities are vast, for example *"every day at time X"* or *"every first monday of the month"* etc. To edit Cron settings, run:

{% highlight bash %}
crontab -e
{% endhighlight %}

Now use the arrow keys to move all the way down below the commented-out lines (lines starting with #) and enter the following line:

{% highlight bash %}
*/5 * * * * /home/pi/monitor-websites.py
{% endhighlight %}

Now press <kbd>Ctrl+X</kbd> followed by <kbd>Y</kbd> to save. (I'm assuming here that [Nano][nano]
is being used as Cron editor, which is the default in Raspbian.)

What this does is define our script to run every 5 minutes around the clock all year long. If you want some other kind of interval, study the [Cron syntax][cron].

## Congratulations!

Hooray! You've now created your own system to monitor your website(s) and get notified by email if some problems are detected.

The solution is by no means perfect but provided some peace-of-mind compared to simply manually checking every now and then that your sites are running as they're supposed to.

## Comments / questions?

If you have any comments, questions, spotted some errors or have some improvement ideas, leave a comment below :)

[rpi]: https://www.raspberrypi.org/products/
[raspbian]: https://www.raspberrypi.org/downloads/
[raspbian-to-sd]: https://www.raspberrypi.org/documentation/installation/installing-images/
[bananapi]: http://www.bananapi.org/
[beaglebone]: http://beagleboard.org/bone
[putty-to-rpi]: https://raspberrypi4dummies.wordpress.com/2013/03/17/connect-to-the-raspberry-pi-via-ssh-putty/
[linux-file-perm]: http://www.linux.org/threads/file-permissions-chmod.4094/
[cron]: https://en.wikipedia.org/wiki/Cron
[nano]: https://en.wikipedia.org/wiki/GNU_nano