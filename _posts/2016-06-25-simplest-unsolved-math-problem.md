---
layout:     post
title:      The simplest unsolved math problem
subtitle:   Exploring math with my 8 year old niece
description: "The Collatz conjecture provides for a fashinating and surprising mathematical exercise for primary school students and nevertheless is yet unsolved by professional mathematicians. Article contains an interactive illustration."
keywords:   "collatz conjecture,math,teaching,illustration,xkcd"
date:       2016-06-25 22:00:00 +0300
header-img: 2016-06-25.jpg
light-heading: true
category:   mathematics
langcode:   en
colorbox:   false
---

<script type="text/javascript" async="async"
  src="//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

## Background

Yesterday with my niece we came across an interesting YouTube video about what the video claims to be the simplest unsolved (they use the word <em>impossible</em>) math problem:

<iframe width="560" height="315" src="https://www.youtube.com/embed/m4CjXk_b8zo" frameborder="0" allowfullscreen></iframe>

In layman terms the problem is defined as follows:

1. Pick any positive whole number.
2. If the number is even, divide it by 2. If it was odd however, multiply it by 3 and add 1.
3. Repeat step 2 infinitely (or as hypothesized until you reach value 1, which should/seems to always happen).

Mathematically the same sequence is produced by this recursive definition:

$$a_n = \begin{cases}
  \text{Select any } & a_1\in\mathbb{N} \\
  \frac{a_{n-1}}{2} & \text{if } n > 1 \text{ and } a_{n-1} \text{ is even} \\
  3a_{n-1}+1  & \text{if } n > 1 \text{ and } a_{n-1} \text{ is odd}
\end{cases}$$

The claim is that the series formed by the aforementioned recursive definition will eventually always reach 1. This is also known as the [Collatz Conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture).

## Exploring the problem

The problem is quite readily understandable for a primary school student; my niece is 8 years old at the moment and she seemed fashinated by it. We worked though the sequence starting from 10 and from 100 and reached 1 with both starting points.

Today to amuse myself and my niece, I created the following illustration:

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  function generateList(start) {
    sequence = [];
    current = start;
    index = 1
    sequence.push([index, current]);
    while (current > 1) {
      if ( current%2 == 0 ) {
        current /= 2;
      } else {
        current = current*3 + 1;
      }
      sequence.push([++index, current]);
    }
    return sequence;
  }

  // using classic linecharts: https://developers.google.com/chart/interactive/docs/gallery/linechart
  google.charts.load('current', {'packages':['controls', 'corechart', 'table']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var start = document.getElementById('startValue') ? parseInt(document.getElementById('startValue').value) : 100;
    var data = new google.visualization.DataTable();
    data.addColumn('number', 'Sequence term index');
    data.addColumn('number', 'Values (y-axis) per index (x-axis)');

    data.addRows( generateList(start) );

    // https://developers.google.com/chart/interactive/docs/gallery/linechart#configuration-options
    var options = {
      legend: { position: 'none' },
      height: 400,
      hAxis: { title: 'Term index' },
      vAxis: { title: 'Collatz sequence value' },
    };

    // using classic linecharts: https://developers.google.com/chart/interactive/docs/gallery/linechart
    var chart = new google.visualization.LineChart(document.getElementById('linechart'));

    chart.draw(data, options);
    updateTableNumbers(sequence);
    updateDetails(sequence);
  }

  function updateTableNumbers(list) {
    var data = new google.visualization.DataTable();
    data.addColumn('number', 'Index (n)');
    data.addColumn('number', 'Values');
    data.addRows(list);

    var table = new google.visualization.Table(document.getElementById('numberlist'));
    table.draw(data);
  }

  function updateDetails(list) {
    var max = getMax(list);
    var count = list.length;
    document.getElementById('terms').innerHTML = count;
    document.getElementById('largest_member').innerHTML = max;
  }

  function getMax(list) {
    var max = Number.NEGATIVE_INFINITY;
    for ( var i=0; i<list.length; i++) {
      if ( list[i][1] > max ) {
        max = list[i][1];
      }
    }
    return max;
  }

  window.onresize = drawChart;
</script>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <h2>Try it yourself</h2>
      <p>Alter the <em>sequence start</em> value either by <kbd>up/down</kbd> arrow keys on the keyboard or inputting a value and pressing enter.</p>
      <p>
        <strong>Sequence start:</strong> <input type="number" id="startValue" value="30" placeholder="Starting value" onchange="drawChart();"><br />
        <strong>Term count:</strong> <span id="terms"></span><br />
        <strong>Largest term:</strong> <span id="largest_member"></span>
      </p>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12 col-md-9">
      <h3>Graph</h3>
      <div id="linechart"></div>
    </div>
    <div class="col-xs-12 col-md-3">
      <h3>Tabulated</h3>
      <div id="numberlist"></div>
    </div>
  </div>
</div>

## Conclusion

My niece seemed to enjoy exploring this. She was surprised by the fact that mathematicians haven't been able to figure out why this works, e.g. that whatever positive whole number that you choose as your starting point, you'll eventually reach 1 no matter what.

For her this was a though-experiment and some motivation regarding multiplication/division. For me it was a small quick-and-dirty data-illustration exercise :)

## Humor segment

[xkcd](https://xkcd.com/710/) has also covered the Collatz conjecture with an ironic twist:

<img src="http://imgs.xkcd.com/comics/collatz_conjecture.png" alt="xkcd: Collatz Conjecture" title="The Strong Collatz Conjecture states that this holds for any set of obsessively-hand-applied rules." />

## More on the Collatz conjecture

- [Collatz conjecture on MathWorld](http://mathworld.wolfram.com/CollatzProblem.html)
- [Interesting article regarding extending the Collatz conjecture over to complex numbers and drawing fractals](http://yozh.org/2012/01/12/the_collatz_fractal/)
  - Fractals are the kind of images that's used on the header image of this article