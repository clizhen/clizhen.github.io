---
title: Linux NETSTAT SS
date: 2021-08-28 20:19:39
tags:
- network
categories: 
- computer
---
### netstat ss

#### NETSTAT
* -l, –listening display listening server sockets
* -a, –all display all sockets (default: connected)
* -r, –route display routing table
* –i, –interfaces display interface table
* -g, –groups display multicast group memberships
* -s, –statistics display networking statistics (like SNMP)
* -M, –masquerade display masqueraded connections
* -v, –verbose be verbose
* -W, –wide don’t truncate IP addresses
* -n, –numeric don’t resolve names
* -e, –extend display other/more information
* -p, –programs display PID/Program name for sockets
* -o, –timers display timers
* -F, –fib display Forwarding Information Base (default)
* -C, –cache display routing cache instead of FIB

```bash
sudo netstat -pln | grep 22 | awk '{print $NF}'
```

监听22端口的进程

```bash
netstat -at
netstat -lu
```

1. 列出所有TCP端口
1. 列出所有监听的UDP端口


#### SS
* –n, –numeric don’t resolve service names
* -r, –resolve : resolve host hostnames.
* -l, –listening display listening sockets
* -o, –options show timer information
* -e, –extended show detailed socket information
* -m, –memory show socket memory usage
* -p, –processes show process using socket
* –s, –summary show socket usage summary
* -N, –net switch to the specified network namespace name
* -4, –ipv4 display only IP version 4 sockets
* -6, –ipv6 display only IP version 6 sockets
* –0, –packet display PACKET sockets
* -t, –tcp display only TCP sockets
* -S, –sctp display only SCTP sockets
* -u, –udp display only UDP sockets
* -w, –raw display only RAW sockets
* -x, –unix display only Unix domain sockets
* -f, –family=FAMILY display sockets of type FAMILY

```bash
ss -tlp
ss -t dst 192.168.1.10:443
ss -t state established '( dport = :ssh or sport = :ssh )'
```

1. 列出监听的TCP协议并包括对应的进程
1. 列出连接到192.168.1.10:443的栈
1. 列出所有ssh相关的连接
