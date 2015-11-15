---
layout:     post
title:      Google released parts of TensorFlow as open-source
subtitle:   Looking into the future of artificial intelligence
date:       2015-11-11 10:30:00
header-img: 2015-11-11.jpg
header-img-mobile: 2015-11-11_mobile.jpg
light-heading: true
category: programming
tags:
  - machine learning
  - video
---


A week ago on Nov. 3, 2015 I got an email from Madrid, Spain:

> "Hi Janne, I am a software engineer and part of the Developer Relations team with [source{d}][sourced], based in Madrid. We are working on improving developer recruitment. We have analyzed your open source contributions on Github and have concluded that your experience could be a good fit for the position of Fullstack Developer at Company XYZ."

I took a look at the website of the head-hunting company, [www.sourced.tech][sourced]:

> "source{d} is a recruitment product built by developers for developers. We analyze over 600 million code contributions in the open source community to match you with the best jobs and contact you only with relevant offers."

Ok, this is cool. There are tons of head-hunting companies around specializing in hunting tech professionals but so far I had not (consciously) come across one utilizing machine learning to such a large extent.

The position they offered at *Company XYZ* had to do with machine learning as well:

> "If selected, you will become part of building a new project aiming to change digital marketing and media. The focus is on creating a media analytics platform which allows for optimal campaign delivery, with predictive analysis built with machine learning and artificial intelligence principles."

## Artificial intelligence (AI) as a game-changer

I have some guesses as to why source{d}'s algorithm picked me as a potential candidate but that's beside the point of this article. The point is that utilization of artificial intelligence (AI) in a myriad of sectors/scopes/domains of application seems to be rapidly increasing. Here's some views into what seems to be coming:

<iframe width="560" height="315" src="https://www.youtube.com/embed/7Pq-S557XQU" frameborder="0" allowfullscreen></iframe>

In other words, it seems AI is about to cause some major disruption: creating new opportunities (e.g. head-hunter companies like *source{d}*) but probably also carving tombstones for other fields of business or companies refusing to change. There's also semi-unexpected, arguably controversial and even humoristic uses for machine learning, for example [Tinderbox](https://github.com/crockpotveggies/tinderbox).

## What would Google do?

### Deep Dreams: checking correctness of neural networks

 A June 2015 [article on the Google Research Blog](http://googleresearch.blogspot.com/2015/06/inceptionism-going-deeper-into-neural.html) depicts what the researchers (Alexander Mordvintsev, Christopher Olah and Mike Tyka) coin as deep dreams; [take a look at the gallery](https://photos.google.com/share/AF1QipPX0SCl7OzWilt9LnuQliattX4OUCj_8EP65_cTVnBmS1jnYgsGQAieQUc1VQWdgQ?key=aVBxWjhwSzg2RjJWLWRuVFBBZEN1d205bUdEMnhB) or [generate your own](http://deepdreamgenerator.com/).

Though the deep dreams images look cool, weird and artistic all at the same time, the point with them is getting a visual representation of what a given [artificial neural network](https://en.wikipedia.org/wiki/Artificial_neural_network) has learned in the training it has gone through. Why does this matter? Well, if you want a computer to be able to recognize birds for example, you want it to do it correctly. So the deep dreams images serve as a convenient way of checking validity of neural network output.

#### Why does correctness of neural network output matter?

Both image recognition and speech recognition are applications of neural networks. [Google Translate](https://translate.google.com) uses neural networks to first translate text into a mathematical multi-dimensional vector space and then project the vector data back into a textual representation in another language. AI (and neural networks as one way of implementing AI) are used all around us more and more...it's just not immediately apparent if you don't know what to "look for".

The correctness of interpretations and decisions made by AI and artificial neural networks matters at least for business reasons. It has for further-reaching implications as well though, for example playing a part in why [self-driving cars must be programmed to kill](http://www.technologyreview.com/view/542626/why-self-driving-cars-must-be-programmed-to-kill/) if they are to ever be commercially successful (outside the domain of long-haul trucks). That's radical.

### Google released parts of TensorFlow as open-source

On Nov. 9, 2015 a major shift in "Google policy" happened. Google has released lots of software for everyone to use along the years, most notably probably the Android operating system and Chromium/Chrome web browser. But from Google's point of view, those two are on the peripheries of what's internally most important to the company.

On Nov. 9, Google published a part of their internal machine learning system, TensorFlow, [on their research blog](http://googleresearch.blogspot.com/2015/11/tensorflow-googles-latest-machine_9.html), [TensorFlow.org](http://www.tensorflow.org) and on [GitHub](https://github.com/tensorflow/tensorflow).

Within four days since the first public commit on GitHub, the TensorFlow repository has received (up until the time of writing) 7948 stars, which is a lot: jQuery which is virtually used on every website on the Internet has 36660 stars in 9,5 years ([since Mar. 22, 2006](https://github.com/jquery/jquery/commit/8a4a1edf047f2c272f663866eb7b5fcd644d65b3)).

<iframe width="560" height="315" src="https://www.youtube.com/embed/oZikw5k_2FM" frameborder="0" allowfullscreen></iframe>

Most likely this release by Google is not going to slow down the development and utilization of machine learning principles into products and services; quite the contrary.

## Interested in machine learning?

During spring 2015 I completed Stanford University's 10 week machine learning course taught by [Baidu](https://en.wikipedia.org/wiki/Baidu)'s Chief Scientist [Andrew Ng](https://twitter.com/andrewyng) on [Coursera.org](https://www.coursera.org/learn/machine-learning). The course is free and a new run of it will be taught **[Nov. 30, 2015 - Feb. 22, 2016](https://www.coursera.org/learn/machine-learning)**! Consider taking it if you're even remotely interested!

Back in August I [tweeted](https://twitter.com/jannecederberg/status/630191860577923072) about the course and even got favorited by the official [@BaiduResearch](https://twitter.com/baiduresearch) account!

The course is very well organized and I would definitely recommend it. It does require proficiency in linear algebra (matrix operations) and programming to complete though. It took me approx 6-8 hours of work per week to complete. I do hold a master's degree with theoretical math as major and computer science as minor though, so with some other background it might require more (or less) time.

With regards to career choices though, I would guess there's going to be work for people skilled in the area of applying machine learning principles into existing as well as completely new domains.

## Comments / questions?

What kinds of thoughts and/or feelings does machine learning evoke in you? Leave a comment below.

Credits for header image: [Lubomir Panak](https://www.flickr.com/photos/drakh/19198374889/in/photolist-vfuFZB-vt1mdu-vfuGQV-vfbwAx-vwWYpZ-uzWoXh-uNKso8-vK2jUU-vHiH3L-vt1k3U-vKBwxi-vKBw4H-uA74Sx-uA74Jr-uzWoPb-vuDnw9-uA74tr-vFryWg-vVztsj-7KVinu-yHebWX-uzhGyA-vvgoBx-vdtts7-uzu9qy-uwNEAe-xeL5Mo-vqfxku-uA7474-vxj1pe-vfuG8T-vufgEb-vBzoxi-vRyANu-vccvpa-vP5TG6-uwNFpP-vu135n-uFhUqz-vPS3N7-uVah1w-vzyuXo-vHg1Tg-vyaask-wbpHjc-xa6NfH-vxukzi-uwD1u3-vtDCKF-xh1Dvt) (CC BY-NC)

[sourced]: http://sourced.tech