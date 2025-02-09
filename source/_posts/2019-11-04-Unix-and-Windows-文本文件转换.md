---
title: Unix and Windows 文本文件转换
date: 2019-11-04 19:33:08
tags:
- shell
categories: 
- computer
- linux
---
[原文](https://kb.iu.edu/d/acux)
+ windows: line feed + carriage return
+ unix: a line feed

#### vim中转换文本文件(方法之一)
```Vim
:set ff=unix
:set ff=dos
```

