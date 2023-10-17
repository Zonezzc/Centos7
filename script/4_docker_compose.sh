#!/bin/bash

# 下载docker-compose
sudo curl -L "https://zonezzc.5t-cdn.com/files/652eaadc916bc/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose

# 给予执行权限
sudo chmod +x /usr/local/bin/docker-compose

# 查看命令是否正确安装
docker-compose --version