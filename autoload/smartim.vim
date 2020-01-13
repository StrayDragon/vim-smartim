let s:save_cpo = &cpoptions
set cpoptions&vim

let s:Setup = 0

function! smartim#Enable()
  if s:Setup
    return
  endif

  " TODO

  let s:Setup = 1
endfunction

function! smartim#Disable()
  " TODO

  let s:Setup = 0
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
