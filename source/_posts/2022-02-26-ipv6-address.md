---
title: IPV6-ADDRESS
date: 2022-02-26 20:19:38
tags:
- network
categories: 
- computer
- other
---
### IPV6 地址结构
* 地址长128位.(Routing Prefix(48) + Subnet ID (16) + Interface ID(64))
* 主机地址(Interface ID)建议永远保留64位.
* IPV6不再使用子网掩码的说法,现在叫前缀长度.

### IPV6 地址类型(单播,组播,任播)
#### 单播
* 可聚合全球地址(Global Unicast) 2000::/3
    * 电信(240e::/18),联通(2408:8000::/20),移动(2409:8000::/20)
* 本地链路(Link-Local) fe80::/10 相当于IPv4的169.254.0.0/16,不可路由.
* 回环(Loopback) ::1/128
* 本地唯一(Unique-Local) FC::/7 (FC00::/8暂未定义,当前 FD00::/8已定义),相当于IPv4的私有地址(10.0.0.0/8,172.16.0.0/20,192.168.0.0/24),不可在Internet路由.
* 未指定地址(Unspecified) ::/128

#### 组播(icmpv6 ndp 核心)
* 部分特定地址(FFxx::/8)
  * FF02::1 all nodes 在本地链路范围的所有节点
  * FF02::2 all routers 在本地链路范围的所有路由器
  * FF02::5 all ospf routers
  * FF02::9 all rip routers 所有运行RIP的路由器
  * FF02::A all eigrp routers 所有运行eigrp的路由器
  * FF05::2 在一个站点范围内的所有路由器
  * FF02::1:FFxx:xxxx/104 被请求节点组播地址(solicited-node multicast address)
    * 只在本地链路上有效,只包含一个用户,可从接口IPV6地址推算出.
    * 推算方式:被请求节点组播地址的前104位固定，将接口IP地址的后24位移下来填充到后面就可以了.
    * 组播地址映射MAC组播地址: 33-33-取IPv6组播地址的最后32bit

### ICMPv6
#### NDP(Neighbor Discovery Protocol 邻居发现协议)
* 地址解析步骤(获得对方mac ,netsh ipv6 show neighbors)
  1. 发送ICMPv6的邻居请求信息,目的IP为对方的被请求节点组播地址,目的MAC为对应的组播MAC.源IP/MAC均为本机接口对应地址.注意非广播报文,二层交换机是否广播由交换机能力决定.
  2. 接受方(本地网卡有对应的组播MAC)回送ICMPV6邻居通告消息,该消息包含本机接口MAC.
* 邻居状态跟踪(间隔发送邻居请求信息,根据回应做出判断)
* DAD(Duplicate Address Detection重复地址检测,保证单播地址不存在冲突,所有单播地址都需要通过DAD检测,才能启用),DAD 使用邻居请求和邻居通告来完成其机制.
* 无状态自动配置(自动配置IPV6地址)
  1. 自动生成本地链路地址(fe80::/10),并通过DAD
  2. 发送邻居请求消息尝试在链路上发现IPV6路由器.
  3. 路由器返回邻居通告消息（携带准备分配给主机的IPv6前缀信息。路由器在没有收到邻居请求消息时也能够主动发出邻居通告消息）
  4. 主机根据路由器回应的邻居请求消息，获得本链路IPv6地址前缀信息， 由前缀 + 接口ID 生成主机的IPv6单播。通过DAD,启用该地址.
* 路由器通告

### 二层组播技术(IGMP snooping)
  **问题:** 二层Switch由于组播报文的目的地址为组播组地址，在二层设备上是学习不到这一类MAC表项的(组播MAC不会出现在源地址上)，因此组播报文就会在Switch所有接口进行广播.
  **解决方法:** 当主机和上游三层设备之间传递的IGMP协议报文通过二层组播设备时，拥有IGMP Snooping技术的交换机可以分析报文携带的信息，根据这些信息建立和维护二层组播转发表，从而指导组播数据在数据链路层按需转发.
