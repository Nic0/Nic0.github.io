---
layout: post
title: Code Snippets For Delphi
category: Programming
tags:
- Delphi
---
Like I said in the previous post, I started learning Delphi recently. So here's
quick trick about code snippets, also knows as code templates, or live templates in the Delphi
world. Code snippets are so useful that every IDE or decent text editor implements
it.

In the Deplhi's IDE, the shortcut to get thoses snippets is an unintuitive `ctrl+J`,
or sometime `TAB` with some of theme. We find traditionnal conditions, loops, 
procedures, functions or even class templates. The nice things is you often append
a `b` to your trigger word to get the begin/end block added to the structure. As
`if`, and `ifb`.

It's nice, but I wanted to learn to get my own one. What about a `fan` that would
generate a `FreeAndNil(MyVar);` automaticaly ?

Here the steps to do so.

First, search for code template in the tool palette, or you can find it in the menu
as well. The code generate for the snippet is an XML file, and easy to get on. 
You need to define the langage (Delphi), the break points, and it's important to
define the delimiter, it must have some sort of default value, but I couldn't find
it, so make sure de delimiter is define, otherwise it will not work. Remember as well
to add the `|end|`, this add the last break point when pressing TAB. The manual part
make sure the snippet is trigger on TAB (not sure of this one).

So here the code to generate a `FreeAndNil` template :

{% highlight xml %}
<?xml version="1.0" encoding="utf-8" ?>
<codetemplate xmlns="http://schemas.borland.com/Delphi/2005/codetemplates" version="1.0.0">
  <template name="fan" invoke="manual">
    <point name="variable">
      <text>
        MyVar
      </text>
      <hint>
        Free and Nil a variable
      </hint>
    </point>
    <description>
      Create a FreeAndNil
    </description>
    <author>
      Nicolas Paris
    </author>
    <code language="Delphi"  delimiter="|"><![CDATA[
        FreeAndNil(|variable|);|end|
      ]]>
    </code>
  </template>
</codetemplate>
{% endhighlight %}

Well, not a big deal, some newbie stuff as I am, for other newbies. Feel free to share
your snippets.