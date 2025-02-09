---
title: PowerShell && FireWall
date: 2019-11-07 19:31:53
tags:
- shell
categories: 
- computer
- windows
---
#### PowerShell 设置防火墙
```powershell
##关闭防火墙
Get-NetFirewallProfile | Set-NetFirewallProfile -enabled false
##允许ping
Set-NetFirewallRule –Name “FPS-ICMP4-ERQ-In” –Enabled True
Set-NetFirewallRule –Name “FPS-ICMP4-ERQ-Out” –Enabled True
```
