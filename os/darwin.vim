" Rgrep fix for Mac Os X
let g:Grep_Xargs_Options='-0'

" MacVim config
if has("gui_macvim")
  " Use the normal HIG movements, except for M-Up/Down
  let macvim_skip_cmd_opt_movement = 1
  " set guifont=Source\ Code\ Pro\ For\ Powerline:h12
  set guifont=Monaco\ For\ Powerline:h11
  " set guifont=Monaco:h11

  highlight SpellBad term=underline gui=undercurl guisp=Orange

  " Different cursors for different modes.
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  set antialias
  set guioptions=a
end

" copy paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui
