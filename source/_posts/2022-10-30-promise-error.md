---
title: PROMISE ERROR
date: 2022-10-30 14:08:52
tags:
- javascript
categories: 
- computer
- program
---
#### JS PROMISE ERROR

一般规则: 
**子函数返回Promise,不必使用catch处理,错误处理由最顶层的Promise处理.**
* promise reject 后，没有被catch的话，目前不会结束代码运行。会继续执行后续代码，不过会在最后报个警告： UnhandledPromiseRejectionWarning。并提示在后续的 node 版本中会导致进程非正常结束，就是崩掉。

* Async的作用有二个
  1. 函数返回 Promise
  2. 函数中使用 await 
* await 对错误的处理方式:
  * await 执行时如返回REJECT,则扔出错误,可以使用try/catch语句捕获.
* Then , Catch , Finally
  * catch 捕获错误,
  * 使用reject 而不是throw
  * finally 不影响 then/catch的数据流.不接受任何参数,可做一些清理工作.
```javascript
# Output: Good ABC Promise{ <state>: "fulfilled" ,<value>: undefined }
Promise.resolve("ABC").finally(() => console.log("Good")).then((dat) => console.log(dat));
# Output: Good Promise{ <state>: "fulfilled", <value>:"ABC" }
Promise.reject("ABC").finally(() => console.log("Good")).catch((dat) => dat);
```
