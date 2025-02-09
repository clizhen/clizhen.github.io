---
title: Docker 按名称批量删除image
date: 2019-11-25 19:56:25
tags:
- shell
- docker
categories: 
- computer
- linux
---
#### go 模板
```bash
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep 'imagename')
```
