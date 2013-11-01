---
layout: post
title: Selectable List with Urwid for Python
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
  _series_part: '2'
  views: '12'
---
Urwid is a ncurses library for Python, after [a short introduction][1] of
urwid, I said I will keep update some training code. As urwid isn't so easy
library to start with and examples aren't find all around the Internet, I
through it could be interesting (for myself at least) to have some more code.

**The complete code can be view at the end of this post**

We want something very common, a simple list of items (title + description),
and select one item as we go through the list. To understand easier what we
want, here a screenshot of the result.

<a href="/img/urwid-item.png"><img src="/img/urwid-item-300x181.png" alt="" title="urwid-item" width="300" height="181" class="aligncenter size-medium wp-image-2544" /></a>

The main idea, is to create a selectable widget, with everything we want in it,
and create a *SimpleListWalker* from a list of this widget.

First, let's see this custom widget.

{% highlight python %}class ItemWidget (urwid.WidgetWrap):

    def __init__ (self, id, description):
        self.id = id
        self.content = 'item %s: %s...' % (str(id), description[:25])
        self.item = [
            ('fixed', 15, urwid.Padding(urwid.AttrWrap(
                urwid.Text('item %s' % str(id)), 'body', 'focus'), left=2)),
            urwid.AttrWrap(urwid.Text('%s' % description), 'body', 'focus'),
        ]
        w = urwid.Columns(self.item)
        self.__super.__init__(w)

    def selectable (self):
        return True

    def keypress(self, size, key):
        return key{% endhighlight %}

- Selectable method

To make a list, it have to be selectable, otherwise when you scroll, it will
behave like a web browser, it will scroll the screen as soon as you press the
down key, instead of go through every item of the screen before. For example,
by default, *urwid.Text* isn't a selectable item, and can be overwrite.

- Keypress method

This is required, but in this example, we won't handle keypress itself, so we
simply return the key, and will be handle in the main loop.

- Init method

What we do here is to prepare a widget that is a combination of other widgets,
so we prepare it, and call it parent constructor in the last line.

Some more explanation:
{% highlight python %}
        self.id = id
        self.content = 'item %s: %s...' % (str(id), description[:25]){% endhighlight %}

This is some basic stuff, the content attribute is more to retrieve information
after it would be selected.

{% highlight python %} w = urwid.Columns(self.item){% endhighlight %}

First, I skip the explanation for *self.item* as it better to keep in mind what
we want, so for every item, we display it as a two columns layout. so it will
be align nicely.

{% highlight python %}
            ('fixed', 15, urwid.Padding(urwid.AttrWrap(
                urwid.Text('item %s' % str(id)), 'body', 'focus'), left=2)),{% endhighlight %}

There is a lot in this one.

- *fixed* and *15*, this will tell to the *Columns* widget that we want this
  column to be fixed to 15, as we want a smaller column for the title than the
  description. We affect at the column 15 cols width.
- *urwid.Padding* and *left=2*, this tell we don't want the list start right on
  the left, so we give it two cols space.
- *urwid.AttrWrap* and *body* and *focus*, usual color wrap, with a second one
  that specify witch palette color do we use when the item have the focus, note
  that it could be an other name.
- *urwid.Text* doesn't need much more explanation.

{% highlight python %}urwid.AttrWrap(urwid.Text('%s' % description), 'body', 'focus'),{% endhighlight %}

This is almost the same as the other one. This one is easier and doesn't need
more explanation.

That's it for the *ItemWidget*, It's ready and we only need to construct a list
from this.


{% highlight python %}def main ():

    palette = [
        ('body','dark cyan', '', 'standout'),
        ('focus','dark red', '', 'standout'),
        ('head','light red', 'black'),
        ]

    lorem = [
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'Sed sollicitudin, nulla id viverra pulvinar.',
        'Cras a magna sit amet felis fringilla lobortis.',
    ]{% endhighlight %}

Here's go some basic stuff, the very classic palette, and a *lorem generator*
that will give some random description.

{% highlight python %}    def keystroke (input):
        if input in ('q', 'Q'):
            raise urwid.ExitMainLoop()

        if input is 'enter':
            focus = listbox.get_focus()[0].content
            view.set_header(urwid.AttrWrap(urwid.Text(
                'selected: %s' % str(focus)), 'head')){% endhighlight %}

We handle keystrokes in the main method, the important thing is we get back the
content of the focus element of the list of widget, and set the content of the
header with it.

{% highlight python %}    items = []
    for i in range(100):
        items.append(ItemWidget(i, random.choice(lorem))){% endhighlight %}

this is where we construct the list, some basic stuff.

{% highlight python %}    header = urwid.AttrMap(urwid.Text('selected:'), 'head')
    listbox = urwid.ListBox(urwid.SimpleListWalker(items))
    view = urwid.Frame(urwid.AttrWrap(listbox, 'body'), header=header)
    loop = urwid.MainLoop(view, palette, unhandled_input=keystroke)
    loop.run(){% endhighlight %}

And finally, we put everything together, by creating the *SimpleListWalker*.

Here the code, without my disturbing comments:

{% highlight python %}import urwid
import random

class ItemWidget (urwid.WidgetWrap):

    def __init__ (self, id, description):
        self.id = id
        self.content = 'item %s: %s...' % (str(id), description[:25])
        self.item = [
            ('fixed', 15, urwid.Padding(urwid.AttrWrap(
                urwid.Text('item %s' % str(id)), 'body', 'focus'), left=2)),
            urwid.AttrWrap(urwid.Text('%s' % description), 'body', 'focus'),
        ]
        w = urwid.Columns(self.item)
        self.__super.__init__(w)

    def selectable (self):
        return True

    def keypress(self, size, key):
        return key

def main ():

    palette = [
        ('body','dark cyan', '', 'standout'),
        ('focus','dark red', '', 'standout'),
        ('head','light red', 'black'),
        ]

    lorem = [
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'Sed sollicitudin, nulla id viverra pulvinar.',
        'Cras a magna sit amet felis fringilla lobortis.',
    ]
    
    def keystroke (input):
        if input in ('q', 'Q'):
            raise urwid.ExitMainLoop()

        if input is 'enter':
            focus = listbox.get_focus()[0].content
            view.set_header(urwid.AttrWrap(urwid.Text(
                'selected: %s' % str(focus)), 'head'))

    items = []
    for i in range(100):
        items.append(ItemWidget(i, random.choice(lorem)))

    header = urwid.AttrMap(urwid.Text('selected:'), 'head')
    listbox = urwid.ListBox(urwid.SimpleListWalker(items))
    view = urwid.Frame(urwid.AttrWrap(listbox, 'body'), header=header)
    loop = urwid.MainLoop(view, palette, unhandled_input=keystroke)
    loop.run()

if __name__ == '__main__':
    main(){% endhighlight %}

Their are certainly others ways to do this, but as I'm learning Urwid, I didn't
find this information so easily, so I though I could be useful to someone else
who will want have a try with Urwid.

This list, even if it's a very basic one, is a common thing, as lots
application need some kind of selectable list. I probably publish some more
exercises of this kind as I'll go through my learning of Urwid.

[1]: http://www.nicosphere.net/urwid-for-python-a-ncurses-library-2541/
