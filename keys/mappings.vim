" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bn<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bp<CR>

map <leader>d :bd<cr>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"f# keys
nmap <silent> <F1> :NERDTreeToggle<CR>
inoremap <silent> <F1> <ESC>:NERDTreeToggle<CR>
nmap <silent> <F2> :set invlist<CR>:set list?<CR>
nmap <silent> <F3> :set invwrap<CR>:set wrap?<CR>
nmap <silent> <F4> :set invhls<CR>:set hls?<CR>

" moving lines
nnoremap <S-j> :m+<CR>==
nnoremap <S-k> :m-2<CR>==
inoremap <S-j> <Esc>:m+<CR>==gi
inoremap <S-k> <Esc>:m-2<CR>==gi
vnoremap <S-j> :m'>+<CR>gv=gv
vnoremap <S-k> :m-2<CR>gv=gv

" expand path to file
map <leader>e :e .
map <leader>ew :e <C-R>=expand("%:p:h") ."/"<CR>
map <leader>es :sp <C-R>=expand("%:p:h") ."/"<CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") ."/"<CR>
map <leader>et :tabe <C-R>=expand("%:p:h") ."/"<CR>

" Fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>

" enter command trick
nnoremap ; :

" vim-easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

function! GoToNextIndent(inc)
  " Get the cursor current position
  let currentPos = getpos('.')
  let currentLine = currentPos[1]
  let matchIndent = 0

  " Look for a line with the same indent level whithout going out of the buffer
  while !matchIndent && currentLine != line('$') + 1 && currentLine != -1
    let currentLine += a:inc
    let matchIndent = indent(currentLine) == indent('.')
  endwhile

  " If a line is found go to this line
  if (matchIndent)
    let currentPos[1] = currentLine
    call setpos('.', currentPos)
  endif
endfunction

nnoremap <silent> <C-j> :call GoToNextIndent(1)<CR>
nnoremap <silent> <C-k> :call GoToNextIndent(-1)<CR>

nnoremap k kzz
nnoremap j jzz
nnoremap p pzz
nnoremap P Pzz
nnoremap G Gzz
nnoremap x xzz
inoremap <ESC> <ESC>zz
noremap n nzz
noremap N Nzz
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz
nnoremap o o<ESC>zza
nnoremap O O<ESC>zza
nnoremap a a<ESC>zza

function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')
inoremap <expr> < ConditionalPairMap('<', '>')
