---
layout:     post
title:      CyanogenMod 11 on Samsung Galaxy Note
subtitle:   Installing CM11 (Android 4.4.4 KitKat) on GT-N7000
date:       2015-05-26 12:00:00
header-img: "2015-05-26.jpg"
category:   android
tags:
  - cyanogenmod
  - samsung
---

Last weekend I visited my grandmother and aunt up in [Vuokatti][vuokatti] after heading a training session regarding the digitalization of high school final exams (A-levels) at the [Kajaani high school][kajaani-hs].

Upon visiting my aunt she mentioned her phone was not working too well and I took a quick look at it thinking I could probably install [CyanogenMod][cm] on it.

## CyanogenMod support

The device turned out to be [Samsung Galaxy Note (GT-N7000)][gt-n7000] and seemed to be [supported by CyanogenMod][cm-support]. Upon closer inspection I realized however that the instructions given on the previous page did not work for installing CM11 (which is based on Android 4.4.4 Kitkat). In fact, the [CyanogenMod info page][cm-n7000-info] only claims CM support for the device for CM9, CM10, CM10.1 and CM10.2.

To summarize, I successfully installed CM11 on the Samsung Galaxy Note (GT-N7000); read on for how I did it.

## Installation

These instructions are adopted from the corresponding [CM instructions][cm-support] and I might update the previous page accordingly at some point. I was working on an Ubuntu Linux and will write instructions from that point of view.

### Preparation

While running GT-N7000 before any changes, carry out the following steps. You may download the files either directly to the device or download the elsewhere first and then copy the resulting zip files onto the device:

1. Download your desired [CyanogenMod 11 build for the GT-N7000][download].
3. Download the [Google Apps package for CM11][apps] (not mandatory).

### Installing a custom recovery

First of all, you need to get a custom recovery onto the device. This particular device doesn't actually have to be rooted for this to succeed though. We'll use ClockworkMod 6.0.4.5.

#### Background to why CWM 6.0.4.3 is not sufficient

At the moment of writing the [ClockworkMod website][cwm] recommends/distributes CWM 6.0.4.3 for the GT-N7000, but this version will not work for flashing CM11 (Android 4.4.4 Kitkat). I actually tried using CWM 6.0.4.3 first but ran into the following error when trying to flash Kitkat: *set_metadata_recursive: some changes failed (Status 7)*.

#### Get CWM 6.0.4.5 onto the device

As mentioned, it turns out it's not necessary to root the device. Samsung has a so-called *Download Mode* in this device which allows for flashing a custom recovery:

1. `sudo apt-get install heimdall` (at the moment of writing: v1.4.0)<br/>This will install [Heimdall][heimdall] which is an open-source tool to replace Samsung's Odin and is used for interacting with Samsung's custom "Download Mode". The bad thing about Odin is that it's leakware and is only for Windows. In addition, there seem to be malware-plagued versions/software carrying the Odin name in circulation.
2. Download [n7000-CWM-KitKatCompatible.zip][cwm-n7000], *md5sum: 7bf5958940c4a16f7c46735f26fcf2bb*.
2. Unzip the file; the essential part is the <kbd>boot.img</kbd> file which we'll need in a moment.
3. Power down the GT-N7000 and make sure it is fully charged. Do not connect the device to your computer yet.
4. Start the GT-N7000 into *Download Mode* by pressing and holding:<br>**Volume down** + **Home** + **Power**.
5. Confirm the warning by pressing **Volume up**.
6. Connect the device with a USB cable to your computer.
7. `sudo heimdall flash --KERNEL boot.img --no-reboot`
8. You'll see a blue bar go across the screen.
9. When done, power off the device.
10. Start the device into CWM 6.0.4.5 by holding **Volume up** + **Home** + **Power** for something like 5-10 seconds.
11. Done with flashing custom recovery. Continue to flashing KitKat and Google Apps.

### Installing CM11 (Android KitKat)

1. Make a backup of the current system state in CWM.
2. In CWM main menu select **Install zip**
3. Locate the *cm-11-yyyymmdd-NIGHTLY-n7000.zip* file on the device and install it.

### Installing Google Apps

1. In CWM main menu select **Install zip**
2. Locate the Google Apps zip package on the device and install it.

## Finalizing the installation

1. Wipe user cache: **Data/Factory reset** => **Wipe cache**
2. Wipe Dalvik cache: **Advanced** => **Wipe Dalvik cache**
3. **Reboot system now**

Now you should be done :)

Please notice that if you did not wipe caches as instructed above, the bootup will not progress beyond the CyanogenMod boot animation.


[vuokatti]: https://www.google.fi/maps/place/88610+Vuokatti/@64.1457763,28.268999,5z/data=!4m2!3m1!1s0x4682f16866c1ee3f:0x0a0146d8a395b970
[kajaani-hs]: http://www.kajaaninlukio.fi/
[cm]: http://en.wikipedia.org/wiki/CyanogenMod
[gt-n7000]: http://www.gsmarena.com/samsung_galaxy_note_n7000-4135.php
[cm-support]: http://wiki.cyanogenmod.org/w/Install_CM_for_n7000
[cm-n7000-info]: http://wiki.cyanogenmod.org/w/N7000_Info
[heimdall]: http://glassechidna.com.au/heimdall/
[cwm]: http://clockworkmod.com/rommanager
[cwm-n7000]: /files/n7000-CWM-KitKatCompatible.zip
[download]: https://download.cyanogenmod.org/?device=n7000
[apps]: http://wiki.cyanogenmod.org/w/Google_Apps