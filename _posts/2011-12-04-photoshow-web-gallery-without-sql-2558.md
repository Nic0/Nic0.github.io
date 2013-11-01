---
layout: post
title: PhotoShow, Web gallery without SQL
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
---
When it comes to web gallery, I usually choose [Piwigo][1], a safe choice for a
stable PHP gallery.

Last week, I heard about a new project, called [PhotoShow][4], a nice
looking web gallery. A [demo website][3] is available. Here a quick functionalities review.

- Easy installation, get latest tarball on github, or simply a git clone, set
  two lines from the configuration file, and you are ready to go.
- Structure based on file system  and directory, easy to manages and organizes
  photos and structures.
- Generate thumbnails and 800\*600 images automatically with phpthumb.
- Two based directories, one with real photos, one with generated ones.
- Drag n' Drop to upload and manages the website.
- No SQL bases needed, it only based on the file system.
- Nice looking jQuery effects.
- Work fine without JavaScript.
- Manage public and private albums.
- Comments system.

<a href="/img/photoshow.png"><img src="/img/photoshow.png" alt="" title="photoshow" width="653" height="155" class="aligncenter size-full wp-image-2559" /></a>

First, I have to warn you that PhotoShow still on a early stage of his
developpment. It seems stable enough, the project should improve quickly in a
near future, with probably some new features. So perhaps it isn't ready for
*production*, but should be fine for a personal use.

Installation and configuration are straight forward, the easiest is use `git
clone`, it would be simple to keep the gallery update with upstream by doing a
`git pull`. You need to edit the `conf.ini` file, to set both photos and
generated photos pathname. Once it done, you only need to answer the form to
set your name/password account, and you're done.o

{% highlight bash %}git clone https://github.com/thibaud-rohmer/PhotoShow.git{% endhighlight %}

Some would appreciate the drag n' drop system, I personally liked the
disposition of thumbnails, compact as google galleries, managed well
different size to find the optimal display, allow you to quickly see every
photos of an album. 

I will keep an eye on this project for sure.

At last, the code can be found on [github][2], under the GNU GPLv3.

[1]: http://piwigo.org/
[2]: https://github.com/thibaud-rohmer/PhotoShow
[3]: http://www.photoshow-gallery.com/demo/
[4]: http://www.photoshow-gallery.com/
