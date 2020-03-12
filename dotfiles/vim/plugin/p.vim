" 插入C++注释脚本
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
" 打开时自动开启NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 关闭时自动关闭NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
