if exists('b:did_ftplugin_python')
  finish
endif
let b:did_ftplugin_python = 1

if executable('yapf')
  nnoremap <buffer><silent> <F12> :%!yapf<CR>
endif
