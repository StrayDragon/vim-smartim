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

function! smartim#init()
  if g:smartim_os_flag == 1
    call smartim#imselect#init()
  else
    call smartim#fcitx#init()
  endif
endfunction

function! smartim#en()
  if g:smartim_os_flag == 1
    call smartim#imselect#en()
  else
    call smartim#fcitx#en()
  endif
endfunction

function! smartim#zh()
  if g:smartim_os_flag == 1
    call smartim#imselect#zh()
  else
    call smartim#fcitx#zh()
  endif
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
