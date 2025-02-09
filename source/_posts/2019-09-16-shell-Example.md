---
title: Linux Shell Example
date: 2019-09-16 20:55:44
tags:
- shell
- grep
categories: 
- computer
- linux
---
### grep
```bash
#-r 递归目录
#-i 大小写不敏感
#--exclude-dir 排除目录
#--include 包含指定文件 
#-l 只显示搜索到内容的文件名
#-L 只显示搜索不到内容的文件名
grep -r --exclude-dir=node_modules --exclude-dir=build --include  \*.js 'deve' ./
