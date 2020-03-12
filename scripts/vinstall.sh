#!/bin/bash

VIM_PATH=${HOME}/.vim

PATHOGEN=https://tpo.pe/pathogen.vim

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
    echo 'install pathogen - manage your runtimepath'
    mkdir -p ${VIM_PATH}/autoload ${VIM_PATH}/bundle ${VIM_PATH}/plugin
    curl -LSso ${VIM_PATH}/autoload/pathogen.vim ${PATHOGEN}
    
    for i in ${!PLUGINS[@]}; do
        echo 'install '${PLUGIN_NAMES[$i]}
        git clone ${PLUGINS[$i]} ${VIM_PATH}/bundle/${PLUGIN_NAMES[$i]} > /dev/null 2>&1 &
    done
    wait

    echo 'install plugin done'
    echo 'install configuration'
    cp dotfiles/vim/.vimrc ${HOME}/.vimrc
    cp dotfiles/vim/plugin/p.vim ${VIM_PATH}/plugin/p.vim
    echo 'install configuration done'
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
