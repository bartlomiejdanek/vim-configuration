syntax on

let g:dracula_colorterm = 0
let g:dracula_italic = 0
let g:dracula_bold = 0

colorscheme dracula

" set termguicolors
hi! LineNr           ctermbg=NONE    guibg=NONE
hi! Error            ctermbg=darkred ctermfg=black guibg=darkred guifg=black
hi! ErrorMsg         NONE
hi! link ErrorMsg    Error

set nocompatible

set cursorline
set nocursorcolumn
set colorcolumn=120
