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

# 更改Docker镜像下载地址
echo '{"registry-mirrors":["https://ewthofi2.mirror.aliyuncs.com"]}' | sudo tee /etc/docker/daemon.json

# 启动Docker服务
sudo systemctl start docker

# 下载docker-compose
sudo curl -L "https://vip.123pan.cn/1820626734/Linux/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose

# 给予执行权限
sudo chmod +x /usr/local/bin/docker-compose

# 查看命令是否正确安装
docker-compose --version