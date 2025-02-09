---
title: Postgresql reload config
date: 2019-10-04 15:27:00
tags:
- postgresql
categories: 
- computer
- linux
---

+ command-line reload
  ```Bash
  #方法1
  sudo service postgresql-x.x reload
  #方法2
  su -c root 'service postgresql-x.x reload'
  #方法3
  su - postges
  /usr/bin/pg_ctl reload
  ```
+ using sql reload
  ```Sql
  Select pg_reload_conf();
  ```
