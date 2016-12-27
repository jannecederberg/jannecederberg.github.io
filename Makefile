# Makefile for jannecederberg.fi

.PHONY: serve build update

serve:
	bundle exec jekyll serve

build:
	bundle exec jekyll build

update: build
	git push

default: serve
