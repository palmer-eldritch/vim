" Plugins mappings {

  " Buffers {
    " buffkill.vim {
      nnoremap <silent> <leader>q :BW<CR>
    " }
  " }

  " Editing {
    " vim-expand-region {
      vmap v <Plug>(expand_region_expand)
      vmap <C-v> <Plug>(expand_region_shrink)
    " }
  " }

  " Navigation {
    " ctrlp {
      nnoremap <silent> <C-p> :CtrlP<CR>
    " }
    " ctrlp-tjump {
      " remap jump to definition of <cword> to use ctrlp interface to list
      " available tags
      nnoremap <C-]> :CtrlPtjump<CR>
      vnoremap <C-]> :CtrlPtjumpVisual<CR>
  " }

  " Project management {
    " vim-ctrlspace {
      " on neovim, Ctrl-space doesn't get mapped properly
      if has('nvim')
        nnoremap <silent> <C-Space> :CtrlSpace<CR>
      endif
    " }
  " }

  " REPL {
    " vimshell.vim {
      noremap <F4> :call functions#vimshell#spawn()<CR>
      noremap! <F4> <Esc>:call functions#vimshell#spawn()<CR>

      noremap <S-F4> :call functions#vimshell#spawn('botleft', 'split')<CR>
      noremap! <S-F4> <Esc>:call functions#vimshell#spawn('botright', 'split')<CR>
    " }
  " }

  " SCM {
    " Git {
      " gitv {
        nnoremap <silent> <leader>g :Gitv!<CR>
        nnoremap <silent> <leader>h :Gitv<CR>
      " }
      " vim-merginal {
        nnoremap <silent> <leader>m :Merginal<CR>
      " }
    " }
  " }

  " UI {
    " nerdtree {
      nnoremap <silent> <leader>n :NERDTreeToggle<CR>
      nnoremap <silent> <leader>f :NERDTreeFind<CR>
    " }
    " tagbar {
      nnoremap <silent> <leader>t :TagbarToggle<CR>
    " }
    " undotree {
      nnoremap <silent> <leader>u :UndotreeToggle<CR>
    " }
  " }

" }
