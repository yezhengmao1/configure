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
" fzf加载文件列表
if filereadable('filename.list')
    let $FZF_DEFAULT_COMMAND = 'cat filename.list'
endif
" 颜色配置
hi clear SignColumn
hi StatusLine ctermbg=237 ctermfg=215
hi StatusLineNC ctermbg=237 ctermfg=215
hi StatusLineTerm ctermfg=237 ctermbg=215
hi FzfSelectLine ctermbg=212 ctermfg=237
hi FzfSelectHl ctermfg=115
hi SpecialKey ctermfg=250
let g:fzf_colors = {
  \ 'gutter' : ['fg', 'Ignore'],
  \ 'bg+'    : ['bg', 'FzfSelectLine'],
  \ 'fg+'    : ['fg', 'FzfSelectLine'],
  \ 'hl+'    : ['fg', 'FzfSelectHl']}
