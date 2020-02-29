set background=light
if version > 580
  highlight clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name = "jokull"
hi Normal guifg=#2c2625 guibg=#e4e4e4 ctermfg=0 ctermbg=254 cterm=NONE gui=NONE
hi Cursorline guifg=NONE guibg=#d0d0d0 ctermfg=NONE ctermbg=252 cterm=NONE gui=NONE
hi String guifg=#009051 guibg=NONE ctermfg=29 ctermbg=NONE cterm=italic gui=italic
hi Identifier guifg=#112d4e guibg=NONE ctermfg=17 ctermbg=NONE cterm=NONE gui=NONE
hi Function guifg=#0096ff guibg=NONE ctermfg=33 ctermbg=NONE cterm=bold gui=bold
hi Statement guifg=#0050a0 guibg=NONE ctermfg=25 ctermbg=NONE cterm=NONE gui=NONE
hi Include guifg=#2696bf guibg=NONE ctermfg=31 ctermbg=NONE cterm=bold gui=bold
hi Type guifg=#005493 guibg=NONE ctermfg=24 ctermbg=NONE cterm=NONE gui=NONE
hi Search guifg=NONE guibg=#d7f1e0 ctermfg=NONE ctermbg=194 cterm=NONE gui=NONE
hi Incsearch guifg=NONE guibg=#b7d1b0 ctermfg=NONE ctermbg=151 cterm=bold gui=bold
hi Folded guifg=#236dff guibg=#d0d0d0 ctermfg=27 ctermbg=252 cterm=NONE gui=NONE
hi Tablinefill guifg=NONE guibg=#d0d0d0 ctermfg=NONE ctermbg=252 cterm=NONE gui=NONE
hi Tablinesel guifg=NONE guibg=#e5e5e5 ctermfg=NONE ctermbg=7 cterm=NONE gui=NONE
hi Wildmenu guifg=#005493 guibg=#e5e5e5 ctermfg=24 ctermbg=7 cterm=bold gui=bold
hi Linenr guifg=#9b9b4c guibg=NONE ctermfg=101 ctermbg=NONE cterm=NONE gui=NONE
hi Preproc guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi Vertsplit guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi Todo guifg=#0000FF guibg=#FFFF00 ctermfg=21 ctermbg=11 cterm=NONE gui=NONE
hi Nontext guifg=#81A1C1 guibg=NONE ctermfg=109 ctermbg=NONE cterm=NONE gui=NONE
hi Statusline guifg=NONE guibg=#7abecd ctermfg=NONE ctermbg=110 cterm=NONE gui=NONE
hi Statuslinenc guifg=NONE guibg=#a8dbfd ctermfg=NONE ctermbg=153 cterm=NONE gui=NONE
hi Visual guifg=NONE guibg=#a8caff ctermfg=NONE ctermbg=153 cterm=NONE gui=NONE
hi Title guifg=#225555 guibg=NONE ctermfg=23 ctermbg=NONE cterm=bold gui=bold
hi Matchparen guifg=#d7f1e0 guibg=#a8dbfd ctermfg=194 ctermbg=153 cterm=NONE gui=NONE
hi QfFileName guifg=#0076ff guibg=NONE ctermfg=33 ctermbg=NONE cterm=NONE gui=NONE
hi Delimiter guifg=#5f5f00 guibg=NONE ctermfg=58 ctermbg=NONE cterm=NONE gui=NONE
hi Comment guifg=#5f5f5f guibg=NONE ctermfg=59 ctermbg=NONE cterm=italic gui=italic
hi Diffadd guifg=NONE guibg=#a5ffa5 ctermfg=NONE ctermbg=157 cterm=NONE gui=NONE
hi Diffdelete guifg=NONE guibg=#ffa5a5 ctermfg=NONE ctermbg=217 cterm=NONE gui=NONE
hi Diffchange guifg=#2c2625 guibg=#c0beff ctermfg=0 ctermbg=147 cterm=NONE gui=NONE
hi Difftext guifg=NONE guibg=#a0aeff ctermfg=NONE ctermbg=147 cterm=bold gui=bold
hi! link precondit include
hi! link tag delimiter
hi! link spellocal string
hi! link conditional statement
hi! link markdowncode type
hi! link netrwdir function
hi! link netrwexe title
hi! link tabline tablinefill
hi! link mkdlink type
hi! link signcolumn linenr
hi! link spellcap string
hi! link spellrare string
hi! link netrwMarkFile incsearch
hi! link markdownUrl string
hi! link spellbad todo
hi! link number delimiter
hi! link define include
hi! link typedef structure
hi! link storageclass structure
hi! link specialcomment delimiter
hi! link pmenu statuslinenc
hi! link macro include
hi! link pmenusel statusline
hi! link character constant
hi! link repeat statement
hi! link cursorlinenr delimiter
hi! link debug delimiter
hi! link special delimiter
hi! link label structure
hi! link operator statement
hi! link vimwikilink type
hi! link specialchar delimiter
