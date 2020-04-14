" 快捷键映射
let mapleader=";"
" tab标签切换快捷键
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

nnoremap <Leader>[ {zz
nnoremap <Leader>] }zz
nnoremap <Leader>, (zz
nnoremap <Leader>. )zz
" 打开时自动开启NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 关闭时自动关闭NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
