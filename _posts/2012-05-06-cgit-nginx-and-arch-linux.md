---
layout: post
title: CGit, Nginx and Arch Linux
tags:
  - archlinux-en
  - linux-en
---
Here's a quick reminder to get CGit and Nginx running together on an Arch Linux
server. I assume you have already Nginx up and running.

First, we install the require packages.

{% highlight bash %}
pacman -S fcgiwrap cgit
{% endhighlight %}

The default configuration values for fcgiwrap should be fine, but you can check
anyway in `/etc/conf.d/fcgiwrap`.

Here the Nginx configuration for the CGit part.
*EDIT*: check the update code at the end of the post.

{% highlight nginx %}
server {
    listen       80;
    server_name  git.nicosphere.net;
    index cgit.cgi;
    gzip off;

    location / {
        root /usr/share/webapps/cgit/;
    }

    if (!-f $request_filename) {
        rewrite ^/([^?/]+/[^?]*)?(?:\?(.*))?$ /cgit.cgi?url=$1&$2 last;
    }
                                                }

    location ~ \.cgi$ {
        gzip off;
        include fastcgi_params;
        fastcgi_pass    127.0.0.1:9001;
        fastcgi_index   cgit.cgi;
        fastcgi_param   SCRIPT_FILENAME /usr/share/webapps/cgit/cgit.cgi;
        fastcgi_param   DOCUMENT_ROOT /usr/share/webapps/cgit/;

    }
}
{% endhighlight %}

Obviously, make sure the `server_name` is setup right. The `SCRIPT_FILENAME`
and `DOCUMENT_ROOT` are those used with the official Arch Linux package, it
might be different if you retrieved your own tarball.

Now, let's get all this running.

{% highlight bash %}
rc.d start fcgiwrap && rc.d restart nginx
{% endhighlight %}

Don't forget to add the `fcgiwrap` daemon to the corresponding `rc.conf` line,
to get it working when if you restart the server.

Once it's running, you might setup the `/etc/cgitrc` file as usual. You
certainly want add at least the CSS file as follow:

{% highlight ini %}
css=/cgit.css
{% endhighlight %}

**EDIT**: As I wanted a basic authentication, with an exception for the `/pub/`
directiory, and couldn't find the correct answer, I asked to
[StackOverflow][1]. The answer works fine for me, and even better that the
previous code. For the record, here the final nginx configuration:

{% highlight nginx %}
server {
    listen       80;
    server_name  git.nicosphere.net;
    index cgit.cgi;
    gzip off;

    root /usr/share/webapps/cgit;

    # $document_root is now set properly, and you don't need to override it
    include fastcgi_params;
    fastcgi_param   SCRIPT_FILENAME $document_root/cgit.cgi;

    location / {
        try_files $uri @cgit;
    }

    # Require auth for requests sent to cgit that originated in location /    
    location @cgit {
        auth_basic "Restricted";
        auth_basic_user_file /srv/gitosis/.htpasswd;

        gzip off;
        # rewrites in nginx don't match the query string
        rewrite ^/([^/]+/.*)?$ /cgit.cgi?url=$1 break;
        fastcgi_pass    127.0.0.1:9001;
    }

    location ^~ /pub/  {
        gzip off;
        rewrite ^/([^/]+/.*)?$ /cgit.cgi?url=$1 break;
        fastcgi_pass    127.0.0.1:9001;
    }
}
{% endhighlight %}

[1]: http://stackoverflow.com/questions/10486340/nginx-and-auth-basic-with-cgit
