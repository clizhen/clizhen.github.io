---
title: Postgresql -- Move Data Directory
date: 2019-09-29 16:18:31
tags:
- postgresql
categories: 
- computer
- linux
---

### 移动PostgreSQL数据目录
[转载](https://www.digitalocean.com/community/tutorials/how-to-move-a-postgresql-data-directory-to-a-new-location-on-ubuntu-16-04)

+ 移动数据目录
```Bash
$ sudo -u postgres psql
postgres# SHOW data_directory
$ sudo systemctl stop postgresql
$ sudo systemctl status postgresql  # 确认已停止.
$ sudo rsync -av /var/lib/postgresql /mnt/... # -a 保留权限
```
+ 指向新数据库
```Bash
$ sudo vim /etc/postgresql/.../postgresql.conf # 修改: data_directory = '新路径...'
```

+ 重启PostgreSQL,并验证
```Bash
$ sudo systemctl start postgresql
$ sudo systemctl status postgresql
$ sudo -u postgresql psql
postgres=# SHOW data_directory
```
