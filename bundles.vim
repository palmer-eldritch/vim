" Basics {

  NeoBundle 'tpope/vim-eunuch'  " sugar for unix shell commands
  NeoBundle 'matchit.zip'       " extend % to match more than single chars
  NeoBundle 'tpope/vim-repeat'  " base for repeating complex commands

  " Run async shell commands
  NeoBundle 'skywind3000/asyncrun.vim'

  " support for async execution in vim
  NeoBundle 'Shougo/vimproc.vim', {
    \   'build': {
    \     'unix': 'make -f make_unix.mak',
    \     'mac': 'make -f make_mac.mak'
    \   }
    \ }

" }

" Buffers {
  " delete buffers without messing up the layout
  NeoBundle 'bufkill.vim' " {
    let g:BufKillCreateMappings = 0
  " }
  " manage buffers
  NeoBundle 'jlanzarotta/bufexplorer' " {
    let g:bufExplorerShowRelativePath = 1 " Show relative paths
    let g:bufExplorerSplitRight = 1       " Open split on the right when ,bv is used
  " }
  NeoBundle 'artnez/vim-wipeout'      " delete unused buffers
" }

" Code completion {
  " snippets management
  NeoBundle 'SirVer/ultisnips' " {
    let g:UltiSnipsEnableSnipMate = 0
  " }
  NeoBundle 'honza/vim-snippets'                " snippets for UltiSnips

  " code completion engine
  NeoBundle 'Valloric/YouCompleteMe', {
    \   'build': {
    \     'unix': './install.py --all',
    \     'mac': './install.py --all'
    \   }
    \ } " {
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_key_list_select_completion = ['<C-n>']
    let g:ycm_key_list_previous_completion = ['<C-p>']
  " }
  " Eclim vim plugin
  NeoBundle 'dansomething/vim-eclim'
    let g:EclimFileTypeValidate = 0
    let g:EclimXmlValidate = 0
    let g:EclimCompletionMethod = 'omnifunc'

    " Use eclim semantic completion for these filetypes instead of ycm
    " autocmd FileType ruby if &completefunc != '' | let &omnifunc=&completefunc | endif
    " autocmd FileType ruby setlocal omnifunc=eclim#ruby#complete#CodeComplete

  " Improved tern support with tern_for_vim
  NeoBundle 'ternjs/tern_for_vim', {
   \    'build': {
   \      'unix': 'npm install',
   \      'mac': 'npm install'
   \    }
   \ } " {
    let g:tern_map_keys = 1
  " }
" }

" Color schemes {
  NeoBundle 'vim-scripts/xoria256.vim'
" }

" Debugging {
  " DBGP debugger, works for all languages with a compatible debugger {
    let g:vdebug_options = {
      \ 'port': 9555,
      \ 'server': 'localhost',
      \ 'timeout': 30,
      \ 'on_close': 'detach',
      \ 'break_on_open': 1,
      \ 'debug_window_level': 2
      \ }
  " }
  NeoBundle 'joonty/vdebug'
" }

" Editing {

  " highlight/fix trailing whitespaces
  NeoBundle 'ntpeters/vim-better-whitespace' " {
    let g:strip_whitespace_on_save = 1
    let g:better_whitespace_filetypes_blacklist = ['unite']
  " }

  NeoBundle 'terryma/vim-expand-region'           " expand selection incrementally
  NeoBundle 'Raimondi/delimitMate'                " auto close quotes/parenthesis/brackets...
  NeoBundle 'tpope/vim-endwise'                   " add end when opening a block with if/do/def...
  NeoBundle 'kristijanhusak/vim-multiple-cursors' " multiple cursors for vim
  NeoBundle 'scrooloose/nerdcommenter'            " comment/uncomment lines of code
  NeoBundle 'chrisbra/NrrwRgn'                    " edit only a region of the file
  NeoBundle 'tpope/vim-surround'                  " surround text with quotes/parenthesis...

  " Text objects {
    NeoBundle 'kana/vim-textobj-user'             " base for custom text-objects
    NeoBundle 'saihoooooooo/vim-textobj-space'    " region filled with space
    NeoBundle 'nelstrom/vim-textobj-rubyblock'    " ruby blocks
    NeoBundle 'mattn/vim-textobj-url'             " url
    NeoBundle 'lucapette/vim-textobj-underscore'  " objects surounded by undercores
  " }

" }

