#!/bin/bash

SOFTWARE_DIR="./software"
JDK_FILE="jdk-8u202-linux-x64.tar.gz"
JDK_URL="https://tmp-titan.vx-cdn.com/file-64e32b502d8d9-64e32ba3e1161/jdk-8u202-linux-x64.tar.gz"
JAVA_HOME_DIR="/usr/local/java"
JAVA_VERSION="jdk1.8.0_202"

# 检查并创建software文件夹
if [ ! -d "$SOFTWARE_DIR" ]; then
    echo "检测到当前文件的所在文件夹没有同级文件夹software，创建中..."
    mkdir -p "$SOFTWARE_DIR"
    echo "同级文件夹software创建完成"
fi

# 检查并下载jdk文件
if [ ! -e "$SOFTWARE_DIR/$JDK_FILE" ]; then
    echo "未找到 $JDK_FILE 文件，开始下载..."
    curl -Lo "$SOFTWARE_DIR/$JDK_FILE" "$JDK_URL"
    echo "$JDK_FILE 文件下载完成"
fi

# 检查并安装Java
if [ -e "$SOFTWARE_DIR/$JDK_FILE" ]; then
    echo "找到 $JDK_FILE 文件，开始安装Java..."

    # 检查本机是否安装了openjdk
    if rpm -qa | grep openjdk -i; then
        echo "检测到本机已安装openjdk，先卸载openjdk..."
        sudo yum remove -y java-1.*.0-openjdk-*
    fi

    # 检查Java安装目录是否存在，不存在则创建
    if [ ! -d "$JAVA_HOME_DIR" ]; then
        echo "检测到本机 $JAVA_HOME_DIR 文件夹不存在，创建中..."
        sudo mkdir -p "$JAVA_HOME_DIR"
        echo "$JAVA_HOME_DIR 文件夹创建完成"
    fi

    # 解压并安装Java
    tar -zxvf "$SOFTWARE_DIR/$JDK_FILE" -C "$JAVA_HOME_DIR"

    # 设置Java环境变量
    echo "export JAVA_HOME=$JAVA_HOME_DIR/$JAVA_VERSION" >> /etc/profile
    echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile

    # 刷新环境变量
    source /etc/profile

    # 检查Java命令是否正确安装
    java -version

else
    echo "未找到 $JDK_FILE 文件，请检查。"
fi
