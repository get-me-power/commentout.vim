function! return#returncomment#new(filetype)
    let namespace = substitute(a:filetype, '\W', '_', 'g')
    echo namespace
    let funcname = printf(
                \ 'return#filetype#%s#new',
                \  namespace,
                \)
    let Fn = function(funcname)
    return Fn()
endfunction
