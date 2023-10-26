#!/bin/bash

# 下载docker-compose
sudo curl -L "https://vip.123pan.cn/1820626734/Linux/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose

# 给予执行权限
sudo chmod +x /usr/local/bin/docker-compose

# 查看命令是否正确安装
docker-compose --version