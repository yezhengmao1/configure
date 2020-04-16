#!/bin/bash

VIM_PATH=${HOME}/.vim
CACHE_PATH=/tmp

PATHOGEN=https://github.com/tpope/vim-pathogen

declare -A PLUGINS=(
    ["rainbow"]="https://github.com/luochen1990/rainbow.git"
    ["cursorword"]="https://github.com/itchyny/vim-cursorword"
    ["nerdtree"]="https://github.com/preservim/nerdtree"
    ["signify"]="https://github.com/mhinz/vim-signify"
    ["tagbar"]="https://github.com/majutsushi/tagbar"
    ["interestingwords"]="https://github.com/lfv89/vim-interestingwords"
    ["signature"]="https://github.com/kshenoy/vim-signature"
    ["youcompleteme"]="https://github.com/ycm-core/YouCompleteMe"
)

# 安装
Install() {
    # 安装 vim 插件管理 pathogen
    echo -e '\033[33minstall \033[0mpathogen'
    mkdir -p ${VIM_PATH}/autoload ${VIM_PATH}/bundle ${VIM_PATH}/plugin
    git clone ${PATHOGEN}  ${CACHE_PATH}/pathogen > /dev/null 2>&1 &
    cp ${CACHE_PATH}/pathogen/autoload/pathogen.vim ${VIM_PATH}/autoload/pathogen.vim

    # 多线程安装插件
    for i in ${!PLUGINS[@]}; do
        echo -e '\033[33minstall \033[0m'$i
        if [ ! -d ${VIM_PATH}/bundle/$i ]; then
            git clone ${PLUGINS[$i]} ${VIM_PATH}/bundle/${PLUGIN_NAMES[$i]} > /dev/null 2>&1 &
        fi
    done
    wait
    echo -e '\033[32m[success] download plugins done!\033[0m'

    # 安装 youcompleteme 插件
    echo -e '\033[33mcompile\033[0m YouCompleteMe'
    if [ "$(uname)" == "Darwin" ]; then
        brew install macvim;
    fi
    cd ${VIM_PATH}/bundle/youcompleteme
    git submodule update --init --recursive > /dev/null 2>&1
    python3 install.py --clangd-completer > /dev/null 2>&1
    cd -

    # 安装配置文件
    echo -e '\033[33minstall \033[0mconfiguration file'
    cp dotfiles/vim/vimrc ${HOME}/.vimrc
    cp dotfiles/vim/plugin/p.vim ${VIM_PATH}/plugin/p.vim
    echo -e '\033[32m[success] install configuration file done!\033[0m'
}

# uninstall
# 卸载
UnInstall() {
    echo 'uninstall pathogen'
    rm -rf ${VIM_PATH}/autoload
    echo 'uninstall bundle'
    rm -rf ${VIM_PATH}/bundle
    echo 'uninstall plugin'
    rm -rf ${VIM_PATH}/plugin
    echo 'uninstall configure file'
    rm -rf ${HOME}/.vimrc
}

case $1 in
    install)
        Install
        ;;
    uninstall)
        UnInstall
        ;;
esac
