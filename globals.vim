if exists('g:globals')
  finish
endif
let g:globals = 1

" mapping for toggling / changing spellcheck languages
let g:spellcheck_mappings = {
 \  'fr': '<F7>',
 \  'en': '<F8>'
 \ }

" mappings for changing directory
let g:change_directory_mappings = {
 \  '<leader>cd': {},
 \  '<leader>cc': {'method': 'parent'},
 \  '<leader><leader>cd': {'cmd': 'lcd'},
 \  '<leader><leader>cc': {'method': 'parent', 'cmd': 'lcd'}
 \ }

" files/directories that mark the root of a project
let g:root_markers = ['.git/', '.git', '.svn/', '.hg/', '.bzr/']

" load custom functions
runtime functions/helpers.vim
