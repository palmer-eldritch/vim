set nocompatible
set guioptions+=M " do not load menu.vim
let mapleader = ','

if &term=~'linux'
  let g:terminal = 'console'
else
  let g:terminal = ''
endif

" Configure directories {
  if has('nvim')
    let $VIMUSERDIR = expand('~/.config/nvim')
    let $VIMCACHEDIR = expand('~/.cache/nvim')
    let $VIMLOCALBUNDLE = expand('~/.neovimbundle.local.vim')
    let $VIMLOCALCONFIG = expand('~/.neovimrc.local.vim')
  else
    let $VIMUSERDIR = expand('~/.vim')
    let $VIMCACHEDIR = expand('~/.cache/vim')
    let $VIMLOCALBUNDLE = expand('~/.vimbundle.local.vim')
    let $VIMLOCALCONFIG = expand('~/.vimrc.local.vim')
  endif

  let $VIMBUNDLEDIR = $VIMCACHEDIR . '/bundle'
  let $VIMSPELLDIR = $VIMCACHEDIR . '/spell'
  let s:spell_dir_type = getftype($VIMSPELLDIR)
  if s:spell_dir_type != 'dir'
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

" NeoBundle {

  " Intall NeoBundle {
    let g:neobundle_dir = $VIMBUNDLEDIR . '/neobundle.vim'
    let neobundle_readme = g:neobundle_dir . '/README.md'

    if !filereadable(neobundle_readme)
      echo 'Installing NeoBundle'
      echo ''
      silent execute '!mkdir -p ' . $VIMBUNDLEDIR
      silent execute '!git clone https://github.com/Shougo/neobundle.vim ' . neobundle_dir
    endif
  " }

  " Init NeoBundle {
    if has('vim_starting')
      execute 'set runtimepath+=' . g:neobundle_dir
    endif

    call neobundle#begin($VIMBUNDLEDIR)

    NeoBundleFetch 'Shougo/neobundle.vim'
  " }

  " load bundles {
    runtime bundles.vim

    if filereadable($VIMLOCALBUNDLE)
      execute 'source ' . $VIMLOCALBUNDLE
    endif
  " }

  " NeoBundle end {
    call neobundle#end()

    filetype plugin indent on
    syntax enable

    NeoBundleCheck
  " }

" }

" load functions
runtime globals.vim

" load mappings
runtime mappings.vim
runtime bundle_mappings.vim

" load settings
runtime settings.vim

" load abbreviations
runtime abbreviations.vim

" load local settings from ~/.vim/vimrc.local
if filereadable($VIMLOCALCONFIG)
  execute 'source ' . $VIMLOCALCONFIG
endif
