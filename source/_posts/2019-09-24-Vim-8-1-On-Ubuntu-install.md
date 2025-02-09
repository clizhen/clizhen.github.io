---
title: Install vim 8.1 on Ubuntu
date: 2019-09-24 20:09:37
tags:
  - vim
categories:
  - computer
  - linux
---

- 使用不受信任的 ppa, 安装不受支持的软件.

```Bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim
```

- 删除 vim

```Bash
sudo apt-get remove vim
```
