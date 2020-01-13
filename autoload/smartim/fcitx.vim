let s:fcitx_active = 2
let s:fcitx_inactive = 1
let s:fcitx_close  = 0

function smartim#fcitx#init() 
  let first_enter_status = system(g:fcitx_remote_cmd)
  if first_enter_status  == s:fcitx_active
    call system(g:fcitx_remote_cmd . ' -c')
  endif
endfunction

function smartim#fcitx#en()
  let status = system(g:fcitx_remote_cmd)
  if status == s:fcitx_active
    let b:flag = s:fcitx_inactive
    call system(g:fcitx_remote_cmd . ' -c')
  endif
endfunction

function smartim#fcitx#zh()
  if !exists('b:flag')
    let b:flag = s:fcitx_close
    return
  endif

  if b:flag == s:fcitx_inactive
    call system(g:fcitx_remote_cmd . ' -o')
    let b:flag = s:fcitx_close
  endif
endfunction
