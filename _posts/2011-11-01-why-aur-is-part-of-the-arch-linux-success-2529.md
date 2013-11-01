---
layout: post
title: Why AUR is part of the Arch Linux success
tags:
- archlinux-en
- linux-en
- Non classé
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  pw_single_layout: '1'
  views: '4'
---
If you usually follow some blogs about Linux, especially those on Arch Linux, there
is a common word that you are come across often, *AUR*, acronym of *Arch User Repository*. You might wonder
what does it mean, what does it imply for the distribution, and why it's so
popular for the Arch Linux community. If you asking yourself those questions,
this post is for you.

First, you should keep these two characteristics in mind.

- Everybody may contribute to AUR.
- It's really easy to contribute to AUR.

AUR is a kind of repository totally public, open to whoever want to contribute
to let some resources available to anyone. No ceremonials, agreement or long
ritual initiation to submits a package to AUR.

It's as easy to contribute to AUR as to use it, with some *AUR helpers* such as
`yaourt` or others alternatives. Install a package from AUR isn't more
difficult than install one with the official package manager `pacman`, manager
such as `apt-get` for Debian or Ubuntu. Dependencies and research are easily
managed that way. Even a vote system allow credibility about security and code
source of a package.

The main idea about packaging for *AUR* is to write some installation
directives in a file called *PKGBUILD*, by simply follow some easy packaging's
rules. That's what *AUR* contain, only directives that gives instruction to the
helper on how to build the package. There aren't binary packages in *AUR*. 

The fact that a *PKGBUILD* is easy to write increase the idea that everyone can
contribute to *AUR* given that the repository is open to everyone. If you
managed to install Arch Linux by yourself, you should be able to find out how
to write *PKGBUILD*. Of these two ideas, easy to contribute, and for everyone,
resulting implications very beneficial for Arch Linux.

For example, a person who have some practice with it, can make a script or a
program available within few minutes (which was the case for example to offer [hacker-top][3]
and [reddit-top][4] a bit on a whim).  If more time was needed, would I
have done it? probably not. This is also beneficial for the user, so you may
easily enjoy interesting programs that would not be known however. 

This simplification of the provision also encourages some exotic applications,
with for example some very recent drivers that would not be incorporated
otherwise. But also with the latest programming frameworks in vogues.  Knowing
that a framework can gain very big reputation in a short time. So latest
framework can be available easily and quickly to users. Most importantly, it
allows them to be updated, This is important if the evolution is rapid. For
example, if I try Node.js, I do not want the version of last year, but the
latest.  Same for Ruby on Rails, I do not want to watch a version of Ruby,
which may not be compatible with the latest Rails. This last example taken from
a real example, when we saw on the forums concerns about running Rails with
version 3, especially for Debian. All installed cleanly with a packet manager,
not by hand as we see often advisable in such cases.

All this convenience, and the non-formality could even be quantified.  The
website, [front-end of AUR][1], announces 32,000 packages available for
archers, it's more than 29,000 packages [debian announced on their home
page][2]. So I know that is not the same and that is not far from being a
troll, but it is a fact that Arch Linux has a community and a number of
developers much less important than Debian, and is undeniable, for this system,
Arch Linux is able to offer to his users almost as many packages.

From the maintainer's point of view, those concerned with the `[community]`
repository, they can easily demote a package in AUR so it was officially
supported, without worrying to much about consequences, associated with the
fact that Arch Linux only supports two architectures, not dragging dozen
architecture to their credit. these two points I believe are the key to their
reactivity, and can keep a small core team (no more than two dozen core-dev,
without TU's). A responsiveness of a small team to a rolling release enough
stable to interest a median users of Linux.

AUR also allows a developer to easily share its application, whatever the
language chosen, each language generally offers opportunities, such as
`pip` (python) `gem` (ruby), it is still nice to have an opportunity to ensure
the smooth running of installation on its own distribution. Simplify
installation and distribution of software that is not known and still under
development, is a good way to promote an application.  Furthermore, PKGBUILD
allows be easily coupled to a manager for review as git or svn, allowing for
easier returns on development issues by an user.

Among all these points, everyone's winner, from the median user
to developers. I hope that with these explanations, far from being
exhaustive, the success of the AUR for Arch Linux is more clear implications
that can be blurred at first.

Without AUR, Arch Linux would no longer be the same.

***Edit**: More comments on [Hacker News][5], or on [Reddit][6].*

[1]: http://aur.archlinux.org/ 
[2]: http://www.debian.org/
[3]: http://www.nicosphere.net/suivre-hacker-news-depuis-la-console-2372/
[4]: http://www.nicosphere.net/suivre-reddit-depuis-la-console-2392/
[5]: http://news.ycombinator.com/item?id=3181579
[6]: http://www.reddit.com/r/archlinux/comments/lwbvv/why_aur_is_part_of_the_arch_linux_success/
