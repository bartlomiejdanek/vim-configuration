" rgrep fix for Mac Os X
let g:Grep_Xargs_Options='-0'

" set font for gui
set guifont=Droid\ Sans\ Mono\ Dotted:h10.5

" copy paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

let g:solarized_bold=0    "default value is 1
let g:solarized_underline=0    "default value is 1
let g:solarized_italic=0    "default value is 1
" let g:solarized_termcolors=256    "default value is 16
let g:solarized_contrast="normal"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
let g:solarized_diffmode="high"    "default value is ormal
syntax enable
set background=dark
colorscheme solarized
