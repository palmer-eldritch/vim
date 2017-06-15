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
    NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript']}}
    " better json highlighting
    NeoBundleLazy 'elzr/vim-json', {'autoload': {'filetypes': ['javascript', 'json']}} " {
      let g:vim_json_syntax_conceal = 0
    " }
    " syntax for javascript libraries
    NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload': {'filetypes': ['javascript', 'coffee']}}
  " }

  " Markdown
    "NeoBundle 'vim-pandoc/vim-pandoc-syntax'
    "NeoBundle 'vim-pandoc/vim-pandoc' " {
    "  let g:pandoc#spell#enabled = 0
    "" }
    "NeoBundle 'vim-pandoc/vim-pandoc-after'
    "  let g:pandoc#after#modules#enabled = ['ultisnips', 'nrrwrgn']
    "" }
    "NeoBundle 'tex/vimpreviewpandoc'
    "NeoBundle 'JamshedVesuna/vim-markdown-preview'
  "

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

" REPL {
  NeoBundle 'ujihisa/repl.vim', {
    \ 'depends': 'Shougo/vimshell.vim'
    \}

  NeoBundle 'Shougo/vimshell.vim', {
    \ 'depends': 'Shougo/vimproc.vim'
    \}
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
    " fugitive extension to manage branches
    NeoBundle 'idanarye/vim-merginal' " {
      " Merginal tries to catch an error in english, so I have to force it...
      language messages C
      nnoremap <silent> <leader>m :Merginal<CR>
    " }
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

  " File explorer,
  " two plugins:
  " - nerdtree-git-plugin: to show git status flags on files in nerdtree
  " - nerdtree-execute: add execute function to the nerdtree menu (opened by
  "   pressing m on a node)
  NeoBundleLazy 'scrooloose/nerdtree', {
    \   'autoload': {
    \     'commands': ['NERDTreeToggle', 'NERDTreeFind'],
    \     'explorer': 1
    \   },
    \   'depends': [
    \     'Xuyuanp/nerdtree-git-plugin',
    \     'ivalkeen/nerdtree-execute'
    \   ]
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

" vim-devicons: file type glyphs for nerdtree/airline/unite and more {
"  NeoBundle 'ryanoasis/vim-devicons'
" }

" Neovim {
  if has('nvim')
    NeoBundle 'equalsraf/neovim-gui-shim'
  endif
" }
