#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author: Janne Cederberg (http://jannecederberg.fi)
# This is a Python2 script and will not work with Python3.

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
