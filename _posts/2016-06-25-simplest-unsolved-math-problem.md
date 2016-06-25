---
layout:     post
title:      The simplest unsolved math problem
subtitle:   Exploring math with my daugher-in-law
description:
keywords:   "collatz conjecture,math,teaching,illustration,xkcd"
date:       2016-06-25 22:00:00 +0300
header-background: "#ff9326"
light-heading: true
category:   mathematics
langcode:   en
colorbox:   false
---

<script type="text/javascript" async
  src="//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

## Background

Yesterday with my daugher-in-law while watching some random YouTube videos we came across an interesting video about what the video claims to be the simplest unsolved (they use the word <em>impossible</em>) math problem:

<iframe width="560" height="315" src="https://www.youtube.com/embed/m4CjXk_b8zo" frameborder="0" allowfullscreen></iframe>

The problem presented is quite simple and is defined recursively as follows:
$$a_n = \begin{cases}
  n\in\mathbb{N}, \text{selected at will} & \text{if } n=1 \\
  \frac{a_{n-1}}{2} & \text{if } n \geq 2 \text{ and } n \text{ is even} \\
  3a_{n-1}+1  & \text{if } n \geq 3 \text{ and } n \text{ is odd}
\end{cases}$$

The claim is that the series formed by the aforementioned recursive definition will eventually always reach 1. This is also known as the [Collatz Conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture).

## Exploring the problem

The problem is quite readily understandable for a primary school student, my daugher-in-law being in 2<sup>nd</sup> grade at the moment and she was fashinated about it. We worked though the sequence starting from 10 and from 100 and reached 1 with both starting points.

Today to amuse myself and my daugher-in-law, I created the following illustration:

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  function luo_lista(aloitus) {
    lista = [];
    nykyinen = aloitus;
    index = 1
    lista.push([index, nykyinen]);
    while (nykyinen > 1) {
      if ( nykyinen%2 == 0 ) {
        nykyinen /= 2;
      } else {
        nykyinen = nykyinen*3 + 1;
      }
      lista.push([++index, nykyinen]);
    }
    return lista
  }

  google.charts.load('current', {'packages':['line', 'table', 'controls']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var aloitus = document.getElementById('aloitusarvo') ? parseInt(document.getElementById('aloitusarvo').value) : 100;
    var data = new google.visualization.DataTable();
    data.addColumn('number', 'Sequence member');
    data.addColumn('number', 'Values');

    data.addRows( luo_lista(aloitus) );

    var options = {
      chart: {
        title: '3n+1 problem',
        subtitle: ''
      },
      height: 500
    };

    var chart = new google.charts.Line(document.getElementById('linechart'));

    chart.draw(data, options);
    updateTableNumbers(lista);
    updateDetails(lista);
  }

  function updateTableNumbers(list) {
    var data = new google.visualization.DataTable();
    data.addColumn('number', 'n');
    data.addColumn('number', 'Value');
    data.addRows(list);

    var table = new google.visualization.Table(document.getElementById('numberlist'));
    table.draw(data);
  }

  function updateDetails(list) {
    var max = getMax(list);
    var count = list.length;
    document.getElementById('members').innerHTML = count;
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
</script>

<div class="container">
  <div class="row">
    <h2>Try it yourself</h2>
    <p>Alter the <em>sequence start</em> value either by <kdb>up/down</kbd> arrow keys or inputting a value and pressing enter.</p>
    <p>
      <strong>Sequence start:</strong> <input type="number" id="aloitusarvo" value="100" placeholder="Starting value" onchange="drawChart();"><br />
      <strong>Members:</strong> <span id="members"></span><br />
      <strong>Largest member:</strong> <span id="largest_member"></span>
    </p>
  </div>
  <div class="row">
    <div class="col-xs-9">
      <div id="linechart"></div>
    </div>
    <div class="col-xs-3">
      <div id="numberlist"></div>
    </div>
  </div>
</div>

<h2>Conclusion</h2>

<p>
  My daugher-in-law was excited about exploring this. She was fashinated/apparently surprised by the fact that mathematicians haven't been able to figure out why this works, e.g. that what ever positive whole number that you choose as the starting point, you'll eventually reach 1 no matter what.
</p>
<p>
  For her this was a though-experiment and some motivation regarding multiplication/division. For me it was a small quick-and-dirty data-illustration exercise :)
</p>

<h2>Humor segment</h2>
<p><a href="https://xkcd.com/710/">XKCD</a> has also covered the Collatz conjecture:</p>
<p><img src="http://imgs.xkcd.com/comics/collatz_conjecture.png" alt="XKCD: Collatz Conjecture" title="The Strong Collatz Conjecture states that this holds for any set of obsessively-hand-applied rules." /></p>
