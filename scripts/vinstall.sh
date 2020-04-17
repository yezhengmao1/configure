#!/bin/bash

VIM_PATH=${HOME}/.vim
CACHE_PATH=/tmp

PATHOGEN=https://github.com/tpope/vim-pathogen

PLUGINS=(
    "rainbow,https://github.com/luochen1990/rainbow"
    "cursorword,https://github.com/itchyny/vim-cursorword"
    "nerdtree,https://github.com/preservim/nerdtree"
    "signify,https://github.com/mhinz/vim-signify"
    "tagbar,https://github.com/majutsushi/tagbar"
    "interestingwords,https://github.com/lfv89/vim-interestingwords"
    "signature,https://github.com/kshenoy/vim-signature"
    "youcompleteme,https://github.com/ycm-core/YouCompleteMe"
)

# 安装
Install() {
    # 安装 vim 插件管理 pathogen
    printf '\033[33m[install]\033[0m %-17s %s\n' pathogen $PATHOGEN
    mkdir -p ${VIM_PATH}/autoload ${VIM_PATH}/bundle ${VIM_PATH}/plugin
    git clone ${PATHOGEN}  ${CACHE_PATH}/pathogen > /dev/null 2>&1 &
    cp ${CACHE_PATH}/pathogen/autoload/pathogen.vim ${VIM_PATH}/autoload/pathogen.vim
    printf "\033[32m[success]\033[0m install plugin pathogen done!\n"

    # 多线程安装插件
    for i in ${PLUGINS[@]}; do
        name=`echo ${i} | awk -F ',' '{print $1}'`
        path=`echo ${i} | awk -F ',' '{print $2}'`
        if [ ! -d ${VIM_PATH}/bundle/$name ]; then
            printf "\033[33m[install]\033[0m %-17s %s\n" $name $path
            git clone ${path} ${VIM_PATH}/bundle/${name} > /dev/null 2>&1 && printf "\033[32m[success]\033[0m download plugin %s done!\n" $name &
        else
            printf "\033[32m[exist]  \033[0m %-17s %s\n" $name $path
        fi
    done
    wait

    # 安装 youcompleteme 插件
    echo -e '\033[33m[compile]\033[0m YouCompleteMe'
    if [ "$(uname)" == "Darwin" ]; then
	echo brew list | grep macvim
        if [ $? -eq 0 ]; then
	    brew install macvim;
	fi
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
    echo -e '\033[91m[uninstall]\033[0m pathogen'
    rm -rf ${VIM_PATH}/autoload
    echo -e '\033[91m[uninstall]\033[0m bundle'
    rm -rf ${VIM_PATH}/bundle
    echo -e '\033[91m[uninstall]\033[0m plugin'
    rm -rf ${VIM_PATH}/plugin
    echo -e '\033[91m[uninstall]\033[0m configure'
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
