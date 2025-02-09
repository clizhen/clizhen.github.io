---
title: PowerShell Remoting && Job
date: 2019-11-09 11:43:19
tags:
- shell
categories: 
- computer
- windows
---
#### 远程
WinRM 打开: Enable-PSRemoting -force
```powershell
##交互
Enter-PSSession -ComputerName XXXName -Credential domainxxx\userxx
##运行远程命令
Invoke-Command -ComputerName SErver01, SErver02 -ScriptBlock {...}
Invoke-Command -ComputerName SErver01, SErver02 -FielPath c:\Scripts\...
##建立连接
$s = New-PSSession -ComputerName SErver01, SErver02
Invoke-Command -Session $s ...
```
#### 远程编辑
+ 使用vs code 中的powershell插件 ,进入其集成的PS环境,远程后调用psedit.

#### JOB
```powershell
Start-Job -ScriptBlock {...}
$job = Get-Job -Id 1
##查询结果
Receive-Job -Job $job
##删除
Remove-Job -Job $job
##查找失败原因
$job.ChildJobs[0].JobStateInfo.Reason
##远程 
Invoke-Command -ComputerName SErver01  -ScriptBlock {...} -asjob
Invoke-Command -Session $s -ScriptBlock { start-job -ScriptBlock { ... }}
```

