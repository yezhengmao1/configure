" 快捷键映射
let mapleader=";"

" 快捷键设置
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :TagbarToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-g> yw:cs find s <C-r>"<CR>
nnoremap <C-c> yw:cs find c <C-r>"<CR>
nnoremap <C-d> yw:cs find d <C-r>"<CR>

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

" 关闭时自动关闭NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 自动加载fzf文件列表
if filereadable("filelist")
    let $FZF_DEFAULT_COMMAND = 'cat filelist'
endif
