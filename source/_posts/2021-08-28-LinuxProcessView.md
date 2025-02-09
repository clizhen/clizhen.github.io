---
title: Linux 进程查看
date: 2021-08-28 11:31:10
tags:
- system
categories: 
- computer
- linux
---
### ps,pidof,pgrep,fuser,lsof

## PS

```bash
ps -aux
```

x :所有类型进程.
a :所有用户.
u :格式选项.

```bash
ps -U root
```

U :指定用户.

##### PIDOF

```bash
pidf nvim
```

获得正在运行的程序nvim的进程ID.

```bash
sudo kill -9 $(pidof firefox)
```

脚本中用法.

```bash
pidof -x script.py
```

包含脚本名的进程ID.

##### PGREP

```bash
pgrep -l ssh
```

pgrep 相当于 ps -eo pid,cmd | awk '{print $1,$2}' grep KeyWord

## FUSER
文件或网络端口使用的进程号.

```bash
fuser --namespace tcp port
fuser --verbose path/to/file_or_directory
```

## LSOF
打开的文件及对应的进程

```bash
lsof path/to/file
lsof -i :port
lsof -u username
lsof -c process_or_command_name
lsof -p PID
lsof -iTCP:port -sTCP:LISTEN
```

1. 发现打开文件的进程
1. 发现打开指定端口的进程
1. 指定用户打开的文件
1. 指定命令打开的文件
1. 指定进程打开的文件
1. 发现Listen指定端口的进程
