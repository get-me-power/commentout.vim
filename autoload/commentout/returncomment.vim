function! commentout#returncomment#new(filetype)
  if a:filetype == 'javascript.jsx'
    let funcname = printf(
          \ 'commentout#filetype#%s#new',
          \  'javascript',
          \)
  else
    let funcname = printf(
          \ 'commentout#filetype#%s#new',
          \  a:filetype,
          \)
  endif
  let Fn = function(funcname)
  return Fn()
endfunction
