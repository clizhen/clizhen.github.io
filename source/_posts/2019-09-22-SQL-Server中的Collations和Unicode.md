---
title: SQL Server中的Collations和Unicode
date: 2019-09-22 18:27:23
tags: 
- sql
categories: 
- computer
- windows
---
  我们知道计算机只能识别0和1, 当我们在SQL SERVER中保存和读取字符时就遇到了编码问题，SQL中字符从编码角度来看可分为2类，Unicode (nchar ,nvarchar)和非Unicode(char ,varchar) ,对于Unicode来说每个字符的码是一样的，不同语言不同版本的工具处理Unicode不存在问题。对于非Unicode 的字符，每个字符的码不一样，依赖于所属的代码页，只有知道了代码页，才能正确解释构成字符的0和1。而查询Collations就能得到代码页，同时Collations 对所有的Unicode 和非Unicode 规定了排序规则：大小写、重音、假名等。对于nvarchar ,nchar来说无关Collations中的代码页。
