---
title: Postgresql static sys-view 性能
date: 2019-10-06 13:55:53
tags:
- postgresql
categories: 
- computer
- linux
---
[参考](https://www.cybertec-postgresql.com/en/3-ways-to-detect-slow-queries-in-postgresql/)

0. explain 计划
```sql
explain (analyze ,verbose ,consts ,timing ,buffers) Select ...
```

1. pg_stat_activity(观察当前系统活动),每个连接一行记录.
```sql
\d pg_stat_activity
Select pid ,query_stat ,state_change ,state ,query From pg_stat_activity;
```
  + pg_cancel_backend. (Select pg_cancel_backend(pid)),终止pid,保留连接.
  + pg_terminate_backend.

2. 检查数据库,pg_state_database
```sql
\d pg_state_database
```

3. 检查表 pg_stat_user_tables ,pg_statio_user_tables
```sql
\d pg_stat_user_tables
Select schemaname, relname ,seq_scan ,seq_tup_read,
  seq_tup_read /seq_scan as avg, idx_scan
From pg_stat_user_tables
Where seq_scan > 0
Order By seq_tup_read Desc
Limit 25;
\d pg_statio_user_tables
```

4. 深入索引 pg_stat_user_indexes
```sql
\d pg_stat_user_indexes
Select schemaname ,relname ,indexrelname ,idx_scan,
  pg_size_pretty(pg_relation_size(indexrelid)) as idx_size,
  pg_size_pretty(sum(pg_relation_size(indexrelid))
                  Over (Order By idx_scan ,indexrelid)) as total
From pg_stat_user_indexes
Order By 6;
```

5. 使用 **pg_stat_statements**
  1. postgresql.conf 中将 pg_stat_statements 加入 shared_preload_libraties.
  2. 重启 db server.
  3. 在你的database中运行 CREATE EXTESION pg_stat_statements.
```sql
\d pg_stat_statements
Select round((100 * total_time /sum(total_time)
        Over ())::numeric, 2) percent,
      round(total_time::numeric ,2) as total,
      calls,
      round(mean_time::numeric ,2) as mean,
      substring(query, 1, 40)
From pg_stat_statements
Order By total_time DESC
Limit 10;
Select pg_stat_statements_reset();
```
