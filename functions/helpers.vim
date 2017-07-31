if exists('g:functions_helpers')
 finish
endif
let g:functions_helpers = 1

" function to toggle spellcheck on and off, if spellcheck is enabled and the
" lang is different from the one active, it switches to the new language
function! functions#helpers#spellcheck_locale(lang)
  let l:cmd = [':setlocal']
  if &spell == 0 || &spelllang == a:lang
    call add(l:cmd, 'spell!')
  endif
  if &spelllang != a:lang
    call add(l:cmd, 'spelllang=' . a:lang)
  endif
  execute join(l:cmd)
endfunction

" function to know if the active tab is clean (only on window and a clean
" empty buffer that doesn't point to a file)
function! functions#helpers#active_tab_is_empty()
  let l:empty = 0
  if len(tabpagebuflist(tabpagenr())) <= 1
    if empty(bufname('%'))
      let l:lines = getbufline('%', 1, '$')
      if len(l:lines) <= 1 && (empty(l:lines) || empty(l:lines[0]))
        let l:out = ''
        redir =>> l:out
        silent! ls! '%+'
        redir END
        let l:empty = empty(split(l:out, '\n'))
      endif
    endif
  endif
  return l:empty
endfunction

" function to find the root of the project of the file passed as argument, the
" root of the project is a directory with a file or directory matching
" g:root_markers
function! functions#helpers#find_project_root(path, markers)
  for marker in a:markers
    if match(marker, '/$') != -1
      let marker = substitute(marker, '/$', '', '')
      let l:root = finddir(marker, a:path . ';')
    else
      let l:root = findfile(marker, a:path . ';')
    endif
    if !empty(l:root)
      let l:root = substitute(l:root, marker . '$', '', '')
      break
    endif
  endfor
  return l:root
endfunction

function! functions#helpers#change_directory(args)
  let l:current_file_dir = get(a:args, 'path', expand('%:p:h'))
  let l:method = get(a:args, 'method', 'root')
  let l:cmd = get(a:args, 'cmd', 'cd')
  let l:path = l:current_file_dir
  if l:method == 'root'
    let l:path = functions#helpers#find_project_root(l:current_file_dir, g:root_markers)
  endif
  if empty(l:path)
    let l:path = l:current_file_dir
  endif
  execute l:cmd . ' ' . fnameescape(l:path)
  pwd
endfunction
