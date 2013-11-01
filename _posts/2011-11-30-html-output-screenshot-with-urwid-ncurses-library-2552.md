---
layout: post
title: HTML output screenshot with Urwid ncurses library
tags:
- ncurses
- programmation
- python-en
- Urwid
- urwid
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  pw_single_layout: '1'
  _series_part: '6'
  views: '25'
---
Urwid is a ncurses library for Python, you may check older posts if you're not
familiar about it. So far, we've seen some useful functionalities and tricks,
to run urwid, therefor, it's time to see something (almost) useless but geek,
and in the spirit of ncurses programs, as urwid allow to take "screenshots" of
the application, with a HTML output.

The problem with the reference guide of urwid, it's that is not so easy to
figure out how to get things done as we want. This corresponds to the *screen
capture* part of the reference guide. But the easiest way to get started it's
to check source code, and not the *real* code of urwid, but the code who
actually generate the tutorial of urwid, they do use this functionality for
this part. Check in the tarball, `docgen_tutorial.py` to get examples.

Let's take our own example, based on the code we've done in earlier post, for
reminder, we obtain a list of item (couple title/description), in a
`urwid.Frame` that allow to divide the space in three parts, header (the
selected item), the body (list of the items), the footer (edit the description
of current item). It was where we was last time. So let's add a screenshot of
it.

##The idea

The screenshot will be triggered by the *s* keystroke, the idea is to start
over the main loop, and pass in arguments the sequence of keystroke wanted.

##Trick about screen size

We need to pass in the screenshot the size of the screen. It will be a tuple
*(y, x)*, it could be some random numbers, but it could be useful for the
screenshot, and many other functionalities, to get the real size of the
screen, and their is a variable for that.

{% highlight python %}self.loop = urwid.MainLoop(self.view, palette, unhandled_input=self.keystroke)
#[...]
#This variable contain the size in a tuple (x, y)
size = self.loop.screen_size{% endhighlight %}

##About the output

The output will come in a variable, but after every stroke we ask, their will
be a screenshot, retrieve in a list, we need to choose the good one, probably
the last one.

##The screenshot code

{% highlight python %}import urwid.html_fragment
# [...]
    def keystroke(self, input)
    # [...]
        if input is 's':
            init = urwid.html_fragment.screenshot_init
            collect = urwid.html_fragment.screenshot_collect
            
            init([self.loop.screen_size], [['down']*3, ['enter'], ['q']])
            MyApp()
            with open ('output.html', 'w') as f:
                for l in collect()[-1]:
                    f.write(l){% endhighlight %}

In this code, we prepare two functions.

* `init` will be pass the sequence of keystroke, quite forward to understand.
* `collect` retrieve the result, as it was said earlier, it gives a list, we
  want only the latest element.

The result it place in the file `output.html` that we can see with firefox.

##The result

<pre><span style="color:#ff0000;background:#000000">selected: item 3: Cras a magna sit amet fel...                                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 0       </span><span style="color:#0000ee;background:#e5e5e5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.         </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 1       </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 2       </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#cd0000;background:#e5e5e5">item 3       </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 4       </span><span style="color:#0000ee;background:#e5e5e5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.         </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 5       </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 6       </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 7       </span><span style="color:#0000ee;background:#e5e5e5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.         </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 8       </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 9       </span><span style="color:#0000ee;background:#e5e5e5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.         </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 10      </span><span style="color:#0000ee;background:#e5e5e5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.         </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 11      </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 12      </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 13      </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 14      </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 15      </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 16      </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 17      </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 18      </span><span style="color:#0000ee;background:#e5e5e5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.         </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 19      </span><span style="color:#0000ee;background:#e5e5e5">Lorem ipsum dolor sit amet, consectetur adipiscing elit.         </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 20      </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 21      </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 22      </span><span style="color:#0000ee;background:#e5e5e5">Sed sollicitudin, nulla id viverra pulvinar.                     </span>
<span style="color:#0000ee;background:#e5e5e5">  </span><span style="color:#0000ee;background:#e5e5e5">item 23      </span><span style="color:#0000ee;background:#e5e5e5">Cras a magna sit amet felis fringilla lobortis.                  </span>
</pre>

##The full code

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

        self.loop = urwid.MainLoop(self.view, palette, unhandled_input=self.keystroke)
        urwid.connect_signal(walker, 'modified', self.update)
        self.loop.run()
   
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

        if input is 's':
            init = urwid.html_fragment.screenshot_init
            collect = urwid.html_fragment.screenshot_collect
            
            init([self.loop.screen_size], [['down']*3, ['enter'], ['q']])
            MyApp()
            with open ('output.html', 'w') as f:
                for l in collect()[-1]:
                    f.write(l)

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
