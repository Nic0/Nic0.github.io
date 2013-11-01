---
layout: post
title: Shaarli, a self hosted bookmark service
category: Application
tags:
- archlinux-en
- linux-en
- web
- php
---

I used to manage my notes with TiddlyWiki, which is absolutely nice, but with
time it became more and more a link manager. So I tried to find something that
fit my need, something that I could host on my server.

I came up with *[Shaarli][1]*, meaning *share link*. I'm using it for a month
now, and it does what I need. The website gives a long list of features, but I
wanted something simple to use, that exactly how *Shaarli*works, simply! The
most surprising stuff is the storage system, a plain text file, there isn't any
database, I wouldn't mind to setup some databases for this, but it has the
advantage to be simpler to install. The performance doesn't seem to be
affected, the developer use a [11730 links][2] instance for his own needs, and
still growing. Even with ten thousand links, the application seems to be fluid
and fast enough.

![Shaarly screenshot](/img/shaarli.png)

*Shaarli* manages private and public links, I thought that keep most of my
links public could be interesting, as it's mostly about programming stuffs,
it could interest people. So [here my instance of Shaarly][3].

Last detail, it's a *share link* bookmark that you can add in your favorite
bar, which is some JavaScript code that pop you up a window, with metadata
already added. So add a link is fast enough, and that's important to keep
using an application like this.

To conclude, *Shaarly* does nicely what I want, even if I haven't look for
lots of alternative, I'm satisfied with it. It's simple to use, *KISS*,
and written in PHP, by a French guy. *Shaarly* absolutely worth a try.

[1]: http://sebsauvage.net/wiki/doku.php?id=php:shaarli
[2]: http://sebsauvage.net/links/
[3]: http://bkm.nicosphere.net/
