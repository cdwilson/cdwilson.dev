---
title: Debugging embedded systems without wires
authors:
- Chris Wilson
date: "2022-06-28"
draft: true
slug: debugging-embedded-systems-without-wires
tags:
disableComments: false
typora-copy-images-to: ./images
---

Raise your hand if you came here because you thought that the title of this article was preposterous? 🙋🏻‍♂️

![duty_calls.png](https://imgs.xkcd.com/comics/duty_calls.png)

Ok...I'll admit, the title is ~~wrong~~ *a little tiny bit clickbaity*.  Obviously, we're never going to debug embedded systems without some wires involved.

But you're here now (ha!), so let's get on with it.

This articles isn't all lies and broken promises.  I'm going to show you how to leave that mess of USB-based dev boards and J-Link probes on your desk and work from a [laptop tied to a tree in the wilderness](https://mgsloan.com/posts/tree-based-computing/) or a [hammock under your deck](https://mgsloan.com/posts/ergo-update-hammock-under-deck/).

# The reveal

A while back I ran across a tweet from [@jaydcarlson](https://twitter.com/jaydcarlson) where he mentioned "doing USB over IP with VirtualHere".

{{< tweet user="jaydcarlson" id="1409896152766586893" >}}

It turns out that [VirtualHere](https://www.virtualhere.com/home) is a magical piece of software that can make USB devices plugged into one computer show up as normal USB devices on another computer.

![VirtualHere-Diagram700.jpg](https://www.virtualhere.com/sites/default/files/VirtualHere-Diagram700.jpg)

VirtualHere is the secret sauce that makes this all work.

# How to do the thing

Obviously, I had to try this out immediately.  I went rummaging through my ~~hoarder box~~ inventory looking for an embedded system that could host the VirtualHere server.