" Languages {

  " Coffee Script {
    " support for coffee script in vim
    NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
    " tag support for coffee script
    NeoBundleLazy 'lukaszkorecki/CoffeeTags', {'autoload': {'filetypes': ['coffee']}}
  " }

  " Conky config {
    NeoBundle 'smancill/conky-syntax.vim', {'autoload': {'filetypes': 'conkyrc'}}
  " }

  " CSS {
    NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload': {'filetypes': ['css', 'scss', 'sass']}}
  " }

  " Elixir {
    NeoBundle 'elixir-lang/vim-elixir'
  " }

  " HTML/XML {
    NeoBundleLazy 'tpope/vim-ragtag', {'autoload': {'filetypes': ['html', 'xml', 'eruby']}}
    NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': ['html', 'haml', 'eruby']}}
    NeoBundleLazy 'slim-template/vim-slim', {'autoload': {'filetypes': 'slim' }}
  " }

  " Javascript {
    " improved javascript indentation and syntax support in vim
    NeoBundle 'pangloss/vim-javascript'
    " better json highlighting
    NeoBundle 'elzr/vim-json'
      let g:vim_json_syntax_conceal = 0
    " }
    " syntax for javascript libraries
    NeoBundle 'othree/javascript-libraries-syntax.vim', {'depends': 'pangloss/vim-javascript'}
    " jsx syntax
    NeoBundle 'mxw/vim-jsx' " {
      let g:jsx_ext_required = 0
    " }

  " PHP {
    NeoBundleLazy 'evidens/vim-twig', {'autoload': {'filetypes': ['twig']}}
  " }

  " Python {
    NeoBundle 'jmcantrell/vim-virtualenv' " support for pyton virtualenv
  " }

  " Ruby {
    NeoBundleLazy 'palmer-eldritch/ri.vim', {
      \ 'autoload': {'filetypes': ['ruby', 'eruby', 'haml', 'slim']},
      \ 'depends': 'tpope/vim-bundler'
      \ }
    NeoBundle 'tpope/vim-bundler' " support for bundler
    NeoBundle 'tpope/vim-rails'   " support for rails
    NeoBundle 'tpope/vim-rake'    " support for rake
    NeoBundle 'tpope/vim-rbenv'   " support for rbenv
    NeoBundle 'vim-ruby/vim-ruby' " latest version of ruby runtime files
  " }

  " Rust {
    NeoBundleLazy 'rust-lang/rust.vim', {
      \ 'autoload': {'filetypes': ['rust']}
      \ }
  " }

  " Vimperator config files {
    NeoBundle 'vimperator/vimperator.vim'
  " }

" }

" Marks {
  NeoBundle 'kshenoy/vim-signature' " show marks next to line numbers
" }

