#!/bin/bash

VIM_PATH=${HOME}/.vim
CACHE_PATH=/tmp/vinstall

PATHOGEN=https://tpo.pe/pathogen.vim

RAINBOW=https://github.com/luochen1990/rainbow.git

# install
# 安装
Install() {
    # install pathogen
    # 安装vim插件管理
    mkdir -p ${VIM_PATH}/autoload ${VIM_PATH}/bundle
    curl -LSso ${VIM_PATH}/autoload/pathogen.vim ${PATHOGEN}
    
    echo 'install rainbow plugin'
    git clone ${RAINBOW} ${CACHE_PATH}/rainbow
    cp ${CACHE_PATH}/rainbow/plugin/* ${VIM_PATH}/plugin
    cp ${CACHE_PATH}/rainbow/autoload/* ${VIM_PATH}/autoload

    rm -rf ${CACHE_PATH}
}

# uninstall
# 卸载
UnInstall() {
    echo 'uninstall pathogen'
    rm -rf ${VIM_PATH}/autoload
    echo 'uninstall plugins'
    echo 'uninstall myplugins'
}

case $1 in
    install)
        Install
        ;;
    uninstall)
        UnInstall
        ;;
esac
