function! commentout#returncomment#new(filetype)
    let namespace = substitute(a:filetype, '\W', '_', 'g')
    echo namespace
    let funcname = printf(
                \ 'commentout#filetype#%s#new',
                \  namespace,
                \)
    let Fn = function(funcname)
    return Fn()
endfunction
