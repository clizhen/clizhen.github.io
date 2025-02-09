---
title: Postgresql -- Schema
date: 2019-09-29 16:48:10
tags:
- postgresql
categories: 
- computer
- linux
---
### postgresql 架构命令
```Sql
Select current_schema();
Show search_path;
Create Schema ...;
Alter Schema ...;
Drop Schema ...;
Set search_path To ..., ...
Grant Usage On Schema schema_name To user_name
Grant Create On Schema schema_name To user_name;
\dn #get the list of schemas;
```
