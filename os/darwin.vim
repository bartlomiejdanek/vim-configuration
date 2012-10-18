" rgrep fix for Mac Os X
let g:Grep_Xargs_Options='-0'

if has("gui_macvim")
  " Full screen means FULL screen
  set fuoptions=maxvert,maxhorz

  " Use the normal HIG movements, except for M-Up/Down
  let macvim_skip_cmd_opt_movement = 1
  set guifont=Monaco:h11
  no   <D-Left>       <Home>
  no!  <D-Left>       <Home>
  no   <M-Left>       <C-Left>
  no!  <M-Left>       <C-Left>

  no   <D-Right>      <End>
  no!  <D-Right>      <End>
  no   <M-Right>      <C-Right>
  no!  <M-Right>      <C-Right>

  no   <D-Up>         <C-Home>
  ino  <D-Up>         <C-Home>
  imap <M-Up>         <C-o>{

  no   <D-Down>       <C-End>
  ino  <D-Down>       <C-End>
  imap <M-Down>       <C-o>}

  imap <M-BS>         <C-w>
  inoremap <D-BS>     <esc>my0c`y
end

" copy paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

syntax enable
set background=dark
colorscheme hybrid
