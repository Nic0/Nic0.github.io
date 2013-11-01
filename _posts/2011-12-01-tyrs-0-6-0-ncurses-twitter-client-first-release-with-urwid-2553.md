---
layout: post
title: Tyrs 0.6.0, ncurses Twitter client, first release with Urwid
tags:
- archlinux-en
- linux
- linux-en
- ncurses
- python-en
- tyrs
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  pw_single_layout: '1'
  views: '42'
---
Tyrs is a Twitter and Identi.ca client based on ncurses. This major release is
the first one using the [urwid][1] library. It will improve greatly the user
interface.


* Edit a tweet: Previous release had a poorly way to edit tweet, I knew it, and
  wasn't especially proud of it and always wanted to do it again from scratch.
  With urwid, it was easier to manage it. So now, it's more like an IRC input
  bar to write tweet. We can do what we usually want, such as go back with
  arrow keys.
* I had feedback as the unicode wasn't perfect, editing a tweet with 2-bits
  long Chinese characters could sometime break the application. Fortunately,
  urwid has an excellent utf-8 support, so the overall management of unicode
  should be improve, and shouldn't be an issue anymore.
* More generally, a better display with less bugs.


In many way the interaction with user is improve, and in many details. This
release still in early stage of development of the urwid interface, this mean
it's usable, but some functionalities aren't yet implements, and will be done
soon. I always follow the *release early, release often* plan, and even
everything isn't ready yet, I believe the improvement worth a release.

Some stuff that need to be done in further releases:

* Configuration, lot of configuration was about the display, it will be the
  point of the next release.
* Better default shortcut, I'm not so happy about the default shortcut, I've
  started with some, and added while I was doing the implementation, but, I
  guess it could be remap in much better way, even if it customizable in the
  configuration file.
* Display without boxes, as I'm not a huge fan of line, I'll probably do three
  default layout, *coming soon*.
* Few more functionalities such as lists, information about user...

If you are using Arch Linux, the installation through the [AUR package][4] is easy:

    yaourt -S tyrs
    # Or the latest git revision
    yaourt -S tyrs-git

You may find the latest code in the [github repository][2], and find tarballs
in the [pypi page][3] of the project.

I hope you'll enjoy it. As usually, any feedback is much appreciated.

[1]: http://excess.org/urwid/
[2]: https://github.com/Nic0/tyrs
[3]: http://pypi.python.org/pypi/tyrs
[4]: https://aur.archlinux.org/packages.php?ID=48849
