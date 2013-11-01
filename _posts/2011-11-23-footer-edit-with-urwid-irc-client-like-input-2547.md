---
layout: post
title: Footer Edit with Urwid, IRC-Client-like input
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
  _series_part: '5'
  pw_single_layout: '1'
  views: '3'
---
We start with the code from [Selectable List with Urwid for Python][1], check
before the [Signals with Urwid for Python][2] for a small involvement of the
code, for handling signals.

So far, we have a selectable list containing two items each (title and description). We
can go through it with up and down key arrows, and select one of them with the *enter*
key. We use *urwid.Frame* witch give us an useful layout divided in three
parts, *header*, *body* and *footer*. In the last post, we used the header to
display the selected item, the body to display the list, and the footer wasn't
used at all.

Now, what we want is to use the footer for an *Edit* widget, exactly like ncurses
IRC-client such as IRSSI or weechat. When we will press the `e` key (for edit)
an input widget will appear, taking place at the footer, once validate, with *enter*, or abort with *escape*
the output will replace the description of the current selected item.

In the following screenshot, the list was generated with random description.
the 4th item was replaced with this editing process, and we're about to replace the 5th item as well. It may seem not
a big deal, but it still a good exercise to gain practice with urwid.

<a href="/img/urwid-edit.png"><img src="/img/urwid-edit-300x120.png" alt="Urwid Edit" title="urwid-edit" width="300" height="120" class="size-medium wp-image-2548" /></a>

Let's talk about the code. **The full code is at the end of the post**.

- *ItemWidget*: is almost the same as before, it used to create an item for the
  list, it was only change in order to set the description part, here the changing part.

{% highlight python %}self.description = urwid.Text(description)
self.item = [
    ('fixed', 15, urwid.Padding(urwid.AttrWrap( self.title, 'body', 'focus'), left=2)),
    urwid.AttrWrap(self.description, 'body', 'focus'),
]{% endhighlight %}


- *CustomEdit*: inheritance of the *Edit* widget, it will emit a signal *done*
  once finish editing, and will give an argument to the callback, the content
  of the editing, or *None* if it was abort with the *escape* key. If neither
  keys is pressed, the key is return and managed by the normal *Edit* widget.

{% highlight python %}class CustomEdit(urwid.Edit):

    __metaclass__ = urwid.signals.MetaSignals
    signals = ['done']

    def keypress(self, size, key):
        if key == 'enter':
            urwid.emit_signal(self, 'done', self.get_edit_text())
            return
        elif key == 'esc':
            urwid.emit_signal(self, 'done', None)
            return

        urwid.Edit.keypress(self, size, key){% endhighlight %}



- *MyApp*: I moved the code in a class, most of the code is the same except for
  the last two method.

The *edit* method is directly call when the `e` key is pressed. It only create
a *CustomEdit* object, that would be set to the footer, but we need to
specified to the frame (*view*) that the footer have the focus now, otherwise it
would not be editable. At last, we connect the signal, to treat the content
once the edit is done.

{% highlight python %}    def edit(self):
        self.foot = CustomEdit(' >> ')
        self.view.set_footer(self.foot)
        self.view.set_focus('footer')
        urwid.connect_signal(self.foot, 'done', self.edit_done){% endhighlight %}

Once the edit is done, the *edit_done* function is called as a callback, with
the content. Then we modify the content of the description in the list. And set
back to *None* the footer, as we don't want anything display anymore.

{% highlight python %}    def edit_done(self, content):
        self.view.set_focus('body')
        urwid.disconnect_signal(self, self.foot, 'done', self.edit_done)
        if content:
            focus = self.listbox.get_focus()[0]
            focus.description.set_text(content)
        self.view.set_footer(None){% endhighlight %}

That's it, in this example this code is used to manage a list, but it could be
used for a large set of applications.

Here the full code:

{% highlight python %}import urwid
import random
import urwid.html_fragment

class ItemWidget (urwid.WidgetWrap):

    def __init__ (self, id, description):
        self.id = id
        self.title = urwid.Text('item %s' % str(id))
        self.description = urwid.Text(description)
        self.item = [
            ('fixed', 15, urwid.Padding(urwid.AttrWrap( self.title, 'body', 'focus'), left=2)),
            urwid.AttrWrap(self.description, 'body', 'focus'),
        ]
        self.content = 'item %s: %s...' % (str(id), description[:25])
        w = urwid.Columns(self.item)
        self.__super.__init__(w)

    def selectable (self):
        return True

    def keypress(self, size, key):
        return key

class CustomEdit(urwid.Edit):

    __metaclass__ = urwid.signals.MetaSignals
    signals = ['done']

    def keypress(self, size, key):
        if key == 'enter':
            urwid.emit_signal(self, 'done', self.get_edit_text())
            return
        elif key == 'esc':
            urwid.emit_signal(self, 'done', None)
            return

        urwid.Edit.keypress(self, size, key)

class MyApp(object):

    def __init__(self):

        palette = [
            ('body','dark blue', '', 'standout'),
            ('focus','dark red', '', 'standout'),
            ('head','light red', 'black'),
            ]

        lorem = [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            'Sed sollicitudin, nulla id viverra pulvinar.',
            'Cras a magna sit amet felis fringilla lobortis.',
        ]


        items = []
        for i in range(100):
            item = ItemWidget(i, random.choice(lorem))
            items.append(item)

        header = urwid.AttrMap(urwid.Text('selected:'), 'head')
        walker = urwid.SimpleListWalker(items)
        self.listbox = urwid.ListBox(walker)
        self.view = urwid.Frame(urwid.AttrWrap(self.listbox, 'body'), header=header)

        loop = urwid.MainLoop(self.view, palette, unhandled_input=self.keystroke)
        urwid.connect_signal(walker, 'modified', self.update)
        loop.run()
    
    def update(self):
        focus = self.listbox.get_focus()[0].content
        self.view.set_header(urwid.AttrWrap(urwid.Text('selected: %s' % str(focus)), 'head'))

    def keystroke (self, input):
        if input in ('q', 'Q'):
            raise urwid.ExitMainLoop()

        if input is 'enter':
            focus = self.listbox.get_focus()[0].content
            self.view.set_header(urwid.AttrWrap(urwid.Text('selected: %s' % str(focus)), 'head'))

        if input == 'e':
            self.edit()

    def edit(self):
        self.foot = CustomEdit(' >> ')
        self.view.set_footer(self.foot)
        self.view.set_focus('footer')
        urwid.connect_signal(self.foot, 'done', self.edit_done)

    def edit_done(self, content):
        self.view.set_focus('body')
        urwid.disconnect_signal(self, self.foot, 'done', self.edit_done)
        if content:
            focus = self.listbox.get_focus()[0]
            focus.description.set_text(content)
        self.view.set_footer(None)

if __name__ == '__main__':
    MyApp(){% endhighlight %}


Hope it can help someone.

[1]: http://www.nicosphere.net/selectable-list-with-urwid-for-python-2542/
[2]: http://www.nicosphere.net/signals-with-urwid-for-python-2545/
