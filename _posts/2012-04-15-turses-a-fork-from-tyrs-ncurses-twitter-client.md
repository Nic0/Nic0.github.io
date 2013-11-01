---
layout: post
title: Turses, a fork from Tyrs, ncurses Twitter client
category: twitter
tags:
- archlinux-en
- linux-en
- tyrs
- twitter
- ncurses
---

For background reminder, I started last year a ncurses twitter client called
[Tyrs][2], as it was almost the only ncurses client, some persons used it. Earlier
this year, I wrote a [blog post announcing that haven't enought time and
motivation anymore to carry on Tyrs][1]. I was a bit frustrated, as I knew Tyrs had
some bugs left, due to the late migration to the Urwid module (awesome python
ncurses module by the way), and I knew that some persons was still using it.

The good news is, Tyrs has been forked! A warm welcome to [Turses][3]!

You might have some questions. What's going on? A fork isn't a big deal if
nothing happen behind? Any new stuffs?

A short answer could be that I'm kind of exited about the fork. But here some
more details about it.

The fork has been initiated by [Alejandro Gómez][4] a few months ago after
writing some patchs for Tyrs. Starting from Tyrs, he wasn't afraid to moves
codes around, rearrange stuffs, doing some refactoring, even add some new
functionalities. I must say he's done some good and cleaver work. So it's
obvious that [Turses][3] isn't a fork *just to add a patch*, but there is a lot
going on, and for the best! It might sound like a programmer side view about
it, but I'm confident about Turses future, and that's what's important for
users.

About new features, I really like the new dynamic buffer managment, meaning
that you now can add or remove buffers on the fly. For example you can add a
buffer of some keyword research or from a user timeline, a bit like you add or
remove a channel from an IRC client. That's sweet! Another feature is the
possibility to display two buffer at once. Let say for example, home and
mentions timeline. I have to say that I haven't try yet, but It looks cool!

Here the traditional screenshot, taken from the github page.

![screenshot](/images/turses.png)

So, I'm quite happy about Turses, I really hope Alejandro will enjoy writing
it, as I enjoyed writing Tyrs. If you're using Tyrs, or even if you don't, you
really should give Turses a shot. And don't be affraid to [reports bugs][5] or
even participate, as Turses is naturaly under licence GPLv3!

I hope the best for Turses.


[1]: http://www.nicosphere.net/small-projects-life-depends-on-his-owner/
[2]: http://tyrs.nicosphere.net
[3]: https://github.com/alejandrogomez/turses
[4]: https://github.com/alejandrogomez/
[3]: https://github.com/alejandrogomez/turses/issues
