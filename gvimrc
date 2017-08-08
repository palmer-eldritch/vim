if has('nvim')
  GuiFont DejaVuSansMono Nerd Font Complete Mono:h10
elseif has('gui_macvim')
  set guifont=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h11
else
  set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 10
endif

set guioptions-=L
set guioptions-=T
set guioptions-=m

" needs to be put here to disable visual bell in gui mode
set t_vb=
