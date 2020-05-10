let s:imselect_active = 2
let s:imselect_inactive = 1
let s:imselect_close  = 0

function smartim#imselect#init() 
  let first_enter_status = system(g:imselect_cmd)
  if first_enter_status  == s:imselect_active
    " echom "run im-select to ABC"
    " call system(g:smartim_imselect_cmd . ' com.apple.keylayout.ABC')
    exec 'silent! !' . g:smartim_imselect_cmd . ' com.apple.keylayout.ABC'
  endif
endfunction

function smartim#imselect#en()
  let status = system(g:smartim_imselect_cmd)
  if status == s:imselect_active
    let b:flag = s:imselect_inactive
    " echom "run im-select to ABC"
    " call system(g:smartim_imselect_cmd . ' com.apple.keylayout.ABC')
    exec 'silent! !' . g:smartim_imselect_cmd . ' com.apple.keylayout.ABC'
  endif
endfunction

function smartim#imselect#zh()
  if !exists('b:flag')
    let b:flag = s:imselect_close
    return
  endif

  if b:flag == s:imselect_inactive
    " echom "run im-select to SCIM.ITABC"
    " call system(g:smartim_imselect_cmd . ' com.apple.inputmethod.SCIM.ITABC')
    exec 'silent! !' . g:smartim_imselect_cmd . ' com.apple.inputmethod.SCIM.ITABC'
    let b:flag = s:imselect_close
  endif
endfunction
