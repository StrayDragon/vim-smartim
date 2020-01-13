let s:save_cpo = &cpoptions
set cpoptions&vim

function! s:restore_cpo()
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endfunction

let g:fcitx_remote_cmd='fcitx-remote'

if !executable(g:fcitx_remote_cmd)
    echohl WarningMsg |
        \ echomsg 'vim-smartim only works when `fcitx-remote` is executable!'  |
        \ echohl None
  call s:restore_cpo()
  finish
endif

if exists('g:loaded_smartim_plugin')
  call s:restore_cpo()
  finish
endif

let g:loaded_smartim_plugin = 1

autocmd VimEnter * call smartim#fcitx#init()
autocmd InsertLeave * call smartim#fcitx#en()
autocmd InsertEnter * call smartim#fcitx#zh()
call s:restore_cpo()
