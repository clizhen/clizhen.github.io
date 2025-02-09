---
title: Postgresql bitmap heap/index scan
date: 2019-10-04 11:51:28
tags:
- postgresql
categories: 
- computer
- linux
---
[转载](https://dba.stackexchange.com/questions/119386/understanding-bitmap-heap-scan-and-bitmap-index-scan)

+ index scan 扫描索引,查找后**立即**读取对应数据页,是*随机读*.

+ bitmap heap scan 最终是*顺序读*. 一般用在多个索引同时使用时或单个索引多次使用时.

举例(先bitmap index scan 再bitmap heap scan):
![](/images/bitmapIndex.1.png)
bitmaps 按为与
![](/images/bitmapIndex.2.png)
bitmap heap scan 读入对应的页,再次按指定条件查找记录(re-checked).
![](/images/bitmapIndex.3.png).
