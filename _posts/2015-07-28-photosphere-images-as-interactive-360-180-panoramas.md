---
layout:     post
title:      "PhotoSphere images as interactive 360&deg; by 180&deg; panoramas"
subtitle:   "It's like pouring a jar of awesome-sauce on panorama images!"
date:       2015-07-28 14:30:00
header-img: "img/post_2015-07-28.jpg"
---

## TL;DR

### 360&deg; by 180&deg; panoramas made real easy

Here's the result of putting my first full 360&deg; by 180&deg; PhotoSphere photo online as an interactive panorama. Heavy lifting is done by [Google Camera][gcamera] (panorama stitching), [Jérémy Heleine][jh]'s [Photo-Sphere-Viewer][psv] and [Three.js][three.js].

Try grabbing the panorama below and moving left/right/up/down. Also notice that you can animate the view by clicking on the icon at bottom-left:

<div id="panorama"><em>(Panorama will load here if WebGL is enabled on your browser)</em></div>

The above panorama is a view from outside the [Linnanmäki][lintsi] amusement park's south entrance in Helsinki, Finland. See the [location on Google Maps][location].

### Try it yourself with your photos

In case you wanna give it a shot yourself, using your own panorama photos, scroll to the bottom of the article.

## Longer story

### Linnanmäki with niece and nephew

The last time I went to [Linnanmäki][lintsi] to actually go to the amusement rides was exactly two weeks ago. My niece (7y) and nephew (5y) were also there and were thrilled, except for the occasional dissapointments the younger had to face when being too short for some of the rides he would've wanted to catch.

### "Could you get me some Linnanmäki photos?"

I live very close to the amusement park and on a semi-regular basis walk through the area for example before or after going jogging.

A few days ago my niece asked me if I could go and get some photos from Linnanmäki for her so she could use them for example as wallpaper photos on her smartphone. I had forgotten about it and today she asked me about the photos and so I went specifically to take and send photos for her :)

### No panorama?

First off snapping some normal portrait oriented photos and sending them to her as I snapped along; then wanting to take a panorama shot I realized my resently-rooted [OnePlus One][oneplusone] currently running [CyanogenMod 12.1[cm12] (Android 5.1 Lollipop) didn't support panorama...I was a bit confused since previously when running CyanogenMod 11 panoramas were no problem.

### Solution and epiphany

Quick online search later I realized and app called *[Google Camera][gcamera]* existed that I hadn't even heard even though apparently it's been around for a while already!

On some article I quickly skimmed about the app the writer mentioned the PhotoSphere feature of the app. Having played with manual panorama stitching and creating 360&deg; by 180&deg; panoramas ("full around" panoramas) around the early 2000s I immediately guessed what PhotoSphere would most likely do for me and was more than eager to try it out!

### First go on Google Camera's PhotoSphere

Stitching spherical panoramas back in the day was a whole lot of work. I think I used Paint Shop Pro 4 or something like that at the time. Fast-forward to today and using the PhotoSphere feature I was able to create better-looking panoramas in a matter of minutes while on the go!

Quickly getting the hang of how the PhotoSphere feature of the app worked I walked around the amusement park taking a few more shots, though none of them being full 360&deg; by 180&deg; as that requires almost a few dozen still shots and I didn't wanna stand in one place that long just taking photos.

### Making the panoramas interactive

Right after taking a few of the panoramas with PhotoSphere I thought there's gotta be a JavaScript based interactive viewer for them already, probably on GitHub. A quick online search and guess confirmed.

I used [Jérémy Heleine][jh]'s [Photo-Sphere-Viewer][psv] which is based on [Three.js][three.js] to create the interactive panorama view you saw at the beginning of the article.

## Want to try with your own images right now?

Install [Google Camera][gcamera] on your smartphone, create a PhotoSphere image and then load it here either directly from your phone (if your phone's browser supports WebGL) or alternatively load the created image from your phone to your computer and then here.


<form method="get" action="">
    <input type="file" name="pano" id="panorama-selector" />
</form>
<div id="your-panorama"><em>Your panorama image will appear here!</em></div>

That's all for now :)


[lintsi]: http://www.linnanmaki.fi
[location]: https://www.google.fi/maps/@60.1866079,24.9397097,110m/data=!3m1!1e3
[oneplusone]: https://oneplus.net/one
[cm12]: http://wiki.cyanogenmod.org/w/Install_CM_for_bacon
[gcamera]: https://play.google.com/store/apps/details?id=com.google.android.GoogleCamera
[jh]: http://jeremyheleine.me/#photo-sphere-viewer
[psv]: https://github.com/JeremyHeleine/Photo-Sphere-Viewer
[three.js]: http://threejs.org/

<script src="/js/three.min.js"></script>
<script src="/js/photo-sphere-viewer.js"></script>
<script>
window.onload = function() {
    loadPredefinedPanorama();
    document.getElementById('panorama-selector').addEventListener('change', upload, false);
};

// Load the predefined panorama
function loadPredefinedPanorama() {
    var div = document.getElementById('panorama');
    var PSV = new PhotoSphereViewer({
            // Path to the panorama
            panorama: '/img/post_2015-07-28_photosphere_example.jpg',
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

// Load a panorama stored on the user's computer
function upload() {
    // Retrieve the chosen file and create the FileReader object
    var file = document.getElementById('panorama-selector').files[0];
    var reader = new FileReader();

    reader.onload = function() {
        var div = document.getElementById('your-panorama');
        var PSV = new PhotoSphereViewer({
                // Panorama, given in base 64
                panorama: reader.result,
                // Container
                container: div,
                // Deactivate the animation
                time_anim: false,
                // Display the navigation bar
                navbar: true,
                // Set max tilt angle
                tilt_up_max: 40,
                // Resize the panorama
                size: {
                        width: '100%',
                        height: '400px'
                    }
            });
    };
    reader.readAsDataURL(file);
}
</script>