---
layout: post
title: Urwid for Python, a ncurses library
tags:
- ncurses
- programmation
- python
- python-en
- Urwid
- urwid
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  pw_single_layout: '1'
  _series_part: '1'
  views: '9'
---
This, is the first part of a six posts series on Urwid.

- [Urwid for Python, a ncurses
  library](http://www.nicosphere.net/urwid-for-python-a-ncurses-library-2541)
- [Selectable List with Urwid for
  Python](http://www.nicosphere.net/selectable-list-with-urwid-for-python-2542)
- [Signals with Urwid for
  Python](http://www.nicosphere.net/signals-with-urwid-for-python-2545)
- [Footer Edit with Urwid, IRC-Client-like
  input](http://www.nicosphere.net/footer-edit-with-urwid-irc-client-like-input-2547)
- [Several colored string with
  Urwid](http://www.nicosphere.net/several-colored-string-with-urwid-2546)
- [HTML output screenshot with Urwid ncurses
  library](http://www.nicosphere.net/html-output-screenshot-with-urwid-ncurses-library-2552)


I really like ncurses programs, it's certainly what I use the most for an
every day usage. The [curses module][1] from Python provides some elements to
build an application, it's what I used for my last program [Tyrs][2].
Unfortunately, the module doesn't provide any widgets or advances elements,
usually instead of reinvents the wheel, we use a library. As far as I know,
Python have only two libraries for ncurses.

- [PyCDK][3] is some alpha stage library, who doesn't seem to be maintain
  anymore. It's originally a binding of the CDK library for C. I tried it, but
  I didn't manage to get it work, maybe I was unlucky. Anyway, I would not
  advise this library.
- [Urwid][4] is a serious library, who's come with lots of features and
  widgets, and will be the subject of this post.

Unfortunately, their isn't any others libraries that those two.

It's always interesting when starting consider a library to know if their are
others programs using it too, a list is provide [by the website][5], with some
interesting programs, such as wicd-curses, hachoir and the Debian "reportbug"
tool.

The most interesting pieces of example to get start with come from [this
page][6], a set of small programs with screenshot.

Urwid come with lots of features and widget, allow you to display a nice layout
easily, editing text, 256 colors, utf-8, check box, advance list management,
mouse event and much more. The documentation and tutorial is well documented.

Urwid is maybe not so easy to get start with if you're not used to play with
library, and maybe it's why it isn't more popular but have lots of potential.
Urwid has became mature, and after seven years of development as reach the 1.0.0
release few months ago.

Here is a traditional Hello World, with a quit keystroke handling.

{% highlight python %}import urwid

txt = urwid.Text("Hello World")
fill = urwid.Filler(txt, 'top')

def exit(input):
    if input in ('q', 'Q'):
        raise urwid.ExitMainLoop()

loop = urwid.MainLoop(fill, unhandled_input=exit)
loop.run()
{% endhighlight %}

I will soon write some more posts about Urwid, with codes and more technical. This is only a short
introduction of Urwid. I hope this post will give you enough reason to give
Urwid a try.

[1]: http://docs.python.org/library/curses.html
[2]: http://tyrs.nicosphere.net
[3]: http://pypi.python.org/pypi/pyCDK/0.1
[4]: http://excess.org/urwid/
[5]: http://excess.org/urwid/wiki/ApplicationList
[6]: http://excess.org/urwid/examples.html
