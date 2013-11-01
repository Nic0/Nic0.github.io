---
layout: post
title: Clint, Command Line Library for Python
category: programming
tags:
 - python-en
 - CLI
---

This library is the kind I like, the kind which make your life easier,
perfect for someone like me, who uses Python all the time. So, what can 
[Clint][2] do for you? Well, there are a bunch of tools that might come handy when
you do some command line based programming, especially quick scripts. If you use
Python as your primary langage, CLI stuff is always useful.

### Colors

Having some colored output can be nice, but I don't want to use some ncurses
interface to have a nice display. A common request is for text color to be
green for an expected result, and red otherwise. The highest ranked answer from
[this stackoverflow's question][1] gives some`'\033[93m'`, which it does the
works, but isn't lovely, or even *pythonic*.

Let's see the simplest example possible:

{% highlight python %}
from clint.textui import colored

print colored.red('some warning message')
print colored.green('nicely done!')
{% endhighlight %}

How intuitive was that! At least, I don't need to check on the documentation
every time I want a red message!

If you only need one word in different color, it's as simple as a
concatenation, here's a quick example:

{% highlight python %}
from clint.textui import colored

print 'I love ' + colored.yellow('pyt') + colored.blue('hon')
{% endhighlight %}

### Indentation

One of the main feature of Clint, is to handle nicely indentations. It even
managed nested indentation, a *quote* system, allow you to set some prefix
chars, like quotes in emails for example. Here a quick example:

{% highlight python %}
from clint.textui import colored, indent, puts

with indent(3, quote=colored.red(' >')):
    puts ('some random text')
    puts ('another text')
    with indent(3, quote=colored.green(' |')):
        puts('some more nested identation')
        puts('cool isn\'t?')
{% endhighlight %}

Once executed, the output gives:

    > some random text
    > another text
    >  | some more nested identation
    >  | cool isn't?

Looks good without breaking a sweat!

### Arguments

There are ways to handle arguments, like the module `argparse`, or
even `sys.args`. However, Clint wants to be as simple and useful as
possible. It allows you to make distinction between the arguments passed:

- `args.all` a simple list of every arguments passed.
- `args.flags` list only flags, meaning with `--foo` or `-f` passed, excluding
  everything else that doesn't contain a dash.
- `args.files` this one could be very useful, it detects files in the arguments
  line, even with `*` wildcard. So for example you have in the directory
  `foo.py` and `bar.py`, entering something like `*.py` will return in the
  `args.files` a list with those two files.
- `args.not_files` is every thing that wasn't detected by the above argument.
- `args.grouped` help you to managed grouped arguments.

For a redistributed program that I take time over, I would probably use
`argparse`, as it's more common, and gives you a nice help output. But for a quick
homemade script, that only need to take few arguments, I really think this
could be an alternative. Either way, it worth having a look at.

### Progress bar, files and pipes

Clint comes with more tools, which are easy to use. Let's look at a progress bar with Clint:

{% highlight python %}
from time import sleep
from random import random
from clint.textui import progress

if __name__ == '__main__':
    for i in progress.bar(range(100)):
        sleep(random() * 0.2)

    for i in progress.dots(range(100)):
        sleep(random() * 0.2)
{% endhighlight %}

    [########################        ] 75/100

Clint handles pipes, eg. `cat foo.txt | bar.py`, or resources like handling files IO.

### Documentation and Conclusion

This post is not a review of every possible utility that Clint has to offer,
but more of a quick overview, and memo for myself. I really think Clint could
come in handy from time to time. Unfortunately, there is a lack of documentation, not
much more than the [README][3] from the github repository, as the `/doc/`
directory doesn't contain much. The best place to start is to directly check
[example][3] codes provides with the library.

Another thing that could bother you is, so far, Clint only works with python
2.x.  Python 3 compatibility is include in the todo list, as is
documentations.  
**Edit about Python3**: Not true anymore, thanks to Kenneth
Reitz, whose done a release today with Python3 support!


I hope you enjoyed this quick review of [Clint][2]. Anyway, it's in my toolbox now.

[1]: http://stackoverflow.com/questions/287871/print-in-terminal-with-colors-using-python
[2]: https://github.com/kennethreitz/clint
[3]: https://github.com/kennethreitz/clint/tree/develop/examples
