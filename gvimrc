if has('nvim')
  GuiFont DejaVu Sans Mono:h10
else
  set guifont=DejaVu\ Sans\ Mono
endif

set guioptions-=L
set guioptions-=T
set guioptions-=m

" needs to be put here to disable visual bell in gui mode
set t_vb=