" Misc {
  NeoBundle 'chrisbra/vim_faq'  " additional documentation
  " note taking plugin
  NeoBundle 'xolox/vim-notes', {'depends': 'xolox/vim-misc'} " {
    let g:notes_directories = ['~/Dropbox/Notes']
    let g:notes_suffix = '.txt'
  " }
  " nice start page
  NeoBundle 'mhinz/vim-startify' " {
    let g:startify_session_dir = $VIMCACHEDIR . '/session'
    let g:startify_change_to_vcs_root = 1
    let g:startify_files_number = 5
    let g:startify_session_number = 10
    let g:starify_session_sort = 1
    let g:startify_custom_header = []
    let g:startify_bookmarks = [
          \ '~/config/vim/vimrc'
          \ ]
    let g:startify_list_order = [
          \ ['    Sessions'],
          \ 'sessions',
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

  " Open file list with ctrl-p
  NeoBundle 'ctrlpvim/ctrlp.vim' " {
    let g:ctrlp_extensions = ['bookmarkdir', 'dir', 'tag']
    let g:ctrlp_custom_ignore = {
      \   'dir':  '\v[\/](\.(git|hg|svn|bundle)|vendor\/bundle)$',
      \ }
    let g:ctrlp_tilde_homedir = 1
  " }

  " ctrlp extensions {
    " Use ctrlp interface to list tag matches
    NeoBundle 'ivalkeen/vim-ctrlp-tjump', {
      \   'autoload': {
      \     'commands': ['CtrlPtjump', 'CtrlPtjumpVisual']
      \   },
      \   'depends': 'kien/ctrlp.vim'
      \ }
  " }

  " Search in files using ack (or ag if present on the system)
  NeoBundleLazy 'mileszs/ack.vim', {
    \   'autoload': {
    \     'commands': ['Ack', 'AckAdd', 'AckFile', 'AckHelp', 'AckWindow']
    \   }
    \ } " {
    if exists('g:search_command')
      let g:ackprg = g:search_command
    endif
    let g:ackhighlight = 1
  " }

  NeoBundle 'Lokaltog/vim-easymotion' " move around using visual hints

  if has('nvim') || has('channel') && has('job')
    NeoBundle 'metakirby5/codi.vim'
  endif

" }

" Patches {
  " review patch files in vim
  NeoBundleLazy 'junkblocker/patchreview-vim', {
    \   'autoload': {
    \     'commands': ['DiffReview', 'PatchReview', 'ReversePatchReview']
    \   }
    \ }
" }

" Project management {
" https://github.com/LucHermitte/local_vimrc#_vimrc_localvim-content
  NeoBundle 'embear/vim-localvimrc'   " per-project vimrc
  NeoBundle 'tpope/vim-projectionist' " project configuration using projections
  NeoBundle 'vim-ctrlspace/vim-ctrlspace' " {
    let g:CtrlSpaceFileEngine = 'auto'
    if executable("ag")
      let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif
  " }
" }

" REPL {
  NeoBundle 'ujihisa/repl.vim', {
    \ 'depends': 'Shougo/vimshell.vim'
    \ }

  NeoBundleLazy 'Shougo/vimshell.vim', {
    \ 'depends': 'Shougo/vimproc.vim',
    \ 'autoload': {
    \   'commands': ['VimShell', 'VimShellCreate', 'VimShellTab', 'VimShellPop', 'VimShellCurrentDir',
    \                'VimShellBufferDir', 'VimShellExecute', 'VimShellInteractive', 'VimShellSendString',
    \                'VimShellSendBuffer', 'VimShellClose']
    \  }
    \ }
" }

" SCM {

  " Git {
    NeoBundle 'tpope/vim-fugitive'    " git support for vim
    " git history viewer
    NeoBundleLazy 'gregsexton/gitv', {
      \   'autoload': {
      \     'commands': 'Gitv'
      \   }
      \ }
    " fugitive extension to manage branches
    NeoBundle 'idanarye/vim-merginal' " {
      " Merginal tries to catch an error in english, so I have to force it...
      language messages C
    " }
    " show changed lines in sign column
    NeoBundle 'airblade/vim-gitgutter'
    " easier diffs, stage hunks, amend commits
    NeoBundle 'jreybert/vimagit'
  " }

" }

" Session management {

  NeoBundle 'xolox/vim-session' " {
    let g:session_directory = $VIMCACHEDIR . '/session'
    let g:session_lock_directory = $VIMCACHEDIR
    let g:session_autoload = 'no'
    let g:session_autosave = 'yes'
    let g:session_autosave_periodic = 5
    let g:session_extension = '.session'
    let g:session_verbose_message = 0
    let g:session_persist_font = 0
    let g:session_persist_color = 0
    let g:session_persist_global = 0
    let g:session_command_aliases = 1
    let g:session_menu = 0
  " }

" }

" Syntax checking {

  " syntax checker
  NeoBundle 'scrooloose/syntastic' " {
    let g:syntastic_auto_loc_list = 1 " open window automatically

    " python {
      let g:syntastic_python_checkers = ['pyflakes']
    " }
  " }

" }

" UI {

  " File explorer,
  " two plugins:
  " - nerdtree-git-plugin: to show git status flags on files in nerdtree
  " - nerdtree-execute: add execute function to the nerdtree menu (opened by
  "   pressing m on a node)
  " - nerdtree-syntax-highlight: work with vim-devicons to provide different
  "   colors for file types
  NeoBundleLazy 'scrooloose/nerdtree', {
    \   'autoload': {
    \     'commands': ['NERDTreeToggle', 'NERDTreeFind'],
    \     'explorer': 1
    \   }
    \ } " {
    let NERDTreeIgnore = ['\.pyc$', '\.o$']
    NeoBundle 'Xuyuanp/nerdtree-git-plugin', {'depends': 'scrooloose/nerdtree'}
    NeoBundle 'ivalkeen/nerdtree-execute', {'depends': 'scrooloose/nerdtree'}
    NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight', {'depends': 'scrooloose/nerdtree'}
  " }

  " Tags side-panel
  NeoBundleLazy 'majutsushi/tagbar', {
    \   'autoload': {
    \     'commands': 'TagbarToggle'
    \   }
    \ } " {
    let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    " config for wsdl
    let g:tagbar_type_xml = {
    \ 'ctagstype' : 'WSDL',
    \ 'kinds'     : [
    \   'n:namespaces',
    \   'm:messages',
    \   'p:portType',
    \   'o:operations',
    \   'b:bindings',
    \   's:service'
    \  ]
    \ }
  " }

  " Visualize undo tree
  NeoBundleLazy 'mbbill/undotree', {
    \   'autoload': {
    \     'commands': 'UndoTreeToggle'
    \   }
    \ }

  " Status line {
    " rich status line for vim
    NeoBundle 'vim-airline/vim-airline' " {
      let g:airline_exclude_preview = 0
      if g:terminal != 'console'
        let g:airline_powerline_fonts = 1
      endif
    " }
    NeoBundle 'vim-airline/vim-airline-themes', {
    \ 'depends': 'vim-airline/vim-airline'
    \ } " {
      if has('gui_running')
        let g:airline_theme = 'deus'
      else
        let g:airline_theme = 'base16_spacemacs'
      end
    " }
  " }

" }

" vim-devicons: file type glyphs for nerdtree/airline/unite and more {
  if g:terminal != 'console'
    NeoBundle 'ryanoasis/vim-devicons' " {
      let g:WebDevIconsUnicodeDecorateFolderNodes = 1
      let g:DevIconsEnableFoldersOpenClose = 1
    " }
  endif
" }

" Neovim {
  if has('nvim')
    NeoBundle 'equalsraf/neovim-gui-shim'
  endif
" }
