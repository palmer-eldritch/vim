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

  " code completion framework
  Plug 'Shougo/deoplete.nvim' " {
    if !has('nvim')
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
  " }

  " snippets management
  Plug 'SirVer/ultisnips' " {
    Plug 'honza/vim-snippets' " snippets for UltiSnips
  " }

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

  " HTML {
    " Mappings for editing html
    Plug 'tpope/vim-ragtag'
  " }

  " Jinja2 {
    Plug 'Glench/Vim-Jinja2-Syntax'
  " }

  " Less {
    autocmd BufNewFile,BufRead *.overrides,*.variables,theme.config setf less
  " }

  " Python {
    " jedi plugin for deoplete
    Plug 'zchee/deoplete-jedi'

    " jedi-vim for code navigation
    Plug 'davidhalter/jedi-vim' " {
      let g:jedi#completions_enabled = 0 " disable completion: it's handled by deoplete
      let g:jedi#smart_auto_mappings = 0

      let g:jedi#goto_command = '<leader>d'
      let g:jedi#goto_assignments_command = '<leader>g'
      let g:jedi#documentation_command = 'K'
      let g:jedi#usages_command = '<leader>u'
      let g:jedi#rename_command = '<leader>r'
    " }

    " virtualenv support
    Plug 'lambdalisue/vim-pyenv'
  " }
  " Vimscript {
    Plug 'Shougo/neco-vim'
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
          \ '~/config/vim/vimrc'
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

  Plug 'junegunn/fzf', {
    \   'do': './install --all',
    \   'dir': '~/.fzf'
    \ }
  Plug 'junegunn/fzf.vim'

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

" Syntax checking {

  " syntax checker
  Plug 'w0rp/ale' " {
    let g:ale_linters = {
      \ 'python': ['flake8', 'pylint'] }
  " }

" }

" UI {

  " File explorer
    Plug 'scrooloose/nerdtree', {
      \ 'on': ['NERDTreeToggle', 'NERDTreeFind']
      \ } " {
      let g:NERDTreeIgnore = ['\.pyc$', '\.o$', '^__pycache__$', '\.egg-info$']

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
      if g:terminal !=# 'console'
        let g:airline_powerline_fonts = 1
      endif
    " }
    Plug 'vim-airline/vim-airline-themes' " {
      if has('gui_running')
        let g:airline_theme = 'deus'
      else
        let g:airline_theme = 'base16_spacemacs'
      end
    " }
  " }

  " show indent levels
  Plug 'nathanaelkane/vim-indent-guides' " {
    "let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent = 5
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 'tagbar']
  " }

  " file type glyphs for nerdtree/airline and more
  if g:terminal !=# 'console'
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
