if !exists('g:loaded_commentout')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! commentout#comment(start, end) abort
    let commentout = return#returncomment#new(&filetype)
    echo commentout
    let for_count = a:start
    "execute(a:start.','.a:end.'s/^/'.commentout/')
    for for_count in range(a:end)
        let line = getline(for_count + 1)
        call setline(for_count + 1, commentout.line)
    endfor
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
