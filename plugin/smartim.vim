let s:save_cpo = &cpoptions
set cpoptions&vim

function! s:restore_cpo()
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endfunction

let g:smartim_fcitx_remote_cmd='fcitx-remote'
let g:smartim_imselect_cmd='im-select'

if !executable(g:smartim_fcitx_remote_cmd) && !executable(g:smartim_imselect_cmd)
    echohl WarningMsg |
        \ echomsg 'vim-smartim only works when `fcitx-remote(Linux)/im-select(Win/Mac)` is executable!'  |
        \ echohl None
  call s:restore_cpo()
  finish
endif

" https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript
if !exists("s:smartim_os_type")
    if has("win64") || has("win32") || has("win16")
        let s:smartim_os_type = "Windows"
    else
        let s:smartim_os_type = substitute(system('uname'), '\n', '', '')
    endif
endif

if s:smartim_os_type == "Linux"
  let g:smartim_os_flag = 0
elseif s:smartim_os_type == "Darwin" || s:smartim_os_type == "Windows"
  let g:smartim_os_flag = 1
endif

if exists('g:loaded_smartim_plugin')
  call s:restore_cpo()
  finish
endif


let g:loaded_smartim_plugin = 1

autocmd VimEnter * call smartim#init()
autocmd InsertLeave * call smartim#en()
autocmd InsertEnter * call smartim#zh()
call s:restore_cpo()
