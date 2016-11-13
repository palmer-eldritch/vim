" Basics {

  NeoBundle 'tpope/vim-eunuch'  " sugar for unix shell commands
  NeoBundle 'matchit.zip'       " extend % to match more than single chars
  NeoBundle 'tpope/vim-repeat'  " base for repeating complex commands

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
    nnoremap <silent> <leader>q :BW<CR>
  " }
  " manage buffers
  NeoBundle 'jlanzarotta/bufexplorer' " {
    let g:bufExplorerShowRelativePath = 1 " Show relative paths
    let g:bufExplorerSplitRight = 1       " Open split on the right when ,bv is used
  " }
  NeoBundle 'artnez/vim-wipeout'      " delete unused buffers
" }

" Code completion {
  NeoBundle 'SirVer/ultisnips'                  " snippets management
  NeoBundle 'honza/vim-snippets'                " snippets for UltiSnips
  NeoBundle 'matthewsimo/angular-vim-snippets'  " snippets for angularjs

  " code completion engine
  NeoBundle 'Valloric/YouCompleteMe', {
    \   'build': {
    \     'unix': './install.py',
    \     'mac': './install.py'
    \   }
    \ } " {
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_key_list_select_completion = ['<C-n>']
    let g:ycm_key_list_previous_completion = ['<C-p>']
  " }
  " Eclim vim plugin
  NeoBundle 'dansomething/vim-eclim'
    let g:EclimFileTypeValidate = 0
    let g:EclimCompletionMethod = 'omnifunc'
    " }
" }

" Color schemes {
  NeoBundle 'vim-scripts/xoria256.vim'
" }

" Editing {

  " highlight/fix trailing whitespaces
  NeoBundle 'ntpeters/vim-better-whitespace' " {
    let g:strip_whitespace_on_save = 1
    let g:better_whitespace_filetypes_blacklist = ['unite']
  " }

  " expand selection incrementally
  NeoBundle 'terryma/vim-expand-region' " {
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)
  " }

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

  " CSS {
    NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload': {'filetypes': ['css', 'scss', 'sass']}}
  " }

  " HTML/XML {
    NeoBundleLazy 'tpope/vim-ragtag', {'autoload': {'filetypes': ['html', 'xml', 'eruby']}}
    NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': ['html', 'haml', 'eruby']}}
    NeoBundleLazy 'slim-template/vim-slim', {'autoload': {'filetypes': 'slim' }}
  " }

  " Javascript {
    " improved javascript indentation and syntax support in vim
    NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript']}}
    " better json highlighting
    NeoBundleLazy 'elzr/vim-json', {'autoload': {'filetypes': ['javascript', 'json']}} " {
      let g:vim_json_syntax_conceal = 0
    " }
    " syntax for javascript libraries
    NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload': {'filetypes': ['javascript', 'coffee']}}
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
      \}
    NeoBundle 'tpope/vim-bundler' " support for bundler
    NeoBundle 'tpope/vim-rails'   " support for rails
    NeoBundle 'tpope/vim-rake'    " support for rake
    NeoBundle 'tpope/vim-rbenv'   " support for rbenv
    NeoBundle 'vim-ruby/vim-ruby' " latest version of ruby runtime files
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
    let g:notes_smart_quotes = 0
    let g:notes_tab_indents = 0
  " }
  " nice start page
  NeoBundle 'mhinz/vim-startify' " {
    let g:autoloaded_startify = 1
    let g:loaded_startify = 1
    let g:startify_session_dir = g:cache_root . '/session'
    let g:startify_custom_header = []
  " }
" }

" Navigation {

  NeoBundle 'kien/ctrlp.vim', {'depends': 'tacahiroy/ctrlp-funky'} " {
    let g:ctrlp_custom_ignore = {
      \   'dir':  '\v[\/]\.(git|hg|svn)$',
      \ }
  " }

  " Search in files using ack
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
  NeoBundle 'embear/vim-localvimrc'   " per-project vimrc
  NeoBundle 'tpope/vim-projectionist' " project configuration using projections
  NeoBundle 'vim-ctrlspace/vim-ctrlspace' " {
    let g:CtrlSpaceFileEngine = 'auto'
    if executable("ag")
      let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif
    " on neovim, Ctrl-space doesn't get mapped properly
    if has('nvim')
      nnoremap <silent> <C-Space> :CtrlSpace<CR>
    endif
  " }
" }

" SCM {

  " Git {
    NeoBundle 'tpope/vim-fugitive'    " git support for vim
    " git history viewer
    NeoBundleLazy 'gregsexton/gitv', {
      \   'autoload': {
      \     'commands': 'Gitv'
      \   }
      \ } " {
      nnoremap <silent> <leader>g :Gitv!<CR>
      nnoremap <silent> <leader>h :Gitv<CR>
    " }
    NeoBundle 'idanarye/vim-merginal' " fugitive extension to manage branches
  " }

" }

" Session management {

  NeoBundle 'xolox/vim-session' " {
    let g:session_directory = g:cache_root . '/session'
    let g:session_autosave = 'no'
    let g:session_command_aliases = 1
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

  " File explorer
  NeoBundleLazy 'scrooloose/nerdtree', {
    \   'autoload': {
    \     'commands': ['NERDTreeToggle', 'NERDTreeFind'],
    \     'explorer': 1
    \   }
    \ } " {
    let NERDTreeIgnore = ['\.pyc$', '\.o$']
    nnoremap <silent> <leader>n :NERDTreeToggle<CR>
    nnoremap <silent> <leader>f :NERDTreeFind<CR>
  " }

  " Tags side-panel
  NeoBundleLazy 'majutsushi/tagbar', {
    \   'autoload': {
    \     'commands': 'TagbarToggle'
    \   }
    \ } " {
    let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    nnoremap <silent> <leader>t :TagbarToggle<CR>
  " }

  " Visualize undo tree
  NeoBundleLazy 'mbbill/undotree', {
    \   'autoload': {
    \     'commands': 'UndoTreeToggle'
    \   }
    \ } " {
    nnoremap <silent> <leader>u :UndotreeToggle<CR>
  " }

  " Status line {
    " rich status line for vim
    NeoBundle 'vim-airline/vim-airline' " {
      let g:airline_exclude_preview = 0
    " }
  " }

" }

" Unite {
  NeoBundle 'Shougo/unite.vim' " Base unite plugin
  NeoBundle 'Shougo/unite-outline' " tags for current buffer
  NeoBundle 'tsukkee/unite-tag', {'depends': 'Shougo/neoinclude.vim'}
" }

" Neovim {
  if has('nvim') && has('gui_running')
    Plug 'equalsraf/neovim-gui-shim'
  endif
" }
