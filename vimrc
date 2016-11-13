set nocompatible
let mapleader = ','

" Configure directories {
  if has('nvim')
    let g:editor_root = expand('~/.config/nvim')
    let g:cache_root = expand('~/.cache/nvim')
    let g:local_bundle_file = expand('~/.neovimbundle.local.vim')
    let g:local_config_file = expand('~/.neovimrc.local.vim')
  else
    let g:editor_root = expand('~/.vim')
    let g:cache_root = expand('~/.cache/vim')
    let g:local_bundle_file = expand('~/.vimbundle.local.vim')
    let g:local_config_file = expand('~/.vimrc.local.vim')
  endif

  let g:bundle_dir = g:cache_root . '/bundle'
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
    let neobundle_dir = g:bundle_dir . '/neobundle.vim'
    let neobundle_readme = g:neobundle_dir . '/README.md'

    if !filereadable(neobundle_readme)
      echo 'Installing NeoBundle'
      echo ''
      silent execute '!mkdir -p ' . g:bundle_dir
      silent execute '!git clone https://github.com/Shougo/neobundle.vim ' . neobundle_dir
    endif
  " }

  " Init NeoBundle {
    if has('vim_starting')
      let &runtimepath .= ',' . neobundle_dir
    endif

    call neobundle#begin(g:bundle_dir)

    NeoBundleFetch 'Shougo/neobundle.vim'
  " }

  " load bundles {
    runtime bundles.vim

    if filereadable(g:local_bundle_file)
      execute 'source ' . g:local_bundle_file
    endif
  " }

  " NeoBundle end {
    call neobundle#end()

    filetype plugin indent on
    syntax enable

    NeoBundleCheck
  " }

" }

" load mappings
runtime mappings.vim

" load settings
runtime settings.vim

" load abbreviations
runtime abbreviations.vim

" load local settings from ~/.vim/vimrc.local
if filereadable(g:local_config_file)
  execute 'source ' . g:local_config_file
endif
