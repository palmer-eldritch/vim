set nocompatible
let mapleader = ','

" NeoBundle {

  " Intall NeoBundle {
    let neobundle_readme = expand('~/.cache/neobundle/neobundle.vim/README.md')

    if !filereadable(neobundle_readme)
      echo 'Installing NeoBundle'
      echo ''
      silent !mkdir -p ~/.cache/neobundle
      silent !git clone https://github.com/Shougo/neobundle.vim ~/.cache/neobundle/neobundle.vim
    endif
  " }

  " Init NeoBundle {
    if has('vim_starting')
      set runtimepath+=~/.cache/neobundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/.cache/neobundle/'))

    NeoBundleFetch 'Shougo/neobundle.vim'
  " }

  " load bundles {
    runtime bundles.vim

    if filereadable(expand('~/.bundles.vim'))
      source ~/.bundles.vim
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

" load gui settings
if has("gui_running")
  " not using gvimrc because it's sourced last
  runtime gui.vim
endif

" load abbreviations
runtime abbreviations.vim

" load local settings from ~/.vim/vimrc.local
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
