---
layout: post
title: Download subtitles with Submarine
category: linux
tags:
- linux-en
- archlinux-en
---

I'm a big user of subtitles, the reason is simple, I always watch movies or
series in English, even if I'm French. To help me to understand movies, I use
English subtitles. In this way, it's easier for me to follow the film even if
I'm tired. It also help me to learn new words.

Like everything else, you don't want waste your time looking for subtitles around
the web, that why software come naturally for subtitle retrieving tasks.
That's exactly what *Submarine* does, and well.

I have to say that I didn't really looked for this kind of program, only tried
one, and I'm happy about it. I found *Submarine* while I was reading one of my
favorite section of the Arch Linux official forum called [Community
Contributons][1], it worths looking around for some new softwares announcing,
some of them has become quite famous since. Anyway, I saw [this
announcement][2] maybe a month ago of this program called *Submarine*.

Maybe *Submarine* isn't perfect, or doesn't find every subtitles that I want, but it
does a good job for sure.

Here some through about it:

- Command line: That's fine, who want some GUI for this kind of program anyway?
- Two servers: Submarine try to retrieve from OpenSubtitle and Podnapisi.
  That's sounds good to me.
- Download multiple movies at once: I found it useful for series. With series
  like Big Bang Theory, I like to watch several episode in a row. Therefor
  download all subtitles at once is faster.
- Download best rated: cool feature again, that it avoid badly ranked
  subtitles.
- Rename to match the movie: As VLC automatically loads subtitles if it match the
  movie title, it saves me some time to manually set the subtitle by rename the
  subtitle if needed.
- Language: More for information that a feature, but it use Vala.

If you're using Arch Linux, you can find it in *AUR* and install it via `yaourt
-S submarine`.

Source code can be seen [on github][3], and it's release under GPLv3. That's
it, no much more to say but thanks to the author of *Submarine*.

[1]: https://bbs.archlinux.org/viewforum.php?id=27
[2]: https://bbs.archlinux.org/viewtopic.php?id=124138
[3]: https://github.com/blazt/submarine
