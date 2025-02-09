---
title: Windows AD Time
date: 2019-09-18 21:16:54
tags: 
- system
categories: 
- computer
- windows
---
![](/images/ad_time.gif)
### Windows AD域(单域)内的时间同步只需掌握以下几点:
*** 域内工作站/服务器与登陆时的联络的DC同步时间，此DC与Root PDC角色的DC同步时间。***

*有效的时间服务器可查询 http://www.pool.ntp.org/*

1. 域控(Root PDC角色)上需要与外部时间源同步,命令如下:
  W32tm /config /manualpeerlist:time.nrc.ca /syncfromflags:manual /reliable:yes /update  
  W32tm /resync /rediscover  
  net stop w32time && net start w32time  

2. 域控(非PDC角色),运行以下命令:
  w32tm /config /syncfromflags:domhier /update  
  w32tm /resync /rediscover  
  net stop w32time && net start w32time  

3. 遇到问题，重建时间配置：
  net stop w32time
  w32tm /unregister
  w32tm /register
  net start w32time


* 域内机器同步: net time \DC Name或ip /set /y
* 查看时间源: w32tm /monitor
* 查看登录服务器: echo %logonserver%
