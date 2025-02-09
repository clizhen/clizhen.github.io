---
title: REDIS
date: 2022-03-16 19:23:46
tags:
- program
categories: 
- computer
- other
---
### REDIS 是什么,能干什么
* redis的特性是快, 简化开发 . 
* 不能替代数据库, 是以数据库为核心应用的强力补充.
* redis用内存存储数据.(disk only for persistence)内存大小,决定了redis处理数据大小.
* 数据模型是独特的
  * sting ( strings ,int ,float )
  * list
  * hash
  * set
  * zset
* 事务 ( watch ,unwatch ,mult ,exec )
  * watch 是乐观锁 ,不使用数据库中的悲观锁.( 例如: 更新前锁定 )
* 数据持久模式 : snapshotting , aof

