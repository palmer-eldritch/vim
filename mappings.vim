" Disable strip whitespace on save for this file
augroup DisableStripWhitespaceOnSave
  autocmd BufWritePre mappings.vim DisableStripWhitespaceOnSave
  autocmd BufWritePost mappings.vim EnableStripWhitespaceOnSave
augroup end

" Generic mappings {

  " fast down/up with Alt-j/k
  if has('gui_macvim')
    nnoremap Ï 5j
    nnoremap È 5k
    vnoremap Ï 5j
    vnoremap È 5k
  elseif !has('nvim') && !has('gui_running')
    execute 'set <M-j>=j'
    execute 'set <M-k>=k'
    execute 'set <M-j>=j'
    execute 'set <M-k>=k'
    nnoremap <M-j> 5j
    nnoremap <M-k> 5k
    vnoremap <M-j> 5j
    vnoremap <M-k> 5k
  endif

  " use enter to go to line number
  nnoremap <CR> G
  " use backspace to go to beginning of file
  nnoremap <BS> gg
  nnoremap <BS> gg

  " delete into black hole register
  nnoremap <leader>d "_d
  vnoremap <leader>d "_d

  " visual mode, paste without updating the default register
  vnoremap p "_dP

  " clear highlighting of hlsearch
  nnoremap <silent> <leader>hl :nohlsearch<CR>

  " expand folds => Shift-Tab
  nnoremap <silent> <S-Tab> :set foldlevel=100<CR>

  " use Ctrl-h/j/k/l to move between windows
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  " split windows with <leader>s/v
  nnoremap <leader>s <C-w>s
  nnoremap <leader>v <C-w>v
  " close windows with <leader>x
  nnoremap <leader>x <C-w>c
  " maximize window vertically with Ctrl-_
  nnoremap <C-_> <C-w>_
  " shortcuts for resizing windows
  nnoremap <leader>+ 6<C-w>+
  nnoremap <leader>- 6<C-w>-
  nnoremap <leader>> 10<C-w>>
  nnoremap <leader>< 10<C-w><
  nnoremap <leader>\| <C-w>\|
  nnoremap <leader>_ <C-w>_
  nnoremap <leader>= <C-w>=
  " resize all splits equally (inverse of <C-w>n)
  nnoremap <C-w>N :vnew<CR>

  " managing tabs
  nnoremap <leader>tn :tabnew<CR>
  nnoremap <leader>to :tabonly<CR>
  nnoremap <leader>tc :tabclose<CR>
  nnoremap <leader>te :tabedit 

  " mappings to change directory
  if exists('g:change_directory_mappings')
    for s:mapping in keys(g:change_directory_mappings)
      execute ':nnoremap ' . s:mapping . ' :call functions#helpers#change_directory(' . string(g:change_directory_mappings[s:mapping]) . ')<CR>'
    endfor
  endif

  " remap < and > in visualmode so that the block stays selected
  vnoremap > >gv
  vnoremap < <gv

  " select last pasted text
  nnoremap gV `[v`]

  " auto center after search
  nnoremap <silent> n nzz
  nnoremap <silent> N Nzz
  nnoremap <silent> * *zz
  nnoremap <silent> # #zz
  nnoremap <silent> g* g*zz
  nnoremap <silent> g# g#zz
  nnoremap <silent> <C-o> <C-o>zz
  nnoremap <silent> <C-i> <C-i>zz

  " remap left/right arrow keys to switch between tabs
  nnoremap <silent> <Left> :tabprev<CR>
  nnoremap <silent> <Right> :tabnext<CR>
  " disable up/down keys
  nnoremap <Up> <Nop>
  nnoremap <Down> <Nop>

  " enable spellcheck for current buffer {
  if exists('g:spellcheck_mappings')
    for s:lang in keys(g:spellcheck_mappings)
      execute ':nnoremap <silent> ' . g:spellcheck_mappings[s:lang] . " :call functions#helpers#spellcheck_locale('" . s:lang . "')<CR>"
      execute ':inoremap <silent> ' . g:spellcheck_mappings[s:lang] . " <C-o>:call functions#helpers#spellcheck_locale('" . s:lang . "')<CR>"
    endfor
  endif
  " }

  " insert mode mappings {

    " toggle case of word touching cursor in insert mode
    inoremap <C-f> _<Esc>mzg~iw`z:delm z<CR>"_s

    " shift-enter in insert mode to insert a new line below
    inoremap <S-CR> <Esc>O

    " go to beginning of line
    inoremap II <Esc>I
    " go to end of line
    inoremap AA <Esc>A
  " }

" }

