" Better nav for omnicomplete
inoremap <expr> <TAB> ("\<C-n>")
inoremap <expr> <S-TAB> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
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
" nmap <silent> <F1> :NERDTreeToggle<CR>
inoremap <silent> <F1> <ESC>:NERDTreeToggle<CR>
nmap <silent> <F2> :set invlist<CR>:set list?<CR>
nmap <silent> <F3> :set invwrap<CR>:set wrap?<CR>
nmap <silent> <F4> :set invhls<CR>:set hls?<CR>

" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

nnoremap <silent> <F5> :call NumberToggle()<CR>

" moving lines
nnoremap <M-J> :m+<CR>==
nnoremap <M-K> :m-2<CR>==
inoremap <M-J> <Esc>:m+<CR>==gi
inoremap <M-K> <Esc>:m-2<CR>==gi
vnoremap <M-J> :m'>+<CR>gv=gv
vnoremap <M-K> :m-2<CR>gv=gv

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

nnoremap <silent> <S-J> :call GoToNextIndent(1)<CR>
nnoremap <silent> <S-K> :call GoToNextIndent(-1)<CR>

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

" You can't stop me
cmap w!! w !sudo tee %

" shift key fixes
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

inoremap { {<CR>}<up><end><CR>

inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction

nmap <space>e :CocCommand explorer <CR>
