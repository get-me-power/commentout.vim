function! commentout#returncomment#new(filetype)
    let funcname = printf(
                \ 'commentout#filetype#%s#new',
                \  a:filetype,
                \)
    let Fn = function(funcname)
    return Fn()
endfunction
