---
layout:     post
title:      DVB-T reception using VLC
subtitle:   Because Kaffeine didn't seem to work
date:       2017-04-08 08:30:00 +0200
#header-img: "2017-03-14.png"
light-heading: true
---

I don't own a TV but today wanted to watch a hockey game. I've got a USB attachable Realtek RTL2832U DVB-T adapter. Assuming you're running Ubuntu Linux and the DVB-T dongle works, this should do it:

1. `sudo apt-get install w-scan`
2. `w_scan -c FI -L > channels.xspf`
3. `vlc channels.xspf`

The `FI` above refers to the country you're in; use `w_scan -c ?` to get a list of available country codes.