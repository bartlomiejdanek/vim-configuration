" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

"
" changes by Bartłomiej Danek
"

hi clear

set background=dark
if version > 580
  " no guarantees for version 5.8 and below, but this makes it stop
  " complaining
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
  let s:molokai_original = g:molokai_original
else
  let s:molokai_original = 0
endif

hi   Boolean          guifg=#af5fff
hi   Character        guifg=#afaf87
hi   Number           guifg=#af5fff
hi   String           guifg=#afaf87
hi   Conditional      guifg=#d7005f   gui=bold
hi   Constant         guifg=#af5fff   gui=bold
hi   Cursor           guifg=#000000   guibg=#d7d3d2
hi   Debug            guifg=#ffd7ff   gui=bold
hi   Define           guifg=#5fd7ff
hi   Delimiter        guifg=#615f5e

hi   DiffAdd          guibg=#005f87
hi   DiffChange       guifg=#d7afaf   guibg=#4b4b4b
hi   DiffDelete       guifg=#d70087   guibg=#5f005f
hi   DiffText         guibg=#878787   gui=bold

hi   Directory        guifg=#87ff00   gui=bold
hi   Error            guifg=#ffafff   guibg=#87005f
hi   ErrorMsg         guifg=#f400ae   guibg=#000000   gui=bold
hi   Exception        guifg=#87ff00   gui=bold
hi   Float            guifg=#af5fff
hi   FoldColumn       guifg=#5b81a8   guibg=#000000
hi   Folded           guifg=#5b81a8   guibg=#000000
hi   Function         guifg=#87ff00
hi   Identifier       guifg=#f48100
hi   Ignore           guifg=#7b7b7c   guibg=#121212
hi   IncSearch        guifg=#87ff00   guibg=#121212

hi   Keyword          guifg=#d7005f   gui=bold
hi   Label            guifg=#fcfeae   gui=none
hi   Macro            guifg=#d7ffaf
hi   SpecialKey       guifg=#5fd7ff

hi   MatchParen       guifg=#87ff00   guibg=#1c1c1c   gui=bold
"    oznaczenie       ()
hi   ModeMsg          guifg=#fcfeae
hi   MoreMsg          guifg=#fcfeae
hi   Operator         guifg=#d7005f

"    complete         menu
hi   Pmenu            guifg=#5fd7ff   guibg=#000000
hi   PmenuSel         guibg=#7b7b7c
hi   PmenuSbar        guibg=#121212
hi   PmenuThumb       guifg=#5fd7ff

hi   PreCondit        guifg=#87ff00   gui=bold
hi   PreProc          guifg=#87ff00
hi   Question         guifg=#5fd7ff
hi   Repeat           guifg=#d7005f   gui=bold
hi   Search           guifg=#080808   guibg=#d7005f

"    marks            column
hi   SignColumn       guifg=#87ff00   guibg=#252525
hi   SpecialChar      guifg=#d7005f   gui=bold
hi   SpecialComment   guifg=#888685   gui=bold
hi   Special          guifg=#5fd7ff   guibg=#121212
hi   SpecialKey       guifg=#888685

hi   Statement        guifg=#d7005f   gui=bold
hi   StatusLine       guifg=#1c1c1c   guibg=#d7d3d2
hi   StatusLineNC     guifg=#7b7b7c   guibg=#121212
hi   StorageClass     guifg=#f48100
hi   Structure        guifg=#5fd7ff
hi   Tag              guifg=#d7005f
hi   Title            guifg=#d75f00
hi   Todo             guifg=#fcf7f5   guibg=#121212   gui=bold

hi   Typedef          guifg=#5fd7ff
hi   Type             guifg=#5fd7ff   gui=none
hi   Underlined       guifg=#7b7b7c   gui=underline

hi   VertSplit        guifg=#7b7b7c   guibg=#121212   gui=bold
hi   VisualNOS        guibg=#434242
hi   Visual           guibg=#252525
hi   WarningMsg       guifg=#fcf7f5   guibg=#434242   gui=bold
hi   WildMenu         guifg=#5fd7ff   guibg=#000000

hi   Normal           guifg=#c7c7c7   guibg=#121212
hi   Comment          guifg=#585859
hi   CursorLine       guibg=#1c1c1c   gui=none
hi   CursorColumn     guibg=#1c1c1c
hi   LineNr           guifg=#bab6b5   guibg=#1c1c1c
hi   NonText          guifg=#bab6b5   guibg=#080808

