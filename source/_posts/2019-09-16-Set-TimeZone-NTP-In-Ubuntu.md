---
title: Set TimeZone & NTP In Ubuntu
date: 2019-09-16 19:57:48
categories: 
- computer
- linux
tags:
- system
---
### TimeZone

1. timedatectl list-timezones
2. sudo timedatectl set-timezone Asia/Shanghai
3. timedatectl

### NTP

1. sudo apt-get install ntp
2. sntp --version
3. sudo vim /etc/ntp.conf 选择[NTP server](https://support.ntp.org/bin/view/Servers/NTPPoolServers)
4. sudo service ntp restart
5. sudo service ntp status
