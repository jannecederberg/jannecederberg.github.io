---
layout:     post
title:      Views from Malta
subtitle:   "Warm, humid, pretty, and quite urban/asphalty"
date:       2015-10-08 13:00:00
header-img: 2015-10-08_1.jpg
header-img-extras:
    - 2015-10-08_2.jpg
    - 2015-10-08_3.jpg
    - 2015-10-08_4.jpg
    - 2015-10-08_5.jpg
    - 2015-10-08_6.jpg
    - 2015-10-08_7.jpg
    - 2015-10-08_8.jpg
---

[Friend of mine](https://twitter.com/caapoe) has been working in Malta since spring 2015. Since I had the possibility, I "transferred" my office to his living room for 10 days in mid-September. Mostly during the mornings I did work related stuff and then during afternoons went to look around Malta, both walking and by public transport.

In a way I enjoy taking public transit instead of for example taxi around places. It does take more time, but on the flipside, you get to experience life more as the locals do; in case you're into that. And I kinda tend to be.

## 360&deg; x 180&deg; panorama views around Malta

While out and about around Malta, I took some 360&deg; x 180&deg; panorama photos. Here's a glimpse of the places.

### Sliema ferries

This place was commonly called Sliema ferries; you could for example take a ferry to capital Valletta:

<div id="panorama1"></div>

### Sliema seafront view

This place was right down the street from my friend's apartment:

<div id="panorama2"></div>

### Valletta

I went to the Maltese capital of Valletta a few times just to walk around. The following view is from the [Misrah San Gorg](https://goo.gl/maps/ThumrVmWZwk){:target="_blank"} pretty much at the center of Valletta:

<div id="panorama3"></div>

### Tigné Point in Sliema

The [Tigné Point](https://en.wikipedia.org/wiki/Tign%C3%A9_Point){:target="_blank"} area is historically important, I've understood. Tigné Point is the peninsula that controls entry to the Sliema and Valletta bays. As Malta has been a center of Mediterranean trade for centuries this point has not gone unnoticed in terms of importance for whoever was in power at a given time.

Nowadays the "balcony" guard rail is full of love-locks which you can only partially see on the panorama. The way the panorama is initially pointed, on the right across the water you can see [St. Paul's Anglican Cathedral](https://www.google.fi/maps/place/St.+Paul's+Anglican+Cathedral/@35.9006965,14.5121536,19z/data=!4m2!3m1!1s0x0000000000000000:0x0464482fcf89b42b){:target="_blank"}.

[Panorama location on map](https://www.google.fi/maps/@35.9063752,14.5102211,46m/data=!3m1!1e3){:target="_blank"}

<div id="panorama4"></div>

### Mdina

[Mdina](https://www.google.fi/maps/place/Mdina,+Malta/@35.8860859,14.4034034,369m/data=!3m1!1e3!4m2!3m1!1s0x130e519568ce9a2f:0x99705c199db5bc13!6m1!1e1){:target="_blank"} is - as far as I understood - the place where the remaining architecture is the oldest still standing in Malta. Both of these panoramas are from inside the [Palazzo de Piro](https://www.google.fi/maps/place/Palazzo+de+Piro/@35.8865618,14.403508,185m/data=!3m1!1e3!4m2!3m1!1s0x0000000000000000:0xba1ba91d2c974958!6m1!1e1){:target="_blank"}.

#### View from Palazzo de Piro balcony

<div id="panorama5"></div>


## In summary

It was cool to take a change of scenario (even though I was still working) and go for a visit to Malta, a place I had never visited before. One thing I didn't do was taking the ferry to Sicily. Maybe next time.


<script src="/js/three.min.js"></script>
<script src="/js/photo-sphere-viewer.js"></script>
<script>
window.onload = function() {
    loadPredefinedPanorama('panorama1', '{{ site.panoramas-dir }}/malta/01-sliema-ferries.jpg');
    loadPredefinedPanorama('panorama2', '{{ site.panoramas-dir }}/malta/02-sliema-shore.jpg');
    loadPredefinedPanorama('panorama3', '{{ site.panoramas-dir }}/malta/03-valletta-square.jpg');
    loadPredefinedPanorama('panorama4', '{{ site.panoramas-dir }}/malta/04-sliema-tigne-point.jpg');
    loadPredefinedPanorama('panorama5', '{{ site.panoramas-dir }}/malta/05-mdina-palazzo-de-piro-balcony.jpg');
};

// Load the predefined panorama
function loadPredefinedPanorama(elemid, img) {
    var div = document.getElementById(elemid);
    var PSV = new PhotoSphereViewer({
            // Path to the panorama
            panorama: img,
            // Container
            container: div,
            // Deactivate the animation
            time_anim: false,
            // Display the navigation bar
            navbar: true,
            // Resize the panorama
            size: {
                    width: '100%',
                    height: '400px'
                }
        });
}
</script>