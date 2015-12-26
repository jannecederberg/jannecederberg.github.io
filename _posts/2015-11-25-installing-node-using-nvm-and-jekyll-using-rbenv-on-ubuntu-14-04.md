---
layout:     post
title:      Installing Node.js using NVM and Jekyll using rbenv on (X)ubuntu 14.04
subtitle:   
date:       2015-11-25 12:00:00
header-img: 2015-11-25.jpg
header-img-mobile: 2015-11-25_mobile.jpg
category:   system configuration
tags:
  - node
  - ruby
  - jekyll
---

Disclaimer: This post is primarily self-documentational. It's probably not entertaining (at least for the majority of people :)

## Background

My laptop has been working great for over three years running Windows 7 and (X)ubuntu side-by-side. In the past few weeks though it's been freezing kinda frequently. I ran system diagnostics tests and the hard drive failed a few tests. So I thought the problems must trace back to the hard drive; so I got a new one, a 500GB SSD drive. And as a sidenote it's pretty fast: booting Xubuntu 14.04 from power button to ready in 13 seconds.

Anyway, so on the old hard drive I had Windows 7 and Xubuntu 14.04 side-by-side. I had more space allocated for the Windows partition than I now wanted and as a result had been thinking of reinstalling everything for several months already. So when I installed the new hard drive, I didn't opt for cloning the old one but installing everything afresh.

## Installing Node using Node.js Version Manager (NVM)

### Old way using apt-get

Though I mostly don't code for/with Node.js, there are a few toolchain reasons why I need Node.js. I could simply use `sudo apt-get install nodejs npm` (like I had done when installing it on the previous hard drive) but the repository packages tend to be old in terms of how quickly Node.js development is moving.

### New way using NVM

So after a bit of research I figured using [Node Version Manager](https://github.com/creationix/nvm) would probably be the best route. So this is what I did:

#### Install NVM

{% highlight bash %}
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
{% endhighlight %}

This will install NVM in your home directory (`~/.nvm`) and add a few NVM-related initialization lines in your `~/.bashrc`.

#### Install Node and NPM

Next, select and install the version of Node.js that you want to install. You can install multiple versions. You can list all the available versions with `nvm ls-remote`. Initially I went with

{% highlight bash %}
nvm install 5.1.0
{% endhighlight %}

for installing the newest version that was available at the time.

#### Success...and not

After installation was done I ran `node -v` and `npm -v` to make sure everything seemed to be working correctly; and both worked ok...except when I started a new console window and tried again with `node -v` and `npm -v` they both reported the required commands were not found.

#### Fixing 'No command found'

Initially I simply opted for adding the following to the end of my `~/.bashrc` after the few lines that were added by the NVM installation: `export PATH="$NVM_DIR/versions/node/v5.1.0/bin:$PATH`. This essentially permanently adds the Node path to the beginning of the `PATH` variable.

Later I realized that a better solution for the same problem is:

{% highlight bash %}
nvm alias default node
{% endhighlight %}

This approach doesn't modify the `~/.bashrc` file but uses the NVM related stuff that's already there. This is the correct way of approaching the issue.

## But why did Node.js go from 0.12.x to 4.0.0 ?

As a side-note, in case you're wondering why Node.js versioning jumped from 0.12.x to 4.0, [read the background](http://apmblog.dynatrace.com/2015/09/05/all-you-need-to-know-about-node-js-4-0/).

## Installing Ruby and Jekyll using rbenv

Another tool I need is [Jekyll](https://jekyllrb.com/), which I use for example for authoring this blog. Jekyll is a [Ruby](https://www.ruby-lang.org) [gem](https://rubygems.org/gems/jekyll) so I'll be needing Ruby as well.

When I initially started using Jekyll a few years ago it was a bit of a pain getting it set up. I was kinda fearing it might be a pain now as well. And I was right.

### apt-get vs. rbenv vs. rvm

Earlier I had installed Ruby 1.9.3-dev using `sudo apt-get install ruby1.9.3-dev` or something along those lines. I remember it was a pain with all the dependency problems due to compiling. I didn't wanna use `apt-get` again for this even though I normally like it.

So my choices are *rbenv* and *rvm*. After doing some reading I came to the conclusion that of the two, *rbenv* is a more light-weight and less intrusive approach so I opted for that. In addition to the [official documentation](https://github.com/rbenv/rbenv), [DigitalOcean's tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04) proved to be great.

### Installing dependencies

So short-n-sweet, this is what I did:

{% highlight bash %}
sudo apt-get update

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
{% endhighlight %}

as suggested by the above mentioned DigitalOcean tutorial. Actually I had already installed *git*, *curl* and *build-essential* earlier so I left them out.

### Installing rbenv

The following will first clone *rbenv* in your home directory under the `.rbenv` subdirectory. After that it was add initialization code to your `~/.bashrc`:

{% highlight bash %}
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
{% endhighlight %}

### Preparing to install Ruby

The following will clone the required stuff to make installing Ruby quick-n-easy. Without the following you won't have `rbenv install` available to you:

{% highlight bash %}
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
{% endhighlight %}

### Finally installing Ruby

Once you're this far you're now ready to install Ruby. To list the available version, run `rbenv install --list`. Once you've selected the version to use (like here I opted to use version `2.2.3`), you can run the installation:

{% highlight bash %}
rbenv install -v 2.2.3
rbenv global 2.2.3
{% endhighlight %}

Notice that the `-v` flag is actually not referring to version in this case (as you might think) but is a flag to turn the verbose installation mode on. More info about install flags: `rbenv help install`.

### Installing Jekyll

The newest version of Jekyll is now v3.0.1. I tried this first but some of my sites broke on so I went to v2.5.3. Here's a [list of the available Jekyll versions](https://rubygems.org/gems/jekyll/versions). Installing it goes as follows:

{% highlight bash %}
gem install jekyll -v 2.5.3
{% endhighlight %}

### Almost done...

Initially it turned out Jekyll 2.5.3 didn't seem to work at all but was giving me a major crash every time. The crash was relating to execjs not being able to run. After a while of trying I realized the problem was that I had not done `nvm alias default node` as explained earlier in this article. Node.js was not in `PATH` and as a result Jekyll didn't run.

## Conclusion

After a fair amount of frustration, `nvm`, `node`, `npm`, `rbenv`, `ruby` (2.2.3) and `jekyll` (v2.5.3) now work correctly, yey!

Another approach would be to automate this using [Ansible](https://ansible.com) for example. But as

1. I need to do this only once every few years and
2. things change rapidly in the tech field,

the automation solution I would create might become obsolete before I'd ever need to use it again.

Deriving from [xkcd](https://xkcd.com)'s excellent break-down, if doing something once every two years and being able to save 2 hours by automation, I shouldn't be using more than 5 hours on optimizing the process. And the gain from optimization is tallied across a five year time in xkcd's calculation. In five years things change A LOT. So basically, it's very iffy whether it's worth automating setting up your own workstation...unfortunately...

Unless I've completely missed something essential :)

[![XKCD: Is it worth the time?](http://imgs.xkcd.com/comics/is_it_worth_the_time.png)](https://xkcd.com/1205/)