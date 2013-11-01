---
layout: post
title: Tyrs a Microblogging Client based on Ncurses
tags:
- archlinux-en
- internet
- linux-en
- tyrs
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  pw_single_layout: '1'
  views: '4'
---
[Tyrs][9] is a microblogging client, supporting Twitter and Status.net
(identi.ca), it's based on console using the [NCurses][3] module from Python. The release of the 0.5.0 version is a good excuse to introduce Tyrs.

Tyrs aims to get a good interaction with a fairly intuitive interface that can
provide support ncurses. Tyrs tries also not to impose choices to the user by
providing a configuration file for features, display and defaults keys. You
don't like borders, space between tweets, or colors? It's all configurable 
in an INI-like file.

It's really for the fun I started Tyrs, as I'm not a developer. I
chose to start this project because I use it, as well as educational purpose. Moreover,
contrary to what you should believe, I am not a big Twitter user, just a little regular
user, wanting to have pleasure to write a program. The first lines are from May

The license used is GPLv3, its development is carried out on [a repository on
Github][4], the code source is also available in the [pypi page](http://pypi.python.org/pypi/tyrs). Tyrs is Free Software.

I first used other clients, GUI or CLI, but the CLI alternatives 
doesn't correspond specifically to my expectations. There are mainly:

* [BitleBee][1], is an application to be added to IRC client such as irssi or
  weechat.  I never was a big fan of bitlebee.
* [TTYtter][2], is the application I was using before writing Tyrs. Very
  complete and mature. His approach does   not include however ncurses, and
  therefore, although it is easily controllable from the keyboard, it doesn't
  have the interactive that have ncurses software.

Since then, I had the opportunity to discover other microblogging clients, but
generally without ncurses support. According to my tastes, I through that there
was a lack to find my favorite ncurses Twitter client, and so, fit my console application
collection that I use every days.

Here a screenshot ([full screen view](http://pix.toile-libre.org/upload/original/1320604662.png)) to visualize what we are talking about, it isn't my
timeline, but someone's public timeline.

![Screenshot of Tyrs] (http://pix.toile-libre.org/upload/img/1320604662.png)

Let's go a little deeper into of Tyrs with an overview of the main features.

* Timelines
  * Home: Used to view your tweets timeline, similar to what you have on your
    home page of the site.
  * Mention: Includes tweets containing your nickname.
  * Direct: Includes messages sent privately.
  * Favorites: Displays tweets who has been bookmarked.
  * Other ...

The Timelines are navigable with the arrow keys or with 'j' and 'k'. We
could be compared to buffers of a ncurses IRC client.

This way of separate timelines is quite close to what can be seen in the
microblogging classic clients with a graphical interface. It's probably a
reason why the interface is intuitive even if it's a console application.

* Indicator of activities

As we can display only one timeline, the indicator of activity indicates
whether new notices have appeared in other timelines, this detail avoids having
to navigate between timelines only to check for new incomings. A counter can also
quantify the activity. This place can also view the timeline currently
selected. Location is at the top right.

* Standard features:
  * OAuth authentication;
  * Follow / Unfollow, ie subscribe to a feed of persons;
  * Search for a particular keyword;
  * Favorites;
  * Direct messages;
  * Opening direct URLs;

* Various
  * Retweets Counter: This is a detail, but after using it a
    while, I must say that I am used to. The purpose is to indicate
    the number of times a tweet has been relayed (retweeted). It is
    therefore a possibility to visualize in real time, popularity of a status.
  * Support URL shortener, so far, the main services are supported ur1.ca,
    bit.ly and goo.gl.
  * Proxy support through the configuration file. This is one of the latest
    feature added.
  * Filter system for tweets that do not contain URLs, the system that can
    filter by name. It's a way to reduce *noise*.
  * *Waterline* to identify the last tweet read in the last use, it is
    re-adjusted if necessary by just a key strock.
  * View a thread to get the conversation history. The answers to a tweet are
    viewable by an envelope icon (✉).
  * Ability to start several instances of Tyrs, passing as argument '-a account'.

The number of keys shortcut can be confusing at first, the most common is
displayed at the bottom of the screen, that can be switched off, and a help
screen is available by pressing 'h'.

As mentioned in the introduction, the main idea is to leave the choice up to
the user, and most behavior is customizable through a configuration file, that
is also generated at startup to ease your first customization.

Tyrs has been translated into French and Spanish, so this may seem anecdotal,
but it isn't for me because is a real example of what I like in free software,
opportunities for contributions and exchange of humans from all horizons, not
speaking a word of Spanish, but it's indeed a contribution straight from
Venezuela, which is given to Tyrs. Other aids to correct my poor English thanks
to [jasonwryan](http://jasonwryan.com/) from Arch Linux, or proposals for
patches and bug reports and the packaging for distribution, including
Frugalware. Contributions and help which are always appreciated, especially
because it's a small project.

If I am passionate about programming, I also have another focus is to keep a
blog. I mention here is not to make an advertisement, but because I think [the
topics about Tyrs][5](unfortunately in French) are indicative of the state of mind in which I came to write
Tyrs, Speaking of this little program is the first time early in its design,
while the feature was only able to read his instructions without being able to
to send. There are some form of narrative developments and problems sometimes
encountered in darkness, discovering ncurses for Python.

For installation, more details are on [the documentation page][7], a package is
available for Arch Linux and Frugalware, in the case of Arch Linux, you simply
do:

    yaourt -S tyrs

Tyrs are mainly tested with Python 2.7, I'm not sure of the result obtained
with earlier versions of Python. However if you have this version of Python and
python-pip installed you can do:

    pip install tyrs

Tyrs is not perfect, far from it, as seen above, support for Python prior to
2.7 is not really tested. Another black, is editing a record, I'm really not
satisfied with the system before, I think I would see to rewrite that part
in-depth, something I wanted to do for a long time, but always rejected.
Certainly other bugs, depending of the moon  and distribution of butterflies.

I opened a thread on the [Arch Linux Forum](https://bbs.archlinux.org/viewtopic.php?id=119588).

Free Software often come with [no warranty][6] but I did my best not to
introduce bugs. I'm interested in all returns, regardless
of the form, comments, bug reports, patches. Most important thing is I really
enjoyed write Tyrs.

Some usefull links to learn more about Tyrs:

* [Project Home Page][9]
* [Project Documentation][7]
* [Project on Github][4]
* [Project on Pypi][10]


[1]: http://www.bitlbee.org/main.php/news.r.html
[2]: http://www.floodgap.com/software/ttytter/
[3]: http://en.wikipedia.org/wiki/Ncurses
[4]: https://github.com/Nic0/tyrs
[5]: http://www.nicosphere.net/tag/tyrs/
[6]: http://www.gnu.org/s/gsl/manual/html_node/No-Warranty.html
[7]: http://tyrs.nicosphere.net/reference.html
[8]: http://pix.toile-libre.org/upload/original/1320604662.png
[9]: http://tyrs.nicosphere.net
[10]: http://pypi.python.org/pypi/tyrs
