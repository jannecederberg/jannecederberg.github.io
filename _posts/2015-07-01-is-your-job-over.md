---
layout:     post
title:      Is your job over?
subtitle:   Humans need not apply...
date:       2015-07-01 12:00:00
header-img: 
---


## What do you do to earn your keep?

Stop for a moment to think about what it is that you do daily to put fulfill your basic necessities of food and shelter. What is it?

How much thought have you given to what enabled to be doing what you're doing? I mean, from the point of view of what made it possible for you to not have to be hunting/gathering for food all day long?

## Life a long time ago

This pseudo code written using Python syntax (and written to add a bit of humor value) probably illustrates some aspects of a hunting and gathering society:

{% highlight python %}
from behavior import basics, romance
from past import survival_skills as skills
from memory import berry_recognition as berries, game_recognition as game

def hunt_and_eat(what):
  try:
    prey = skills.hunt(what)
    if prey:
      food = basics.prepare(prey)
      basics.eat(food)
      return true
    else:
      return false
  except skills.DiedHuntingError:
    basics.yell("AAAAAERRRRRR!!")

if __name__ = "__main__":
  while True:
    if not basics.hungry:
      basics.think("I think I'll rest for one hour...")
      basics.rest(1)
      continue

    if berries.found(berries.EATABLE):
      basics.yell("Yeyi! Found berries!!")
      b = berries.collect(berries.EATABLE)
      basics.eat(b)
      basics.say("omnomnom")
    else:
      if hunt_and_eat(game.SMALL):
        basics.say("That was some good meat!")
      else:
        if hunt_and_eat(game.LARGE_OR_DEADLY):
          basics.say("Cool, didn't die today, and food was good!")
        else:
          basics.say("Hmm...getting a bit hungry...")

    basics.rest(1)
    basics.play_with_the_kids()

    if not basics.hungry:
      basics.have_conversation()
      romance.say_sweet_things_to_spouse_and_mean_it()
      romance.cuddle()
      romance.get_jiggy_with_it()
      basics.have_conversation()
      basics.rest(1)
{% endhighlight %}

## So what enabled you to do what you do?

> "From sticks to plows to tractors, we've gone from everyone needing to make food to modern agriculture with almost no-one needing to make food, and yet we still have abundance."

So basically, the development of farming tools enabled more efficient ways of acquiring food. This in turn has freed people to specialize as due to efficiency and trade not everyone needs to be involved in the acquisition of basic necessities on a day to day basis.

So in a nutshell, improved efficiency and automation have enabled you to not have to directly spend your time acquiring food but can trade (use money or other items with exchange worth) to get some.

## Can automation go too far?

First of all, we should define what *too far* means. The goal of automation has from the beginning been to create more for less effort; and as a result raise standards of living.

So I'm guessing most people would say automation has gone *too far* when automation starts to destroy what it was created to do, in other words, standards of living start to decline. *But how could that happen??*

Take a look at this 15 minute (and worth every minut of it) video by CGP Grey:

<p><iframe width="560" height="315" src="https://www.youtube.com/embed/7Pq-S557XQU" frameborder="0" allowfullscreen></iframe></p>

## Will your job be done by a (ro)bot?

It's not hard to tell there are incentives for businesses to reduce human labor and replace jobs with robots. What should you do then?

One thing you can do is take a look at this [NPR's interactive info graphic][npr] if **your** job is likely to be replaced by (ro)bots:

[![Will your job be done by a robot](/img/will-your-job-be-done-by-a-robot.png)][npr]

- Illustration: [Naftali Beder][illu]
- Data: [The Future of Employment: How Susceptible Are Jobs to Computerisation?][research]


## What if my job is replaced by a (ro)bot?

For example in the transportation industry, [BIG changes are about to happen][trucks].

In case you're currently studying, maybe evaluate your chosen field from the above point of view.

If you're already working in your chosen field but have a significant amount of years of work left, maybe consider working to develop additional skills (in a different field).


[bi]: https://en.wikipedia.org/wiki/Basic_income
[npr]: http://www.npr.org/sections/money/2015/05/21/408234543/will-your-job-be-done-by-a-machine
[illu]: http://naftalibeder.com/
[research]: http://www.oxfordmartin.ox.ac.uk/downloads/academic/The_Future_of_Employment.pdf
[trucks]: https://medium.com/basic-income/self-driving-trucks-are-going-to-hit-us-like-a-human-driven-truck-b8507d9c5961