" fast down/up with Alt-j/k
if has("gui_macvim")
  nnoremap Ï 5j
  nnoremap È 5k
  vnoremap Ï 5j
  vnoremap È 5k
elseif has("gui")
  nnoremap <A-j> 5j
  nnoremap <A-k> 5k
  vnoremap <A-j> 5j
  vnoremap <A-k> 5k
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

" expand folds => Ctrl-Tab
nnoremap <silent> <C-Tab> <Esc>:set foldlevel=100<CR>

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

" managing tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>

" cd to directory of active buffer
function! s:MyCD()
  if exists(':Gcd') " cd to git repo if file is versioned
    silent Gcd
  else
    silent cd %:p:h
  endif
endfunction
nnoremap <leader>cd :call <SID>MyCD()<CR>:pwd<CR>

" remap < and > in visualmode so that the block stays selected
vnoremap > >gv
vnoremap < <gv

" select last pasted text
nnoremap gV `[v`]

" auto center
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

" remap arrow keys to switch between buffers and tabs
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
nnoremap <Up> :tabnext<CR>
nnoremap <Down> :tabprev<CR>

" insert mode mappings {

  " toggle case of word touching cursor in insert mode
  inoremap <C-f> _<Esc>mzg~iw`z"_s

  " shift-enter in insert mode to insert a new line below
  inoremap <S-CR> <Esc>O

  " go to beginning of line
  inoremap II <Esc>I
  " go to end of line
  inoremap AA <Esc>A
  " change everything on the right of the cursor
  inoremap CC <Esc>lC
  " change whole line
  inoremap SS <Esc>S
  " delete line
  inoremap DD <Esc>ddi
  " undo
  inoremap UU <Esc>ui
  " paste
  inoremap PP <C-r>0

" }
