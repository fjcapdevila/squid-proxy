squid-proxy
===========

This is a simple Dockerfile to build a proxy container. It will use the famous Squid
proxy, configured to work using simple NCSA authentication.

### Why?
A friend asked me about how to implement a proxy server in Linux, then I created this
small project to help him.

### How?

First of all clone the repository:

```
git clone https://github.com/fjcapdevila/squid-proxy.git
```

Then you will need to generate your password file. To generate password entries
you will need the htpasswd utility. If you have Apache installed, you already have it.
Otherwise run:

```
apt-get install apache2-utils
```

Create a username/password pair:

```
htpasswd /path/to/squid_passwd user1
```

Replace ```user1``` with a username. You can repeat this step at any time to create
new users.

Other way to do this, is using an online tool, like:
http://www.htaccesstools.com/htpasswd-generator/

These are some examples (test/test and prueba/prueba)
```
test:$apr1$RPhePtI9$UlcqFC/BtSpcz511FVsg20
prueba:$apr1$bdC46Ctv$Ncvl/AaoxHlg4Io7PMPHC0
```

**DO NOT USE THEM IN PRODUCTION.** Generate your own pairs!

Once you have the passwords saved, you can build the image:
```
docker build -t fjcapdevila/squid-proxy .
```
Finally, start the proxy

```
docker run --net host fjcapdevila/squid-proxy
```

### More information

I have taken some ideas from these sites:

- https://www.linode.com/docs/networking/squid/squid-http-proxy-ubuntu-12-04
- https://github.com/jpetazzo/squid-in-a-can

For more information, please check Docker and Squid official documentation:

- https://www.docker.com/
- http://www.squid-cache.org/