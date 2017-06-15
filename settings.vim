" General {
set autoread                        " load file from disk if changed
set fileformats=unix,dos,mac        " eol formats
set history=1000                    " set history size
set mouse=a                         " use mouse everywhere
set nobackup                        " no backups
set noswapfile                      " no swap files
set shell=/bin/bash                 " use bash as shell
set wildignore=*.swp,*~,*.pyc,*.o   " ignore those files
set backspace=indent,eol,start      " proper backspace functionnalities
set path=$PWD/**                    " set path to PWD and subdirs
set hidden                          " for ctrl-space plugin
set encoding=utf-8
" }

" UI {
set cursorcolumn    " highlight current column
set cursorline      " highlight current line
set laststatus=2    " always show status line
set list            " show invisible characters
set listchars=nbsp:¬,tab:>-,extends:>,precedes:<
set number          " show line numbers
set numberwidth=5   " width of line numbers
set ruler           " show line and column number of cursor
set showcmd         " show command being typed
set showmatch       " show matching characters
set smarttab        " backspace delete shifwidth spaces
set wildmenu        " show menu for command line completion
" }

" Text formating/layout {
set autoindent      " enable autoindent
set expandtab       " expand tabs
set nowrap          " don't wrap lines
set linebreak       " when wrap is enabled, break at word
set shiftround      " round indent to multiple of shiftwidth
set shiftwidth=2    " autoindent size
set softtabstop=2   " size of an expanded tab
set tabstop=2       " size of real tabs
" }

" Bell {
set noerrorbells            " don't ring bell on error
set visualbell              " use visual bell
set t_vb=
" }

" Search {
set incsearch   " jump to results as you type
set ignorecase  " ignore case when searching
set smartcase   " don't ignore case if there's uppercase in pattern
set hlsearch    " highlight search results
if exists('g:search_command')
  let &grepprg = g:search_command . ' $*'
  set grepformat=%f:%l:%c:%m
endif
" }

" Folding {
set foldmethod=indent   " use indentation for folding code
set foldlevel=100       " by default, no folds
" }

" Code completion {
set completeopt-=preview  " don't show preview window
" }

if !has('gui_running')
  set background=dark
  set t_Co=256
endif
colorscheme xoria256
