#!/bin/bash

# 清除可能存在的Docker安装包或遗留包
sudo yum remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine -y

# 安装前准备
sudo yum install -y yum-utils \
                    device-mapper-persistent-data \
                    lvm2

# 添加yum的Docker源
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 执行Docker安装
sudo yum install -y docker-ce \
                    docker-ce-cli \
                    containerd.io

# 启动Docker服务
sudo systemctl start docker