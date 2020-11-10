#!/bin/bash

DIR=./docker/download

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SOFT=(
    #######################
    #   系统 - 基础设施   #
    #######################
    "pyenv,https://github.com/pyenv/pyenv"
    "fzf,https://github.com/junegunn/fzf"
    "Python-3.7.9.tar.xz,https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tar.xz"
    "vim,https://github.com/vim/vim"
)

VIMPLUGINS=(
    ##########################
    #   VIM插件 - 基础工具   #
    ##########################
    "pathogen,https://github.com/tpope/vim-pathogen"                        # 插件管理
    "fzf.vim,https://github.com/junegunn/fzf.vim"                           # 搜索插件
    ##########################
    #   VIM插件 - 显示增强   #
    ##########################
    "nerdtree,https://github.com/preservim/nerdtree"                        # 文件树
    "tagbar,https://github.com/majutsushi/tagbar"                           # 符号表
    "rainbow,https://github.com/luochen1990/rainbow"                        # 括号匹配
    "cursorword,https://github.com/itchyny/vim-cursorword"                  # 高亮当前单词
    "signify,https://github.com/mhinz/vim-signify"                          # 显示修改
    "interestingwords,https://github.com/lfv89/vim-interestingwords"        # 高亮标记单词
    ##########################
    #   VIM插件 - 编码增强   #
    ##########################
    "youcompleteme,https://github.com/ycm-core/YouCompleteMe"               # 代码补全
)

FILE=(
    "vimrc,./dotifiles/vimrc"                                               # vim配置
    "tmux.conf,./dotifile/tmux.conf"                                        # tmux配置
    "p.vim,./dotifiles/p.vim"                                               # vim插件
)

PLUGINS=(${SOFT[@]} ${VIMPLUGINS[@]})

# 下载 - git
GitDownload() {
    url=$1
    path=$2
    if [ -d $path ]; then
        printf "${YELLOW}DONE${NC} ${url}\n"
        return
    fi
    if ! git clone --recursive $url $path > /dev/null 2>&1; then
        printf "${RED}FAIL${NC} ${url}\n"
    else
        printf "${GREEN}SUCC${NC} ${url}\n"
    fi
}

# 下载 - Wget
WgetDownload() {
    url=$1
    file=$2
    if [ -f $file ]; then
        printf "${YELLOW}DONE${NC} ${url}\n"
        return
    fi
    if ! wget $url -O $file > /dev/null 2>&1; then
        printf "${RED}FAIL${NC} ${url}\n"
    else
        printf "${GREEN}SUCC${NC} ${url}\n"
    fi
}

# 下载全部
DownloadAll() {
    for i in ${PLUGINS[@]}; do
        name=`echo ${i} | awk -F ',' '{print $1}'`
        url=`echo ${i} | awk -F ',' '{print $2}'`
        if [[ $url =~ "github" ]]; then
            GitDownload $url $DIR/$name &
        else
            WgetDownload $url $DIR/$name &
        fi
    done

    wait
}

while getopts "d" opt; do
    case "${opt}" in
        d)
            DownloadAll
            ;;
        *)
            echo "error"
            ;;
    esac
done