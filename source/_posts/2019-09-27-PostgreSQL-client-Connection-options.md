---
title: Postgresql client Connection options
date: 2019-09-27 21:31:28
tags:
- postgresql
categories: 
- computer
- linux
---
**PostgreSQL 客户端常用的连接参数**
*注意:密码是不可能写在命令行上的,设置密码用.pgpass,环境变量*
```
Connection options:
    -d, --dbname=DBNAME 
    -h, --host=HOSTNAME
    -p, --port=PORT
    -U, --username=NAME connect as specified database user
```

**使用环境变量 连接PostgreSQL**
+ PGHOST
+ PGPORT
+ PGUSER
+ PGPASSWORD
+ PGDATABASE

**使用.pgpass 连接PostgreSQL**
在你的HOME目录下创建.pgpass文件,字段可用*
格式: **hostname:port:database:username:password**
```
chmod 0600 ~/.pgpass
```

