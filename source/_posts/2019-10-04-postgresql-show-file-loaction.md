---
title: Postgresql show file loaction
date: 2019-10-04 15:39:27
tags:
- postgresql
categories: 
- computer
- linux
---
显示文件位置的命令
```SQL
SHOW data_directory;
SHOW config_file;
Select name ,setting From pg_settings Where category = 'File Locations';
SHOW all;
```
