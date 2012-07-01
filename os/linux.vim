" set font for gui
set guifont=Droid\ Sans\ Mono\ Dotted\ 8.8

" copy paste
vnoremap <C-c> "+y  	
inoremap <C-v> <ESC>"+gPi

if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme hemisu
