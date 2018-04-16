" Basics

  Plug 'tpope/vim-eunuch' " sugar for unix shell commands
  Plug 'tpope/vim-repeat' " base for repeating complex commands

  if !has('nvim')
    packadd matchit         " extend % to match more than single chars
  endif

" }

" Buffers {

  " delete buffers without messing up the layout
  Plug 'qpkorr/vim-bufkill' " {
    let g:BuffKillCreateMappings = 0
  " }

  " manage buffers {
    Plug 'jlanzarotta/bufexplorer' " {
      let g:bufExplorerShowRelativePath = 1 " Show relative paths
      let g:bufExplorerSplitRight = 1       " Open split on the right when ,bv is used
    " }
  " }

" }

" Code completion {
" }

" Editing {

  " highlight/fix trailing whitespaces
  Plug 'ntpeters/vim-better-whitespace' " {
    let g:strip_whitespace_on_save = 1
  " }

  Plug 'Raimondi/delimitMate'                 " auto close quotes/parenthesis/brackets
  Plug 'tpope/vim-endwise'                    " add end when opening a block with if/do/def
  Plug 'kristijanhusak/vim-multiple-cursors'  " multiple cursors for vim
  Plug 'scrooloose/nerdcommenter'             " comment/uncomment lines of code
  Plug 'tpope/vim-surround'                   " surround text with quotes/parenthesis

" }

" Languages {
  " Python {
  " }
" }

" Marks {

  Plug 'kshenoy/vim-signature'  " show marks next to line numbers

" }

" Misc {

  " nice start page
  Plug 'mhinz/vim-startify' " {
    let g:startify_session_dir = $VIMCACHEDIR . '/session'
    let g:startify_change_to_vcs_root = 1
    let g:startify_files_number = 6
    let g:startify_session_number = 5
    let g:starify_session_sort = 1
    let g:startify_custom_header = []
    let g:startify_bookmarks = [
          \ '~/config/neovim/init.vim'
          \ ]
    let g:startify_list_order = [
          \ ['    Favoris'],
          \ 'bookmarks',
          \ ['    Derniers fichiers édités'],
          \ 'files',
          \ ['    Commandes'],
          \ 'commands'
          \ ]
  " }

" }

" Navigation {

  " Search in files using ack (or ag if present on the system)
  Plug 'mileszs/ack.vim', {
    \   'on': ['Ack', 'AckAdd', 'AckFile', 'AckHelp', 'AckWindow']
    \ } " {
    if exists('g:search_command')
      let g:ackprg = g:search_command
    endif
    let g:ackhighlight = 1
  " }

  Plug 'Lokaltog/vim-easymotion' " move around using visual hints

" }

" SCM {

  " Git {
    Plug 'tpope/vim-fugitive'     " git support for vim
    Plug 'airblade/vim-gitgutter' " show changed lines in sign column
  " }

" }

" UI {

  " File explorer
    Plug 'scrooloose/nerdtree', {
      \ 'on': ['NERDTreeToggle', 'NERDTreeFind']
      \ } " {
      let NERDTreeIgnore = ['\.pyc$', '\o$']

      Plug 'Xuyuanp/nerdtree-git-plugin'    " show git status flags on files
      Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " color file icons
    "}

  " Tags side-panel
  Plug 'majutsushi/tagbar', {
    \   'on': 'TagbarToggle'
    \ } " {
    let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
  " }


  " Status line {
    " rich status line for vim
    Plug 'vim-airline/vim-airline' " {
      let g:airline_exclude_preview = 0
      if g:terminal != 'console'
        let g:airline_powerline_fonts = 1
      endif
    " }
    Plug 'vim-airline/vim-airline-themes', {
    \ 'depends': 'vim-airline/vim-airline'
    \ } " {
      if has('gui_running')
        let g:airline_theme = 'deus'
      else
        let g:airline_theme = 'base16_spacemacs'
      end
    " }
  " }

  " file type glyphs for nerdtree/airline and more
  if g:terminal != 'console'
    Plug 'ryanoasis/vim-devicons' " {
      let g:WebDevIconsUnicodeDecorateFolderNodes = 1
      let g:DevIconsEnableFoldersOpenClose = 1
    " }
  endif

" }

" Neovim {
  if has('nvim')
    Plug 'equalsraf/neovim-gui-shim'
  endif
" }
