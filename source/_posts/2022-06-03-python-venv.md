---
title: Python3 开发准备
date: 2022-06-03 08:43:15
tags:
- program
categories: 
- computer
- linux
---
##### 虚拟环境
```bash
python -m venv myvenv # 创建
source myvenv/bin/activate #激活,source means that is is executed in the current shell.
deactivate
```

##### 安装
```bash
pip freeze > requirements.txt
pip install -r requirements.txt
pip install ... -i https://mirrors.aliyun.com/pypi/simple/ #阿里源
```
