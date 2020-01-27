setlocal wrap shiftwidth=4 tabstop=4 softtabstop=4 breakindent breakindentopt=shift:3

cabbrev <buffer> table VimwikiTable
nmap <buffer> <leader><CR> <Plug>VimwikiSplitLink

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
end
let b:undo_ftplugin .= '|setlocal wrap< shiftwidth< tabstop< softtabstop< breakindent< breakindentopt<'
let b:undo_ftplugin .= '| cabc <buffer>'
let b:undo_ftplugin .= '| nmapc <buffer>'
