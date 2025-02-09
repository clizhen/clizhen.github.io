---
title: Linux Find Example
date: 2019-09-22 18:55:20
tags:
- shell
categories: 
- computer
- linux
---
* 名字
  ```Bash
  find . -name "lizhen.c"; 
  find / -iname "lizhen.c"
  ```
* 目录深度
  ```Bash
  find -maxdepth 2 -name passwd ; 
  find / -mindepth 3 - maxdepth 5 -name passwd
  ```
* 反向
  ```Bash
  find -not -iname "lizhen.c"
  ```
* 执行命令
  ```Bash
  find -iname "lizhen.c" -exec md5sum {} \;
  ```
* 文件权限
  ```Bash
  find. -perm -g=r -type f -exec ls -l {} \;
  ```
* 空文件
  ```Bash
  find ~ -empty
  ```
* 大小
  ```Bash
  find ~ -size +100M
  ```
* Top 5 Big files
  ```Bash
  find . -type f -exec ls -s {} \; | sort  -n -r | head -5
  ```
* find files by comaring with the modification time of other file
  ```Bash
  find -newer ordinary_file
  ```
+ 最近几天没有修改的文件
  ```Bash
  find . -mtime +60
  ```
+ xargs 
  ```Bash
  find ~ -name '*.log' -print0 | xargs -0 cat
  ```
  *备注: xargs 默认是以空白字符 (空格, TAB, 换行符) 来分割记录的,当这些不能分割时需设置为NULL分割.*
