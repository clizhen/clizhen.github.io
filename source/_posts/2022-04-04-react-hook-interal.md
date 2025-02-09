---
title: React Hook Internal
date: 2022-04-04 10:46:04
tags:
- program
categories: 
- computer
- linux
---
### REACT HOOK 
#### React Fiber with Render and Commit phrases
![](/images/react_fiber.png)
* fiber 是react创建的内部对象代表每个元素(element),可以是一个DOM,也可以是一个函数部件.
* hook出现之前的函数部件,只接受属性(那时的react引擎不使用fiber). 因为函数不能保存状态,而使用fiber后,状态保存在fiber中.类似与将函数使用的变量保存函数体外.(例如: 全局变量可供所有函数使用).
* React 为每个元素创建2个fiber.一个为"**current**" ,一个为"**workInProgress**".
  * "current" 在屏幕上展示给客户. 同时 "workInProgress"在后台处理更新,一旦完成,后者转变为"current".
  * 初始化时,我们称为**Mount**, 每个部件都需创建, 比较费时. "workInProgress"创建完成后变为"current"(就是一个指针分配).
  * 当发生更新时, 我们称为**Update** ,"workInProgress"再次创建,但他从"current"克隆未变的部分.速度大大加快, 完成后成为"current".

#### React useState
```js
const [ data ,setData ] = useState();
```
* 当代码使用setData时 ,意思是 Dispatch action ,引擎将action安排至对应fiber中hook对应的更新队列.下次更新时执行.
* 执行的结果决定了**Update**时, data获得的最新状态.

#### React useEffect
##### What is a side effect?
* 相对于纯函数, 函数有隐含的依赖.
* 解决方式有二种:
  1. 将依赖都放入函数参数中. 完美解决方式,但有时很难实现.
  2. 将依赖打包并推迟到最后, 直到真正需要时才执行.在下面例子中,c and log 作为输入参数.所以addFunc是纯的, add 也是纯的.
```js
function addFunc(c ,log) {
function add(a ,b) {
  log(a,b)
  return a + b + c
}
return add
}
```
#### useEffect
```js
useEffect( () => { ...; return ... }, [DependArray] )
```
* useEffect 位于上图的绿色部分.再更新完DOM后执行.
* useEffect 将使用fiber的updateQueue属性,保存effect函数(分为 create 和destory两类), 取决于场景Mount/Upudate 和 依赖数组.
* 每次更新完屏幕后, react引擎会flush effect 队列.(先 destory ,后 create)
