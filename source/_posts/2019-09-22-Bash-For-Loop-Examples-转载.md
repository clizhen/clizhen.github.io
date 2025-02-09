---
title: Bash For Loop Examples(转载)
date: 2019-09-22 19:25:08
tags:
- shell
categories: 
- computer
- linux
---
[转载](http://www.cyberciti.biz/faq/bash-for-loop/)
```Bash
for VARIABLE in 1 2 3 4 5 .. N
do
  command1
  command2
  commandN
done
```
```Bash
for VARIABLE in file1 file2 file3
do
  command1 on $VARIABLE
  command2
  commandN
done
```
```Bash
for OUTPUT in $(Linux-Or-Unix-Command-Here)
do
  command1 on $OUTPUT
  command2 on $OUTPUT
  commandN
done
```
```Bash
for (( EXP1; EXP2; EXP3 ))
do
  command1
  command2
  command3
done
```
```Bash
#!/bin/bash
for (( c=1; c&lt;=5; c++ ))
do
 echo "Welcome $c times"
done
```
```Bash
#infinite loops
for (( ; ; ))
do
  echo "infinite loops [ hit CTRL+C to stop]"
done
```
```Bash
#!/bin/bash
for file in /etc/*
do
  if [ "${file}" == "/etc/resolv.conf" ]
  then
    countNameservers=$(grep -c nameserver /etc/resolv.conf)
    echo "Total  ${countNameservers} nameservers defined in ${file}"
    break
  fi
done
```
```Bash
#!/bin/bash
FILES="$@"
for f in $FILES
do
  # if .bak backup file exists, read next file
  if [ -f ${f}.bak ]
  then
    echo "Skiping $f file..."
    continue  # read next file and skip cp command
  fi
  # we are hear means no backup file exists, just use cp command to copy file
  /bin/cp $f $f.bak
done
```
