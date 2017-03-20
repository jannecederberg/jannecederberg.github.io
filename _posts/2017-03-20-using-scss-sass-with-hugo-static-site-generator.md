---
layout:     post
title:      Using SCSS/SASS with Hugo static site generator
subtitle:   Quick note-to-self on how to set up asset building when using Hugo
date:       2017-03-20 08:30:00 +0200
#header-img: "2017-03-14.png"
light-heading: true
category:   webdev
tags:
  - hugo
  - gulp
  - npm
  - html
  - javascript
---


## Background to using Hugo

I've started to enjoy using [Hugo](https://gohugo.io) for static site generation due to it's speed and versatility. I've used [Jekyll](https://jekyllrb.com/) a lot before but the Go runtime (which is needed for Hugo) is also much easier to get rolling than Ruby + gems for Jekyll. I've also had the Ruby toolchain for Jekyll break multiple times in the past rendering me unable to update a given site before I fix the toolchain.

(As of writing this article, this blog is build using Jekyll but I'm considering converting it to using Hugo.)

## SCSS when using Hugo?

Today was searching on how to compile SCSS to CSS when using Hugo, as Hugo doesn't (at least as of v0.20-DEV) have build-in SCSS/SASS support. I case across this great article by [Dan Bahrami](https://twitter.com/dan_bahrami) and thought I'd at least document it for myself; Gulp is used for SCSS generation which is not as optimal as a solution based on Go (same lang as Hugo), but as I kinda dislike Ruby and am familiar with Gulp anyway, it seems pretty usable:

<http://danbahrami.io/articles/building-a-production-website-with-hugo-and-gulp-js/>