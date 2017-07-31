if exists('g:functions_vimshell')
  finish
endif
let g:functions_vimshell = 1

function! functions#vimshell#spawn(...)
  if functions#helpers#active_tab_is_empty() || a:0 > 0
    let l:cmd = ['VimShellCreate']
    if a:0 > 0
      let l:cmd += ['-split', '-split-command="' + join(a:000) + '"']
    endif
  else
    let l:cmd = ['VimShellTab', '-create']
  endif
  execute join(l:cmd)
endfunction
