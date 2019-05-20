if exists('g:loaded_commentout')
    finish
endif
let g:loaded_commentout = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=+ Comment call commentout#comment(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
