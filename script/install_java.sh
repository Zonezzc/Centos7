#!/bin/bash

# 检查当前路径下是否有 jdk-8u202-linux-x64.tar.gz
if [ -e jdk-8u202-linux-x64.tar.gz ]; then
    echo "找到 jdk-8u202-linux-x64.tar.gz 文件，开始安装Java..."

    # 检查本机是否安装了openjdk
    if rpm -qa | grep openjdk -i; then
        echo "检测到本机已安装openjdk，先卸载openjdk..."
        sudo yum remove -y java-1.*.0-openjdk-*
    fi

    # 检查 /usr/local/java/ 文件夹是否存在，不存在则创建
    if [ ! -d /usr/local/java/ ]; then
        echo "检测到本机/usr/local/java/文件夹不存在，创建中..."
        sudo mkdir -p /usr/local/java/
        echo "/usr/local/java/文件夹创建完成"
    fi

    # 解压并安装Java
    tar -zxvf jdk-8u202-linux-x64.tar.gz
    mv jdk1.8.0_202/ /usr/local/java/

    # 将Java环境变量添加到/etc/profile
    echo "export JAVA_HOME=/usr/local/java/jdk1.8.0_202" >> /etc/profile
    echo "export CLASSPATH=.:%JAVA_HOME%/lib/dt.jar:%JAVA_HOME%/lib/tools.jar" >> /etc/profile
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile

    # 刷新环境变量
    source /etc/profile

    # 检查Java命令是否正确安装
    java -version

else
    echo "未找到 jdk-8u202-linux-x64.tar.gz 文件，请检查。"
fi