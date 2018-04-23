set nocompatible
set guioptions+=M " do not load menu.vim
let g:mapleader = ','

if &term=~#'linux'
  let g:terminal = 'console'
else
  let g:terminal = ''
endif

" Configure directories {
  if has('nvim')
    let $VIMUSERDIR = expand('~/.config/nvim')
    let $VIMCACHEDIR = expand('~/.cache/nvim')
    let $VIMLOCALPLUGS = expand('~/.nvimplugs.local.vim')
    let $VIMLOCALCONFIG = expand('~/.nvimrc.local.vim')
  else
    let $VIMUSERDIR = expand('~/.vim')
    let $VIMCACHEDIR = expand('~/.cache/vim')
    let $VIMLOCALPLUGS = expand('~/.vimplugs.local.vim')
    let $VIMLOCALCONFIG = expand('~/.vimrc.local.vim')
  endif

  let $VIMPLUGDIR = $VIMCACHEDIR . '/plugged'
  let $VIMSPELLDIR = $VIMCACHEDIR . '/spell'
  let s:spell_dir_type = getftype($VIMSPELLDIR)
  if s:spell_dir_type !=# 'dir'
    if !empty(s:spell_dir_type)
      call delete($VIMSPELLDIR)
    endif
    silent execute '!mkdir -p ' . $VIMSPELLDIR
  endif
  if isdirectory($VIMSPELLDIR)
    let &runtimepath = $VIMCACHEDIR . ',' . &runtimepath
  endif
" }

" Determine executable command to use for search {
  if executable('ag')
    let g:search_command = 'ag --vimgrep'
  elseif executable('ack-grep')
    let g:search_command = 'ack-grep --nogroup --column --smart-case --nocolor --follow'
  elseif executable('ack')
    let g:search_command = 'ack --nogroup --column --smart-case --nocolor --follow'
  endif
" }

" Vim-plug {
  call plug#begin($VIMPLUGDIR)

  " load plugins {
    runtime plugs.vim

    if filereadable($VIMLOCALPLUGS)
      execute 'source ' . $VIMLOCALPLUGS
    endif
  " }

  call plug#end()
" }

" load functions
runtime globals.vim

" load mappings
runtime mappings.vim
runtime plugs_mappings.vim

" load settings
runtime settings.vim

" load abbreviations
runtime abbreviations.vim

" load local settings from ~/.vim/vimrc.local
if filereadable($VIMLOCALCONFIG)
  execute 'source ' . $VIMLOCALCONFIG
endif
