#!/bin/bash
###
 # @Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
 # @Date: 2023-08-21 17:00:21
 # @LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
 # @LastEditTime: 2023-08-21 19:27:49
 # @FilePath: /Centos7/script/1_system_update.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
###

# 检查wget是否安装，如果未安装则安装wget
if ! command -v wget &> /dev/null; then
    echo "wget未安装，正在安装wget..."
    yum install wget -y
fi
echo "wget安装/更新完成"

# 备份默认yum源
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

# 下载并替换yum源
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# 更新yum缓存
yum makecache

echo "yum源已替换为阿里源"

# 更新系统
yum update -y

echo "系统已更新"

# 检查lrzsz是否安装，如果未安装则安装lrzsz
if ! command -v lrz &> /dev/null || ! command -v lsz &> /dev/null; then
    echo "lrzsz未安装，正在安装lrzsz..."
    yum install -y lrzsz
fi

echo "lrzsz安装/更新完成"