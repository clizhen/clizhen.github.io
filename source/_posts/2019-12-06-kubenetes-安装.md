---
title: kubenetes 安装
date: 2019-12-06 20:14:59
tags:
- kubenetes
categories: 
- computer
- linux
---
**我基本上是按照这篇[文章](https://www.cnblogs.com/leisurelylicht/p/Ubuntu-guo-nei-an-zhuang-kubernetes.html)的指导安装的.**

**Linux网桥的概念请参考这篇[文章](https://segmentfault.com/a/1190000009491002)**

1. kubelet,kubeadm,kubectl的安装,使用[阿里源](https://developer.aliyun.com/mirror)
2. docker-ce 安装,使用[阿里源](https://developer.aliyun.com/mirror)
3. 关闭swap
```bash
sudo swapoff -a
sudo sed -i '/swap/s/^/#/' /etc/fstab
```
4. 获取镜像(非MASTER NODE上,需要kube-proxy,pause),从阿里源pull,然后改名.
```bash
kubeadm config images list
images=(
kube-apiserver:v1.13.4
kube-controller-manager:v1.13.4
kube-scheduler:v1.13.4
kube-proxy:v1.13.4
pause:3.1
etcd:3.2.24
coredns:1.2.6
)
for imageName in ${images[@]} ; do
        docker pull registry.aliyuncs.com/google_containers/$imageName
        docker tag registry.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
        docker rmi registry.aliyuncs.com/google_containers/$imageName
done
```
5. 安装master(使用flannel网络,需指定pod-network-cidr)
```bash
kubeadm init --pod-network-cidr=10.244.0.0/16
```
6. 应用flannel插件(非MASTER NODE上需要flannel镜像,具体的镜像名,可在下面的yml文件中找到.例如: query.io/coreos/flannel:v0.11.0-amd64)
```bash
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```
