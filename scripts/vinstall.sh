#!/bin/bash

VIM_PATH=${HOME}/.vim
CACHE_PATH=/tmp

PATHOGEN=https://github.com/tpope/vim-pathogen
RAINBOW=https://github.com/luochen1990/rainbow.git
CURSORWORD=https://github.com/itchyny/vim-cursorword
NERDTREE=https://github.com/preservim/nerdtree
GITGUTTER=https://github.com/airblade/vim-gitgutter
TAGBAR=https://github.com/majutsushi/tagbar
INTERESTINGWORDS=https://github.com/lfv89/vim-interestingwords

PLUGIN_NAMES=(
    "rainbow" 
    "cursorword"
    "nerdtree"
    "gitgutter"
    "tagbar"
    "interestingwords"
)

PLUGINS=(
    $RAINBOW 
    $CURSORWORD
    $NERDTREE
    $GITGUTTER
    $TAGBAR
    $INTERESTINGWORDS
)

# install
# 安装
Install() {
    # install pathogen
    # 安装vim插件管理
    echo '\033[33minstall \033[0mpathogen'
    mkdir -p ${VIM_PATH}/autoload ${VIM_PATH}/bundle ${VIM_PATH}/plugin
    git clone ${PATHOGEN}  ${CACHE_PATH}/pathogen > /dev/null 2>&1 &
    for i in ${!PLUGINS[@]}; do
        echo -e '\033[33minstall \033[0m'${PLUGIN_NAMES[$i]}
        git clone ${PLUGINS[$i]} ${VIM_PATH}/bundle/${PLUGIN_NAMES[$i]} > /dev/null 2>&1 &
    done
    wait
    cp ${CACHE_PATH}/pathogen/autoload/pathogen.vim ${VIM_PATH}/autoload/pathogen.vim
    echo -e '\033[32m[success]install plugin done!\033[0m'
    echo -e '\033[33minstall \033[0mconfiguration'
    cp dotfiles/vim/.vimrc ${HOME}/.vimrc
    cp dotfiles/vim/plugin/p.vim ${VIM_PATH}/plugin/p.vim
    echo -e '\033[32m[success]install configuration done!\033[0m'
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
    echo 'uninstall profile'
    rm ${HOME}/.vimrc
}

case $1 in
    install)
        Install
        ;;
    uninstall)
        UnInstall
        ;;
esac
