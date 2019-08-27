" pathogen - 自动加载插件
execute pathogen#infect()
syntax on
filetype plugin indent on

" 开启行号
set number
" 设置空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" 显示Tab键
set list
set listchars=tab:▸-

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
set statusline+=\ \[%{&fileformat}\]\ >
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}


""""""""""""""""
"   脚本相关   "
""""""""""""""""
function! InsertFileInfo()
    call append(0, '/*')
    call append(1, ' * File:            ' . expand('%'))
    call append(2, ' * Description:     ')
    call append(3, ' * Author:          Pipapa')
    call append(4, ' * Email:           yezhengmaolove@gmail.com')
    call append(5, ' * Date:            ' . strftime('%Y-%m-%d %H:%M:%S'))
    call append(6, ' * License:         GPL')
    call append(7, ' * */')
    normal 3gg$
endfunction

function! InsertFunctionInfo()
    let l = line('.')
    call append(l,   '/*')
    call append(l+1, ' * Function:        ')
    call append(l+2, ' * Description:     ')
    call append(l+3, ' * Input:     ')
    call append(l+4, ' * Return:    ')
    call append(l+5, ' * Note:      ')
    call append(l+6, ' * Sample:    ')
    call append(l+7, ' * */')
endfunction

command InsertFileInfo :call InsertFileInfo()<CR>
command InsertFunctionInfo :call InsertFunctionInfo()<CR>

""""""""""""""""
"   插件配置   "
""""""""""""""""

" NERDTree - 文件目录
" 打开关闭快捷键
nnoremap <C-t> :NERDTreeToggle<CR>

" YouCompleteMe - 自动补全 
" 关闭诊断高亮
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_highlighting = 0
