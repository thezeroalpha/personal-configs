runtime! ftplugin/html/sparkup.vim
setlocal suffixesadd =.js,.ts
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= '| setlocal suffixesadd<'
else
  let b:undo_ftplugin = '| setlocal suffixesadd<'
endif
