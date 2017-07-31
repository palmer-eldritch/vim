if exists('b:did_ftplugin_vimshell')
  finish
endif
let b:did_ftplugin_vimshell = 1

" quick and dirty emulation of command history, only work for the last one
" typed and only if there was no other edit operation since
inoremap <buffer> <Up> <C-r>.

inoremap <buffer> <C-d> exit<CR><CR>
