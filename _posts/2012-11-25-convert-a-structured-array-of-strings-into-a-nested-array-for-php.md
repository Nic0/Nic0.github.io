---
layout: post
title: Convert a structured array of strings into a nested array for PHP
category: programming
tags:
- php
---

It's a long title, I agree, but I'll try to explain simply what I wanted to do.

Let's consider the following PHP associative array.

{% highlight php %}
<?php

    $data = array(
        'mysql_host'            => 'localhost',
        'mysql_db'              => 'mydatabase',
        'mysql_password'        => 'mypass',
        'foo'                   => 'bar',
        'some_very_long_path'   => 'some data' 
    );
?>
{% endhighlight %}

I want to convert to a nested array like:

{% highlight php %}
<?php

    $data = array(
        'mysql' => array(
            'host' => 'localhost',
            'db'   => 'mydatabase',
            'password' => 'mypass'
        ),
        'foo' => 'bar',
        'some' => array(
            'very' => array(
                'long' => array(
                    'path' => 'some data'
                )
            )
        )
    );
?>
{% endhighlight %}

Ideas beyond that, is to convert the array into an YAML config, but the important
part is that I can't assume how deeply nested will be the array. Here the corresponding
YAML configuration file, for example purpose.

{% highlight yaml %}
mysql:
    host: localhost
    db: mydatabase
    password: mypass
foo: bar
some:
    very:
        long:
            path: some data
{% endhighlight %}

So, here the solution that I came up, using a reference, to keep track of the
positionning of the constructed array.

{% highlight php %}
<?php

    function postToArray ($post) {
        $config = array();

        foreach ($post as $key => $value) {

            $reference = &$config;
            $path = explode('_', $key);

            for ($i=0; $i < sizeOf($path); $i++) {
                if ($i == sizeOf($path)-1) {
                    $reference[$path[$i]] = $value;
                } else {
                    if (!array_key_exists($path[$i], $reference)) {
                        $reference[$path[$i]] = array();
                    }
                    $reference = &$reference[$path[$i]];
                }
            }
        }

        return $config;
    }
?>
{% endhighlight %}

I'll be more than happy if someone could point me at a better solution. Hope it
could help someone else than myself.

EDIT: thanks to Nicoon, for [his solution on Reddit][1], that use a recursive
function, and point out that HTTP allow this already nicely.

[1]: http://www.reddit.com/r/PHP/comments/13rau5/convert_a_structured_array_of_strings_into_a/c76ggc9
