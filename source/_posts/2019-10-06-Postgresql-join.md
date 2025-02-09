---
title: Postgresql join
date: 2019-10-06 20:21:04
tags:
- postgresql
categories: 
- computer
- linux
---
### postgresql 中join的选项

- **Nested Loops(O(n2))**
```
for x in table1:
  for y in table2:
    if x.field == y.field
      issue row
    else
      keep doing
```

- **Hash joins**
```
Hash join
  Sequentialscan table 1
  Sequentialscan table 2
```

- **Merge joins(O(n * log(n)))**
```
Merge join
  Sort table 1
    Sequetial scan table 1
  Sort table 2
    Sequetial scan table 2
---
Merge join
  Index scan table 1
  Index scan table 2
```
