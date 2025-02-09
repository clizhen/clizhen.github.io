---
title: SQL XACT_ABORT
date: 2019-09-15 12:48:34
categories: 
- computer
- windows
tags:
- sql
---
When SET XACT_ABORT is ON, if a Transact-SQL statement raises a run-time error, the entire transaction is terminated and rolled back. When SET XACT_ABORT is OFF, in some cases only the Transact-SQL statement that raised the error is rolled back and the transaction continues processing.
