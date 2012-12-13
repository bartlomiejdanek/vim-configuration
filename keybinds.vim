" =========================================
" KEYBINDS
" =========================================

" Dont want F1, ok it could be Tyrrell P34 (http://pl.wikipedia.org/wiki/Tyrrell_P34)
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" mapping for navigation
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
nnoremap <buffer> <Up> gk
nnoremap <buffer> <Down> gj
inoremap <buffer> <Up> <C-O>gk
inoremap <buffer> <Down> <C-O>gj
vnoremap <buffer> <Up> gk
vnoremap <buffer> <Down> gj

" enter fix - press enter and go to insert mode
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" duplicate current line
nnoremap <C-d> Yp
" paste to current line
"noremap p P

" change location of current work directory
map <Leader>C :cd %:p:h<CR>

"f# keys
nmap <silent> <F2> :NERDTreeToggle<CR>
inoremap <silent> <F2> <ESC>:NERDTreeToggle<CR>
nmap <silent> <F3> :GundoToggle<CR>
nmap <silent> <F4> :TlistToggle<CR>
nmap <silent> <F5> :set invlist<CR>:set list?<CR>
nmap <silent> <F6> :set invwrap<CR>:set wrap?<CR>
nmap <silent> <F7> :set invhls<CR>:set hls?<CR>
nmap <silent> <F8> \C

" tabs
nnoremap  tt :tabnew<cr>

" splits
noremap ,v :vsp^<cr>
noremap ,h :split^<cr>

" CTags
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=.svn --exclude=log -R *<CR><CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Stupid shift key fixes

if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Stop using <Insert>
nnoremap <Insert> <nop>

" Stop using arrows
" noremap <Up> <nop>
" noremap <Down> <nop>
" noremap <Left> <nop>
" noremap <Right> <nop>

" double 'i' as escape
inoremap <silent> ii <ESC>
" double 'a' as escape
inoremap <silent> aa <ESC>
" turn off Escape
" inoremap <silent> <ESC> <nop>

" moving lines
nnoremap <C-DOWN> :m+<CR>==
nnoremap <C-UP> :m-2<CR>==
inoremap <C-DOWN> <Esc>:m+<CR>==gi
inoremap <C-UP> <Esc>:m-2<CR>==gi
vnoremap <C-DOWN> :m'>+<CR>gv=gv
vnoremap <C-UP> :m-2<CR>gv=gv

" expand path to file
map <leader>e :e ./
map <leader>ew :e <C-R>=expand("%:p:h") ."/"<CR>
map <leader>es :sp <C-R>=expand("%:p:h") ."/"<CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") ."/"<CR>
map <leader>et :tabe <C-R>=expand("%:p:h") ."/"<CR>

" cycle through buffers with <ALT><Left> and <ALT><Right>
nmap <M-Left> :bprev<CR>
nmap <M-Right> :bnext<CR>

" cycle tabs with <CTRL><Left> and <CTRL><Right>
nmap <C-Left> :tabprev<CR>
nmap <C-Right> :tabnext<CR>

" fast save, close etc
nmap <leader>w :w!<CR>
nmap <leader>q :x!<CR>
nmap <leader>a :q!<CR>
nmap <leader>o :only!<CR>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" nice hack for leader key in insert mode
inoremap <silent> \ <ESC>\
inoremap <silent> // \
