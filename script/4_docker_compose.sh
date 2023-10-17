#!/bin/bash

# 检测当前IP地址是否在中国
ip_result=$(curl -s cip.cc)
if [[ $ip_result == *"中国"* ]]; then
    ghproxy_url="https://ghproxy.com/"
else
    ghproxy_url=""
fi

# 下载docker-compose
sudo curl -L "${ghproxy_url}https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 给予执行权限
sudo chmod +x /usr/local/bin/docker-compose

# 查看命令是否正确安装
docker-compose --version