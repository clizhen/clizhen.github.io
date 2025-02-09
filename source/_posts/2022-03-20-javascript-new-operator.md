---
title: JavaScript_New_KeyWord
date: 2022-03-20 13:27:18
tags:
- program
categories: 
- computer
- linux
---
### JS new 操作符

JS的new是为了模仿其他类语言(java,C#)创建对象而设置的.掩盖了JS对象原型链的本质.是语言设计的糟点. 

请参考[What is the 'new' keyword in JS?](https://stackoverflow.com/questions/1646698/what-is-the-new-keyword-in-javascript)

***理解new,关键点如下***
1. 它创建一个新对象.对象类型是简单对象{}
2. 将这个新对象内部不可访问的[[prototype]](__proto__)属性设置为构造函数的外部可访问的原型对象(每个函数对象都自动具有原型属性)
3. 使this变量指向新创建的对象.
4. 返回新创建的对象，除非构造函数返回非空对象引用。在这种情况下，将返回该对象引用。
注意: 最困难的是第二步,每个对象（包括函数）都有这个称为 [[prototype]] 的内部属性。它只能在对象创建时设置，可以使用 new、Object.create 或基于字面量（函数默认为 Function.prototype，数字为 Number.prototype 等）。它只能用 Object.getPrototypeOf(someObject) 读取。没有其他方法可以设置或读取此值
```javascript
ObjMaker = function() {this.a = 'first';};
// 普通构造函数.

ObjMaker.prototype.b = 'second';
// ObjMaker的prototype(原型属性)可修改,它还有一个[[prototype]]属性不可修改.

obj1 = new ObjMaker();
// 新对象obj1创建了, 就是{}. 
// obj1 的 [[prototype]] 设置为当前ObjMaker.prototype的对象值(如果ObjMaker.prototype以后分配新值,obj1的[[prototype]]不会改变,但是你可以更改ObjMaker.prototype的属性来影响obj1).
// 执行ObjMaker时,obj1代替this...,所以obj1.a设置为'first'.
```

***new 的伪代码***
```javascript
function New(func) {
  var res = {};
  if (func.prototype !== null) {
  res.__proto__ = func.prototype;
}
var ret = func.apply(res, Array.prototype.slice.call(arguments, 1));
if ((typeof ret === "object" || typeof ret === "function") && ret !== null) {
  return ret;
}
  return res;
}
```

***JS Object.create 的伪代码***
```javascript
Object.create = function(proto ,propertiesObject) {
  if (typeof proto !== 'object' && typeof proto !== 'function') {
    throw new TypeError('Object prototype may only be an Object:' + proto)
  }
  function F() {}
  F.prototype = proto;
  return new F();
}
```
