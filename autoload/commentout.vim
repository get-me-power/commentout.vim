if !exists('g:loaded_commentout')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! commentout#comment(start, end) abort
    let filetype = s:filetype()
    if strlen(filetype) == ''
        echomsg 'このファイルの拡張子はvimではありません: ' . expand('%')
        return 0
    else
        execute(a:start.','.a:end.'s/^/"/')
    endif
endfunction

function! commentout#uncomment(start, end) abort
    let filetype = s:filetype()
    if strlen(filetype) == ''
        echomsg 'このファイルの拡張子はvimではありません: ' . expand('%')
        return 0
    else
        execute(a:start.','.a:end.'s/^\"//')
    endif
endfunction

function! s:filetype() abort
    if expand('%:e') ==# 'vim'
        return expand('%')
    else
        return ''
    endif
endfunction
