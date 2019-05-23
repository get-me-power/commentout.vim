if !exists('g:loaded_commentout')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! commentout#comment(start, end) abort
    let commentout = commentout#returncomment#new(&filetype)
    " カーソル位置のセーブ
    let save_cursor = getcurpos()
    for for_count in range(a:start, a:end)
        let line = getline(for_count)
        " 文字列の連結
        call setline(for_count, commentout.' '.line)
    endfor
    " インデント
    execute("normal " . "gg=G")
    " カーソル位置を元に戻す
    call setpos('.', save_cursor)
endfunction

function! commentout#uncomment(start, end) abort
    let commentout = commentout#returncomment#new(&filetype)
    let save_cursor = getcurpos()
    if commentout != '//'
        try
            execute(a:start.','.a:end.'s/'.commentout.' '.'//')
            call s:Indent(save_cursor)
        catch /^Vim\%((\a\+)\)\=:E486:/
            echo 'pattern is not found'
        endtry
    else
        try
            execute(a:start.','.a:end.'s/\/\//')
            call s:Indent(save_cursor)
        " E486を補足
        catch /^Vim\%((\a\+)\)\=:E486:/
            echo 'pattern is not found'
        endtry
    endif
endfunction

function! s:Indent(save_cursor)
    execute("normal " . "gg=G")
    call setpos('.', a:save_cursor)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
