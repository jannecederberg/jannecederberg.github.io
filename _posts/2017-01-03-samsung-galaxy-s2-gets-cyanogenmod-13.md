---
layout:     post
title:      Samsung Galaxy S2 gets CyanogenMod 13
subtitle:   Installing CM13 (Android 6.0.1 Marshmallow) on Samsung GT-I9105plus
date:       2017-01-03 20:30:00 +0200
header-img: "2015-05-26.jpg"
category:   android
tags:
  - cyanogenmod
  - samsung
---

CyanogenMod just recently [got officially discontinued]({% post_url 2016-12-27-cyanogenmod-discontinued-and-birth-of-lineageos %}) but it seems [LineageOS](http://lineageos.org) (apparently run by a community of former CyanogenMod active contributers and [rumored to be lead by](https://twitter.com/cyanogen/status/812808407249887232) CyanogenMod "daddy" [Steve "Cyanogen" Kondik](https://twitter.com/cyanogen) himself) is continuing from where CyanogenMod (as supported/sponsored by Cyanogen Inc) stopped.

In the meanwhile though I wanted to install CM13 on Samsung Galaxy S2 (GT-I9105 international variant); CyanogenMod apparently never had official support for the GT-I9105plus version of the S2, only [GT-I9100](http://web.archive.org/web/20161224214832/https://download.cyanogenmod.org/?device=i9100). However from the [XDA-Developers forum](https://forum.xda-developers.com/galaxy-s2-plus/orig-development/rom-cyanogenmod-13-t3265341) I found links to unofficial builds of the CM13 ROM for GT-I9105plus.

The installation instructions I followed for installing TWRP recovery (v3.0.2.0) followed by CM13 + GApps 6.0 was a combination of instructions from [TWRP i9100 page](https://twrp.me/devices/samsunggalaxys2i9100.html) and the [Archive.org version of CM wiki for i9100](http://web.archive.org/web/20161224194651/https://wiki.cyanogenmod.org/w/Install_CM_for_i9100).

## Obtaining firmware files for i9105plus

### Obtain TWRP recovery binary

The phone I wanted to work with didn't have a custom recovery yet so I needed to install it. [twrp.me](https://twrp.me/devices/samsunggalaxys2i9100.html) only had an official build for i9100 but I found XDA Developer Forum user [GHsR's unofficial TWRP build for i9105p](https://s.basketbuild.com/devs/GHsR/RECOVERY/TWRP/i9105p). I used [twrp-3.0.2.0-s2vep-20160407.zip](https://s.basketbuild.com/filedl/devs?dev=GHsR&dl=GHsR/RECOVERY/TWRP/i9105p/twrp-3.0.2.0-s2vep-20160407.zip) for the simple reason that at the time it had most downloads (which I considered as "votes of trust").

### Obtain CM13

Just like for TWRP, GHsR has built [CM13](https://s.basketbuild.com/devs/GHsR/CM-13/i9105p) and [CM14.1](https://s.basketbuild.com/devs/GHsR/CM-14.1/i9105p) for Samsung i9105plus. I tried [cm-14.1-20161223-UNOFFICIAL-i9105p.zip](https://s.basketbuild.com/filedl/devs?dev=GHsR&dl=GHsR/CM-14.1/i9105p/cm-14.1-20161223-UNOFFICIAL-i9105p.zip) but it didn't seem stable enough based on some 20 minutes of trying. As the phone was going to be used by a kid, stability was important and so I ultimately settled with the newest available CM13 build, which happened to be [cm-13.0-20161228-UNOFFICIAL-i9105p.zip](https://s.basketbuild.com/filedl/devs?dev=GHsR&dl=GHsR/CM-13/i9105p/cm-13.0-20161228-UNOFFICIAL-i9105p.zip).

### Obtain Google Apps

For Google Play integration I downloaded the [Open GApps Nano variant for Android 6](http://opengapps.org/?api=6.0&variant=nano) (ARM build naturally as the i9105plus is ARM based). The end user wouldn't be needing Gmail, Google Maps, Google Calendar etc, just the Play store to be able to install a few apps/games and be able to make regular calls; hence I downloaded with the Nano variant.

## Preparation

Copy CM13 and GApps installation files (.zip) onto a MicroSD card and insert the card into the phone. You'll need these files immediately after installing TWRP recovery.

## Installing TWRP recovery

1. I used an Ubuntu Linux computer for this: `sudo apt-get install heimdall-flash-frontend`
2. Run `heimdall-frontend` as sudo.
3. Power off the phone, make sure it's not connected the the computer by USB.
4. Start the phone into Samsung's so-called *Download mode* by ***Volume down* + *Home* + *Power***.
5. Connect the phone by USB to the computer running *Heimdall*
6. In *Heimdall*'s *Utilities* menu 
	1. *Detect* (Output should read *Device detected*)
	2. *Download PIT* => *Save As...* => save PIT (partition information table) into a file.
7. In *Heimdall*'s *Flash* menu
	1. *Browse* (under *Options* / *PIT*) => select the prev saved PIT file.
	2. *Add* => in *Partition Name* choose *RECOVERY*
	3. *Browse* (under *File*) to select the TWRP recovery binary (.img)
	4. Select *No Reboot* checkbox
	5. *Start*
	6. Wait the blue progress bar on the phone to complete / *Heimdall* to tell you the process is complete.
	7. Power off the phone (even though the phone will instruct contrary).
	8. Power the phone back on (or if it powers on by itself, do this anyway) and enter into recovery mode by pressing ***Volume up* + *Home* + *Power*** until you get to TWRP recovery.
	9. Proceed to installing CM13 and GApps.

## Backing up stock firmware

Use *Backup* menu in TWRP recovery to create a backup of the stock firmware on the MicroSD card. This will require a bit under 2GB of free space on the card.

## Installing CM13 and GApps

1. In TWRP choose to add the CM13 and GApps .zip files to be installed.
2. When installation completes, reboot the phone.
3. The initial boot took some 5-7 minutes to complete.

## Conclusion

After getting everything installed, the phone seemed to work pretty well based on brief poking around. I was happy with the result.