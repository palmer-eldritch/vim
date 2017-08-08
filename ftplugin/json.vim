if exists('b:did_ftplugin_json')
  finish
endif
let b:did_ftplugin_json = 1

" use F12 to prettify json using python json.tool
if executable('python')
  nnoremap <buffer><silent> <F12> :%!python -mjson.tool<CR>
endif
