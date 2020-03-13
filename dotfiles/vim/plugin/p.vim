" 快捷键映射
let mapleader=";"
nnoremap <Leader>5 %
nnoremap <Leader>w []
nnoremap <Leader>s ][
nnoremap <Leader>a []%
nnoremap <Leader>d ][%
" 打开时自动开启NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 关闭时自动关闭NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
