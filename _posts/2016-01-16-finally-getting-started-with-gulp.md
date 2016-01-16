---
layout:     post
title:      Getting started with task runners
subtitle:   "Playing with <img src='/img/logos/gulp-white-text.svg' style='height:1.7em; display:inline;'> for the first time in production"
date:       2016-01-16 17:00:00
header-background: "#cf4646"
light-heading: false
category:   webdev
tags:
  - node
  - npm
  - gulp
---

I've been meaning to get acquinted with a web development related task runner like [Grunt](http://gruntjs.com), [Gulp](http://gulpjs.com) or [Webpack](https://webpack.github.io/) for quite a while now. The only reason I've been able to "avoid" using them for this long is due to not doing web development fulltime.

So today I figured I need an asset compilation pipeline for minifying JavaScript assets and decided to give Gulp a go. Had been reading enough to know Gulp is the new Grunt. Some would say Webpack is the new Gulp. I decided to go with Gulp due to having seen/heard it mentioned most lately.

## What I wanted to achieve

Short and simple, I wanted to be able to streamline minifying and/or obfuscating JavaScript.

I had already set up my (X)ubuntu machine for `npm` using `nvm` so getting started with Gulp was straight-forward. 

## Homework

I started by reading this article: <https://markgoodyear.com/2014/01/getting-started-with-gulp/>

## Preparation

1. Install Gulp globally by `npm install gulp -g`
2. Open shell, `cd` to project folder.
3. `npm init` if you had not done that yet.
4. `npm install gulp gulp-uglify gulp-js-obfuscator --save-dev`

As a sidenote, I actually tried multiple obfuscator modules from <https://www.npmjs.com/browse/keyword/obfuscate> before settling on `gulp-js-obfuscator`.

## First `gulpfile.js`

So here's my first `gulpfile.js`. No default task, nothing fancy, just tasks to `uglify` (minify) and `obfuscate` *.js files in the `src` directory and place the output files in `dist`:

{% highlight javascript %}
var gulp = require('gulp'),
    uglify = require('gulp-uglify'),
    obfuscate = require('gulp-js-obfuscator');

gulp.task('uglify', function() {
    return gulp.src('src/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('dist'));
});

gulp.task('obfuscate', function() {
    return gulp.src('src/*.js')
        .pipe(obfuscate())
        .pipe(gulp.dest('dist'));
});
{% endhighlight %}

To run the tasks, use `gulp uglify` and `gulp obfuscate` on the command line.

## Next things to do

One of the next things would be to add [`jshint`ing](https://en.wikipedia.org/wiki/JSHint) as well as a `gulp watch` task and support for LiveReload. But I don't need those at the moment.