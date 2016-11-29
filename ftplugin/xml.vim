if exists('b:did_ftplugin_xml')
  finish
endif
let b:did_ftplugin_xml = 1

" use F12 to prettify xml using xmllint
if executable('xmllint')
  nnoremap <buffer><silent> <F12> :%!XMLLINT_INDENT='  ' xmllint --format --recover --encode UTF-8 - 2>/dev/null<CR><CR>
endif
