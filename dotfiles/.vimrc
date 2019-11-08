" pathogen - 自动加载插件
execute pathogen#infect()
syntax on
syntax enable
filetype plugin indent on

" Leader键盘
let mapleader=";"
""""""""""""""""""
"   快捷键设定   "
""""""""""""""""""
nnoremap <Leader>5 %

""""""""""""""""""
"   常用设置     "
""""""""""""""""""
" 回退键模式 - 非vi兼容
set backspace=2
" 禁止折行
set nowrap
" 关闭兼容模式
set nocompatible
" 开启行号
set number
" 设置空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" 显示Tab键
set list
set listchars=tab:▸-,space:·
" 搜索高亮
set hlsearch
" 增量搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 高亮显示当前行
set cursorline
" 高亮显示当前列
hi CursorColumn ctermbg=NONE ctermfg=yellow

" 状态栏设置
" f - 文件名字
" r - 只读[RO]
" m - 是否修改[+]
" l - 行号 L - 总行
" c - 列号
" fileformat - 文件类型 
" fileencoding - 编码类型
set laststatus=2
set statusline=
set statusline+=%f\ %r%m
set statusline+=%=
set statusline+=\ L\:%4l\/%-4L\ C\:%-3c
set statusline+=\ \[%{&fileformat}\]\ - 
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}

""""""""""""""""
"   插件配置   "
""""""""""""""""
" NERDTree - 文件目录
" 打开关闭快捷键
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDChristmasTree=0
let NERDTreeIgnore=['\.swp$']
let NERDTreeWinPos='right'

" Tagbar - tag标签
let g:tagbar_vertical = 25
let g:tagbar_compact = 1
nnoremap <C-f> :TagbarToggle<CR>

" YouCompleteMe - 自动补全 
" 关闭诊断高亮
" 关闭预览窗口
" 候选字触发:2
set completeopt=menu,menuone
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_min_num_identifier_candidate_chars = 2

" vim-gitgutter - 文件比较插件
set signcolumn=yes
set updatetime=100
