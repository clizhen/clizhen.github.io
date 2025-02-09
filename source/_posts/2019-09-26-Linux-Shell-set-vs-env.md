---
title: Linux Shell SET vs ENV
date: 2019-09-26 21:14:04
tags:
- shell
categories: 
- computer
- linux
---

**Shells can have variables of 2 types: locals, which are only accessible from the current shell, and (exported) environment variables, which are passed on to every executed program. set can see shell-local variables, env cannot.**

  Since set is a built-in shell command, it also sees sees shell-local variables (including shell functions). env on the other hand is an independent executable; it only sees the variables that the shell passes to it, or environment variables.

**When you type a line like a=1 then a local variable is created (unless it already existed in the environment). Environment variables are created with export a=1**

  What we have here the difference between environment variables and shell variables. Under sh (and variants) all environment variables are automatically shell variables as well, but the same is not true in the other direction (this originally was to save memory (I think)).

  Environment variables are stored in an area of memory that is kept when a process calls <strong>exec()</strong>, this means that programs you run from the command line get a copy of the environment. Shell variables do not stay over an exec(), but are copied in a fork(). When you create a subshell the shell calls <strong>fork() </strong>in order to copy the present process, but it does NOT call exec() because the process it requires is already there thus the shell variables are kept.

  Also most shells set for you certain shell variables when you start them up, PS1 is a perfect example of this, and you may have also set them yourself in your shell initalisation file.

  In summary, shell variables are used by the shell and copies it makes of itself, while environment variables are used by everything.