hi   TabLine          guibg=#1c1c1c   guifg=#ffffd7   gui=none
hi   TabLineFill      guibg=#1c1c1c   guifg=#ffffd7   gui=none
hi   TabLineSel       guibg=#1c1c1c   guifg=#87ff00   gui=bold

"
" Support for 256-color terminal
"
if &t_Co > 255
  hi   Boolean          ctermfg=135
  hi   Character        ctermfg=144
  hi   Number           ctermfg=135
  hi   String           ctermfg=144
  hi   Conditional      ctermfg=161   cterm=bold
  hi   Constant         ctermfg=135   cterm=bold
  hi   Cursor           ctermfg=233   ctermbg=253
  hi   Debug            ctermfg=225   cterm=bold
  hi   Define           ctermfg=81
  hi   Delimiter        ctermfg=241

  hi   DiffAdd          ctermbg=24
  hi   DiffChange       ctermfg=181   ctermbg=239
  hi   DiffDelete       ctermfg=162   ctermbg=53
  hi   DiffText         ctermbg=102   cterm=bold

  hi   Directory        ctermfg=118   cterm=bold
  hi   Error            ctermfg=219   ctermbg=89
  hi   ErrorMsg         ctermfg=199   ctermbg=233        cterm=bold
  hi   Exception        ctermfg=118   cterm=bold
  hi   Float            ctermfg=135
  hi   FoldColumn       ctermfg=67    ctermbg=233
  hi   Folded           ctermfg=67    ctermbg=233
  hi   Function         ctermfg=118
  hi   Identifier       ctermfg=208
  hi   Ignore           ctermfg=244   ctermbg=233
  hi   IncSearch        ctermfg=118   ctermbg=233

  hi   Keyword          ctermfg=161   cterm=bold
  hi   Label            ctermfg=229   cterm=none
  hi   Macro            ctermfg=193
  hi   SpecialKey       ctermfg=81

  hi   MatchParen       ctermfg=118   ctermbg=233       cterm=bold
  "    oznaczenie       ()
  hi   ModeMsg          ctermfg=229
  hi   MoreMsg          ctermfg=229
  hi   Operator         ctermfg=161

  "    complete         menu
  hi   Pmenu            ctermfg=244   ctermbg=234
  hi   PmenuSel         ctermfg=118   ctermbg=235
  hi   PmenuSbar        ctermfg=118   ctermbg=233
  hi   PmenuThumb       ctermfg=240

  hi   PreCondit        ctermfg=118   cterm=bold
  hi   PreProc          ctermfg=118
  hi   Question         ctermfg=81
  hi   Repeat           ctermfg=161   cterm=bold
  hi   Search           ctermfg=232   ctermbg=161

  "    marks            column
  hi   SignColumn       ctermfg=118   ctermbg=235
  hi   SpecialChar      ctermfg=161   cterm=bold
  hi   SpecialComment   ctermfg=245   cterm=bold
  hi   Special          ctermfg=81    ctermbg=233
  hi   SpecialKey       ctermfg=245

  hi   Statement        ctermfg=161   cterm=bold
  hi   StatusLine       ctermfg=235   ctermbg=250
  hi   StatusLineNC     ctermfg=235   ctermbg=240
  hi   StorageClass     ctermfg=208
  hi   Structure        ctermfg=81
  hi   Tag              ctermfg=161
  hi   Title            ctermfg=166
  hi   Todo             ctermfg=231   ctermbg=233       cterm=bold

  hi   Typedef          ctermfg=81
  hi   Type             ctermfg=81    cterm=none
  hi   Underlined       ctermfg=244   cterm=underline

  hi   VertSplit        ctermfg=244   ctermbg=233       cterm=bold
  hi   VisualNOS        ctermbg=238
  hi   Visual           ctermbg=235
  hi   WarningMsg       ctermfg=231   ctermbg=233       cterm=bold
  hi   WildMenu         ctermfg=118   ctermbg=233

  hi   Normal           ctermfg=252   ctermbg=233
  hi   Comment          ctermfg=59
  hi   CursorLine       ctermbg=234   cterm=none
  hi   CursorColumn     ctermbg=234
  hi   LineNr           ctermfg=250   ctermbg=234
  hi   NonText          ctermfg=250   ctermbg=234

  hi   TabLine          ctermbg=234   ctermfg=230       cterm=none
  hi   TabLineFill      ctermbg=234   ctermfg=230       cterm=none
  hi   TabLineSel       ctermbg=234   ctermfg=118       cterm=bold
end
