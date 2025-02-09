---
title: 查看公网IP地址
date: 2022-04-17 16:09:05
tags:
- network
categories: 
- computer
- linux
---
### GET Public IP
  家里联通猫得到的是100.64.x.x的运营商私有区域地址.为获得使用的公网地址可采用如下方法:
```bash
dig +short myip.opendns.com @resolver1.opendns.com
dig +short txt ch whoami.cloudflare @1.0.0.1
dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
host myip.opendns.com resolver1.opendns.com
# 使用第三方网站
curl ifconfig.me
curl icanhazip.com
curl ipecho.net/plain
```
