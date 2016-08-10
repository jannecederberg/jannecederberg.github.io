---
layout:     post
title:      Node.js using NVM and Jekyll using rbenv on (X)ubuntu 16.04
subtitle:   
date:       2016-08-10 23:00:00 +0300
header-img: 2015-11-25.jpg
header-img-mobile: 2015-11-25_mobile.jpg
light-heading: true
category:   system configuration
tags:
  - node
  - ruby
  - jekyll
---

Disclaimer: This article is an update on the [previous article regarding (X)ubuntu 14.04]({% post_url 2015-11-25-installing-node-using-nvm-and-jekyll-using-rbenv-on-ubuntu-14-04 %}). The post is primarily self-documentational and it's probably not entertaining (at least for the majority of people :)

## Background

I reinstalled my work machine from Xubuntu 14.04 to 16.04; I didn't on purpose do an upgrade but a full install just to start afresh. This is article is just a short updated summary of installing `NVM`, `Node.js`, `npm`, `rbenv`, `ruby` and `jekyll`.

## Installing Node using NVM

{% highlight bash %}
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
{% endhighlight %}

This will install *Node.js Version Manager (NVM)* in your home directory (`~/.nvm`) and add a few NVM-related initialization lines in your `~/.bashrc`.

#### Install Node and NPM

Next, select and install the version of Node.js that you want to install. You can install multiple versions. You can list all the available versions with `nvm ls-remote`. I went with

{% highlight bash %}
nvm install 6.3.1
{% endhighlight %}

for installing the newest version that was available at the time.

## Installing Ruby and Jekyll using rbenv

### Installing dependencies

{% highlight bash %}
sudo apt-get update
sudo apt-get install git-core zlib1g-dev libssl-dev libreadline-dev
{% endhighlight %}

Notice that `build-essential` seemed to not be needed, at least builds succeeded without installing it (and also `dpkg -l | grep build-essential` returns nothing).

### Installing rbenv

The following will first clone `rbenv` in `~/.rbenv`. After that it was add initialization code to your `~/.bashrc`:

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

Once you're this far you're now ready to install Ruby. To list the available version, run `rbenv install --list`. Once you've selected the version to use (like here I opted to use version `2.3.1`), you can run the installation:

{% highlight bash %}
rbenv install -v 2.3.1
rbenv global 2.3.1
{% endhighlight %}

Notice that the `-v` flag is actually not referring to version in this case (as you might think) but is a flag to turn the verbose installation mode on. More info about install flags: `rbenv help install`.

### Installing Jekyll

The newest version of Jekyll is now v3.2.1. I tried this first but some of my sites broke on so I went to v2.5.3. Here's a [list of the available Jekyll versions](https://rubygems.org/gems/jekyll/versions). Installing it goes as follows:

{% highlight bash %}
gem install jekyll -v 2.5.3
{% endhighlight %}

## Conclusion

After a fair amount of frustration, `nvm`, `node`, `npm`, `rbenv`, `ruby` (2.3.1) and `jekyll` (v2.5.3) now work correctly, yey!
