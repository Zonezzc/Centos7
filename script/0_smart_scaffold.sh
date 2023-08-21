#!/bin/bash


# 检测当前IP地址是否在中国
ip_result=$(curl -s cip.cc)
if [[ $ip_result == *"中国"* ]]; then
    ghproxy_url="https://ghproxy.com/"
else
    ghproxy_url=""
fi

system_update_url="${ghproxy_url}https://github.com/Zonezzc/Centos7/blob/main/script/1_system_update.sh"
java_install_url="${ghproxy_url}https://github.com/Zonezzc/Centos7/blob/main/script/2_java_install.sh"

# 下载脚本
function download_script() {
    local script_url=$1
    curl -LO "$script_url"
}

# 执行脚本
function execute_script() {
    local script_name=$1
    chmod +x "$script_name"
    "./$script_name"
    rm -f "$script_name"
}

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
    local script_name=$(basename "$system_update_url")
    download_script "$system_update_url"
    execute_script "$script_name"
}

# 安装Java
function install_java() {
    local script_name=$(basename "$java_install_url")
    download_script "$java_install_url"
    execute_script "$script_name"
}

# 主程序
function main() {
    show_menu
    while [ $choice -ne 0 ]; do
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
