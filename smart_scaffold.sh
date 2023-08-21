#!/bin/bash
###
 # @Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
 # @Date: 2023-08-21 17:23:49
 # @LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
 # @LastEditTime: 2023-08-21 18:38:21
 # @FilePath: /Centos7/smart_scaffold.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 

# 检测当前IP地址是否在中国
ip_result=$(curl -s cip.cc)
if [[ $ip_result == *"中国"* ]]; then
    ghproxy_url="https://ghproxy.com/"
else
    ghproxy_url=""
fi

system_update_url="${ghproxy_url}https://github.com/Zonezzc/Centos7/blob/main/script/system_update.sh"
 java_install_url="${ghproxy_url}https://github.com/Zonezzc/Centos7/blob/main/script/java_install.sh"

# 显示选项菜单
function show_menu() {
    echo "请选择要执行的脚本："
    echo "1. 更新系统"
    echo "2. 安装Java"
    echo "0. 退出脚本"
    read -p "请输入选项数字: " choice
}

# 更新系统
function update_system() {
    curl -O $system_update_url
    chmod +x system_update.sh
    ./system_update.sh
    rm system_update.sh
}

# 安装Java
function install_java() {
    curl -O $java_install_url
    chmod +x java_install.sh
    ./java_install.sh
    rm java_install.sh
}

# 主程序
function main() {
    show_menu
    while [ $choice -ne 0 ]
    do
        case $choice in
            1)
                update_system
                ;;
            2)
                install_java
                ;;
            *)
                echo "无效的选项"
                ;;
        esac

        show_menu
    done

    echo "脚本已退出"
}

main