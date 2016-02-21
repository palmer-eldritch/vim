" Basics {

  NeoBundle 'tpope/vim-eunuch'  " sugar for unix shell commands
  NeoBundle 'matchit.zip'       " extend % to match more than single chars
  NeoBundle 'tpope/vim-repeat'  " base for repeating complex commands

  " support for async execution in vim
  NeoBundle 'Shougo/vimproc.vim', {
    \   'build': {
    \     'unix': 'make -f make_unix.mak'
    \   }
    \ }

" }

" Buffers {
  " delete buffers without messing up the layout
  NeoBundle 'bufkill.vim' " {
    let g:BufKillCreateMappings = 0
    nnoremap <silent> <leader>q :BW<CR>
  " }
  NeoBundle 'jlanzarotta/bufexplorer' " manage buffers
  NeoBundle 'artnez/vim-wipeout'      " delete unused buffers
" }

" Code completion {
  NeoBundle 'SirVer/ultisnips'                  " snippets management
  NeoBundle 'honza/vim-snippets'                " snippets for UltiSnips
  NeoBundle 'matthewsimo/angular-vim-snippets'  " snippets for angularjs

  " code completion engine
  NeoBundle 'Valloric/YouCompleteMe', {
    \   'build': {
    \     'unix': 'sh install.sh --clang-completer --system-libclang'
    \   }
    \ } " {
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_key_list_select_completion = ['<C-n>']
    let g:ycm_key_list_previous_completion = ['<C-p>']
  " }
" }

" Color schemes {
  NeoBundle 'vim-scripts/xoria256.vim'
" }

" Editing {

  " highlight/fix trailing whitespaces
  NeoBundle 'ntpeters/vim-better-whitespace' " {
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
    NeoBundleLazy 'lukaszkorecki/CoffeeTags', {'autoloads': {'filetypes': ['coffee']}}
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
    NeoBundle 'tpope/vim-bundler' " support for bundler
    NeoBundle 'tpope/vim-rails'   " support for rails
    NeoBundle 'tpope/vim-rake'    " support for rake
    NeoBundle 'tpope/vim-rvm'     " support for rvm
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
    let g:notes_directories = ['~/notes']
    let g:notes_suffix = '.txt'
    let g:notes_smart_quotes = 0
    let g:notes_tab_indents = 0
  " }
  " nice start page
  NeoBundle 'mhinz/vim-startify'
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
    let g:ackprg='ack-grep --nogroup --column --smart-case --nocolor --follow'
  " }

  NeoBundle 'Lokaltog/vim-easymotion' " move around using visual hints

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
    NeoBundle 'vim-airline/vim-airline'
  " }

" }
