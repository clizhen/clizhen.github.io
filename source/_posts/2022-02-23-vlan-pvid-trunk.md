---
title: VLAN-PVID-TRUNK
date: 2022-02-23 19:47:38
tags:
- network
categories: 
- computer
- other
---
### VLAN 端口转发规则

#### PVID
* PVID即 Port Vlan id，代表端口的缺省VLAN。默认PVID为1.
* 交换机从对端设备收到的帧有可能是不带VLAN标签的数据帧，但所有以太网帧在交换机中都是以带VLAN标签的形式来被处理和转发的，因此交换机必须给端口收到的不带VLAN标签的数据帧添加上VLAN标签。

#### ACCESS 端口规则
##### 发送
* 数据包Tag与PVID相同,剥离Tag发送.
* 数据包Tag与PVID不同,丢弃.

##### 接受
* 数据包无Tag,接受并打上PVID,进行交换转发.
* 数据包有Tag,丢弃.

#### TRUNK/HYBRID 端口规则
##### 发送
* 数据包Tag与PVID相同,剥离Tag发送.
* 数据包Tag与PVID不同,且在允许Tag列表中,带Tag直接发送(Hybrid 可控制是否携带Tag),默认转发所有Tag.

##### 接受
* 数据包无Tag,接受并打上PVID,进行交换转发.
* 数据包有Tag,且在允许Tag列表中,进行交换转发,否则丢弃.

**备注: 上述发送和接受指的是交换机对外的数据流.**
