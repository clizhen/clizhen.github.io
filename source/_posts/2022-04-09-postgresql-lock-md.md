---
title: postgresql 事务隔离级别
date: 2022-04-09 09:38:04
tags:
- postgresql
categories: 
- computer
- linux
---
### 事务隔离级别
* 事务隔离级别简单的说，就是当激活事务时，控制事务内因SQL语句产生的锁定需要保留多入，影响范围多大，以防止多人访问时，在事务内发生数据查询的错误。
* postgresql 使用MVVC 读快照 , 读永远不妨碍写.
* postgresql 默认使用READ COMMITTED事务隔离级别. 就是说事务中每个语句得到一个新的数据快照.为了使一个事务使用同一快照,请使用REPEATABLE READ事务隔离级别. postgresql中最后一个隔离级别是SSI串行读.

For Update 类似update一样锁定行, 必须等待commit后才释放锁.  For Update NOWait ,nowait 就是不等待,当已被其他事务锁定时,直接报错.
```sql
BEGIN;
  Select * From invoice Where processed = false For Update;
  ** application magic will happen here **
  Update invoice Set processed = true ...
COMMIT;
```
其他: postgresql 的 advisory locks.
