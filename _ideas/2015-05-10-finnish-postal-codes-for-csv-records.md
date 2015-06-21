---
layout:     post
title:      Finnish postal codes for CSV records
subtitle:   utilizing the previously created Python module
date:       2015-05-10 11:00:00
header-img: "img/post_2015-05-03.jpg"
---

## Background

In the [previous post][prev] the topic was writing a Python tool for extracting postal codes for Finnish street addresses and city/community names.

The code presented could be used from the command line without having to use a browser interface and hence could also be automated using any shell scripting functionality one could think of.

The point of this post is to use the previous piece of code as a Python module for code that iterates through a [CSV][csv] file containing contact information (and which could've been exported from Excel for example). For each record in the CSV file our code should get the postal code for the street address (if it is stored in the CSV) and otherwise get the postal code for the city/community center by calling `get_zipcode` function from the previous article with city/community name only.

As a result, we can get postal codes for any number of records, be it 100 or 100 000.

## Obtaining contact data in CSV

To start of, we need some data containing some sort of contact information etc. but missing postal codes. The data has a field for the postal codes but the field for all records is empty

The data could be obtained from a database or a spreadsheet for example and exported into CSV format for easier "malleability". The modified CSV can then imported back to where ever it is needed or it came from. How to do the import/export steps is not a concern of this article though.

## Example of CSV data

For the sake of this article, let's assume we have obtained CSV data in the following format:

<pre>
Company name;Contact person;Phone;Email;Street address;Postal code;City;Comments
ACME Corporation;John Doe;123 456 879;john@acme.com;Kauppakatu 10;;Kuopio;
Matin firma;Matti Meikäläinen;987 654 321;matti@firma.biz;;
...
</pre>

So basicall, each line represents a contact info records

[prev]: /2015/05/03/getting-postal-codes-for-finnish-addresses/
[csv]: http://en.wikipedia.org/wiki/Comma-separated_values