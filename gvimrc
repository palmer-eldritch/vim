if has('nvim')
  GuiFont! DejaVuSansMono Nerd Font:h10
else
  set guifont=DejaVuSansMono\ Nerd\ Font\ 10
endif

nnoremap <A-j> 5j
nnoremap <A-k> 5k
vnoremap <A-j> 5j
vnoremap <A-k> 5k

set guioptions-=L
set guioptions-=T
set guioptions-=m

" needs to be put here to disable visual bell in gui mode
set t_vb=
