---
layout: post
title: Several colored string with Urwid
tags:
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
  _series_part: '4'
  pw_single_layout: '1'
  views: '15'
---
OK, this one is an easy and quick stuff, that I'm almost ashame to share. But the
thing is, I search for it, and I wasn't even sure where to look at it. The
reason I put it here is because I trying to put together some trick about
urwid, stuff I spend some time to looking for, even if it isn't so much time.
If someone need it, he should find it easily here.

The idea is to highlight some worlds in a string. The answer was right in the
front of me from the start! As it was shown in the `tour.py`, the very first
script in the official tutorial.

{% highlight python %}palette = [
    ('main', 'dark blue', ''),
    ('hl', 'dark red', '')
]

txt = urwid.AttrWrap(urwid.Text([
    "Some random text, with an ",
    ('hl', "IMPORTANT "), 
    "word. Other boring stuff."
    ]), 'main'){% endhighlight %}

This short example, witch is only a part of a code of course, shows a string
with the `main` color, with the *IMPORTANT* word colored with the `hl`
attribute. It only a list, with a tuple for different colors, color attribute
first.

As I said, it isn't a very exalting post, just a quick trick.
