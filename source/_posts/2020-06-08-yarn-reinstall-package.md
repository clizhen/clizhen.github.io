---
title: Yarn Reinstall Package
date: 2020-06-08 21:50:17
tags:
- program
categories: 
- computer
- linux
---
**问题: 使用yarn upgrade-interactive 升级工程后, 某个软件包出错,需要重装**
查询网络后 ,使用以下指令解决:
```bash
rm yarn.lock
yarn add package-name --force
```
或
```bash
rm yarn.lock
yarn install --check-files
```
