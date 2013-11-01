---
layout: post
title: Signals with Urwid for Python
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
  _aioseop_keywords: urwid, signals, simplelistwalker, tutorial
  _aioseop_description: Introduction and examples with signals for the urwid library
    for Python, with simples code examples, with a SimpleListWalker and from scratch.
    List of signals in code source
  _aioseop_title: Signals with Urwid for Python
  _series_part: '3'
  pw_single_layout: '1'
  views: '4'
---
Urwid, a Ncurses library for Python, handle a signal system, witch is nice for
a ncurses library. You may want to check others posts on urwid if needed. We'll
see two examples here.

##A first example

Let's start with the code from [the last post][1], for reminder, it does a
selectable list, with *SimpleListWalker*, and display the selected item every
time *Enter* is pressed. It's a simple code, that we'll extend a little.

**What we want** is to every time we move from the list, the selection is
update to the header, showing the correct item, and we want have it working
with a signal. Through, it would has other way to get it work, but it's a way
to start.

[The reference about signals][2] isn't so easy to get into, maybe the best
example from the tutorial is [Events and listbox widget][3], but in this
example, the signal is connected to an *Edit Widget*, here, we doesn't have
such thing, and we want use the list instead. If we try with the `change`
argument, it would says to us that list doesn't have such signal. So let's find
out witch signal a list has by reading the code source.

{% highlight python %}class ListWalker(object):
    __metaclass__ = signals.MetaSignals
    
    signals = ["modified"]

    def __hash__(self): return id(self)

    def _modified(self):
        signals.emit_signal(self, "modified"){% endhighlight %}

Fine, as the *SimpleListWalker* extends to *ListWalker*, it seems that this
widget use the `modified` signal, so let's use this one for our example. Here
the interesting part, but if you want the entire code, who is basically the same
as the last post, you can find it [in a gist][4].

{% highlight python %}    items = []
    for i in range(100):
        item = ItemWidget(i, random.choice(lorem))
        items.append(item)

    header = urwid.AttrMap(urwid.Text('selected:'), 'head')
    walker = urwid.SimpleListWalker(items)
    listbox = urwid.ListBox(walker)
    view = urwid.Frame(urwid.AttrWrap(listbox, 'body'), header=header)

    def update():
        focus = listbox.get_focus()[0].content
        view.set_header(urwid.AttrWrap(urwid.Text('selected: %s' % str(focus)), 'head'))

    loop = urwid.MainLoop(view, palette, unhandled_input=keystrock)
    urwid.connect_signal(walker, 'modified', update)
    loop.run(){% endhighlight %}

Importants remarques:

- The signal is connected to the *SimpleListWalker*, so the walker variable,
  and not to the listbox, as *ListBox* extends *BoxWidget* doesn't respond to
  the `modified` signal.
- The update function correspond at the same function when we pressed *Enter*
  in the last post.

That's it, nothing complicated, we run it, and it works as expected, every time
we move, the header is updated with the signal system.

##What about others signals?

Their is no signal list in the documentation, so let's find out some more
signal with the documentation. We'll looking for `signals = ['foo']` in the
code, it might give us a clue.

{% highlight bash %}$ ack 'signals = \['
display_common.py
703:    signals = [UPDATE_PALETTE_ENTRY, INPUT_DESCRIPTORS_CHANGED]
 
vterm.py
1317:    signals = ['closed', 'beep', 'leds', 'title']
 
widget.py
719:    signals = ["change"]
 
wimp.py
104:    signals = ["change"]
422:    signals = ["click"]
 
listbox.py
37:    signals = ["modified"]{% endhighlight %}

We find the the `modified` signal as shown in the first code in this post. And
without surprise, widget.py contain a `change` signal, exactly as it was shown
with the *Edit Widget* in the tutorial. The 719 line corresponding to the Edit
class. So:

- Edit (widget.py): change
- ListWalker (listbox.py): modified
- CheckBox (wimp.py): change
- Button (wimp.py): click

vterm.py is more specific and exist only on the latest 1.0.0 version.

##Custom signal from scratch

Let's go deeper, and create a signal from scratch. The example will as simple
as possible. We create an object, containing a function that raise a signal, on
the other hand, an hello world that would change his message when it will
receive the signal. I found [another example from the mailing list][5] but a
bit more confusing maybe.

Here the simplest example that I could came with.

{% highlight python %}import urwid
import urwid.signals

class Sig (object):
    __metaclass__ = urwid.signals.MetaSignals
    signals = ['custom']

    def send_signal(self):
        urwid.emit_signal(self, 'custom')

def main():

    txt = urwid.Text("Hello World")
    fill = urwid.Filler(txt, 'top')
    sig = Sig()

    def update():
        """Callback once the signal is received"""
        fill.body = urwid.Text("Text Updated")

    def show_or_exit(input):
        if input in ('q', 'Q'):
            raise urwid.ExitMainLoop()
        #We press the 'u' letter (as in update)
        if input is 'u':
            sig.send_signal()

    #connection between the object, the signal name and the callback
    urwid.connect_signal(sig, 'custom', update)
    loop = urwid.MainLoop(fill, unhandled_input=show_or_exit)
    loop.run()

if __name__ == '__main__':
    main(){% endhighlight %}

First thing, don't forget the import.  Now, we create the `Sig` object, it only
purposes it to send a signal once we ask for by calling the `send_signal`
function. Every line is important, but easily understandable.

The main function isn't more difficult. I added some comments in case. The most
important, it's the callback to the update function and how it's connected
with:
{% highlight python %}urwid.connect_signal(sig, 'custom', update){% endhighlight %}

That's all for now, I hope it'll give you some more very basics example to get
started with signals and urwid, as the documentation isn't always easy. To be continued...

[1]: http://www.nicosphere.net/selectable-list-with-urwid-for-python-2542/
[2]: http://excess.org/urwid/reference.html#connect_signal
[3]: http://excess.org/urwid/tutorial.html#frlb
[4]: https://gist.github.com/1385390
[5]: http://article.gmane.org/gmane.comp.lib.urwid/742/
