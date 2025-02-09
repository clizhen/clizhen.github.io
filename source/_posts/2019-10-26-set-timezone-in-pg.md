---
title: set timezone in pg
date: 2019-10-26 13:57:46
tags:
- postgresql
categories: 
- computer
- linux
---

### timezone 的设置
可以在连接参数中设置,也可以在服务器中修改或修改conf文件.

```sql
SELECT * FROM pg_timezone_names;
ALTER DATABASE postgres SET timezone TO 'Europe/Berlin';
```
