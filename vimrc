set encoding=utf-8
filetype on
filetype plugin indent on
syntax on

" turn on manager for vim plugins
call pathogen#runtime_append_all_bundles()

call pathogen#helptags()

set spelllang=pl

set nocompatible
set t_Co=256
colorscheme xoria256

set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set nowrap
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set clipboard+=unnamed
set ruler

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

set number
"set autowrite
"set autochdir
set keymodel=startsel,stopsel
set timeoutlen=250
set ttyfast
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell
set noerrorbells
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set foldmethod=manual

"hide buffers when not displayed
set hidden
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backup    " Where backups will go.
set directory=~/.vim/tmp       " Where temporary files will go.

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"mouse settings
set mouse=a
set mousehide
set fo=1
set laststatus=2
set statusline=[%n]\ %<%f%m%r
set statusline+=\ [%{GitBranch()}]
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%w\ %y\ <%{&fileformat}>%\=[%o]\ %l,%c%V\/%L\ \ %P

" Command-T configuration
let g:CommandTMaxHeight=20
"let g:CommandTMatchWindowAtTop=1


"
" key binds
"

" mapping for navigation
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
nmap <Down> gj
nmap <Up> gk

" enter fix
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" copy paste
vnoremap <C-C> "+y
inoremap <C-V> <ESC>"+gPi

" duplicate current line
nnoremap <C-d> Yp
" paste to current line
"noremap p P

"f# keys
nmap <silent> <F2> :set invpaste<CR>:set paste?<CR>
nmap <silent> <F3> :set invlist<CR>:set list?<CR>
nmap <silent> <F4> :set invwrap<CR>:set wrap?<CR>
nmap <silent> <F5> :set invhls<CR>:set hls?<CR>
nmap <silent> <F6> :TlistToggle<CR>
let NERDTreeIgnore=['\.rbc$', '\~$']
nmap <silent> <F7> :NERDTreeToggle<cr>
nmap <silent> <F8> :shell<cr>
nmap <silent> <F9> :Project<CR>
nmap <silent> <F12> \C

" select all text - doesn't work with tmux
map <C-a> ggVG
" fix file indent
map <C-Z> gg=G

" tabs
nnoremap  tt :tabnew<cr>

" splits
noremap ,v :vsp^<cr>
noremap ,h :split^<cr>

" CTags
map <Leader>rt :!ctags --extra=+f -R --exclude=.svn --exclude=.git --exclude=log *<CR><CR>

" ConqueTerm wrapper
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \
endfunction

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" Command-e for ConqueTerm
map <Leader>x :call StartTerm()<CR>

" change to tab #
map 1 :tabn 1<CR>
map 2 :tabn 2<CR>
map 3 :tabn 3<CR>
map 4 :tabn 4<CR>
map 5 :tabn 5<CR>
map 6 :tabn 6<CR>
map 7 :tabn 7<CR>
map 8 :tabn 8<CR>
map 9 :tabn 9<CR>

" Stop using <Insert>
nnoremap a <Insert>
nnoremap <Insert> \

" double 'a' as escape
imap <silent> aa <ESC>

" moving lines
nnoremap <C-DOWN> :m+<CR>==
nnoremap <C-UP> :m-2<CR>==
inoremap <C-DOWN> <Esc>:m+<CR>==gi
inoremap <C-UP> <Esc>:m-2<CR>==gi
vnoremap <C-DOWN> :m'>+<CR>gv=gv
vnoremap <C-UP> :m-2<CR>gv=gv

" NERDCommenter
" invert comment
map <C-x> \ci

" RGrep
map <C-f> :Rgrep<CR>
au FileType qf nmap <buffer> <cr> <cr><c-w><c-p>
let Grep_Skip_Files = '*.bak *~ *tags'
let Grep_Skip_Dirs = '.git .svn'

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" Gitv
nnoremap <C-g> :Gitv<CR>
inoremap <C-g> :Gitv<CR>
vnoremap <C-g> :Gitv<CR>

" cycle through buffers with <ALT><Left> and <ALT><Right>
:nmap <M-Left> :bprev<CR>
:nmap <M-Right> :bnext<CR>

" make uses real tabs
au FileType make set noexpandtab

" Capfile, Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" Make json highlight as javascript
au BufNewFile,BufRead *.json set ft=javascript

" Rdoc syntax
au BufNewFile,BufRead *.rdoc set ft=rdoc

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" gnome command line hacks ;)
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape iblock"
endif

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Taglist
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=1
let Tlist_Show_Menu=0
nnoremap <C-]> g<C-]>

"nnoremap <C-TAB> <C-x><C-w>

" Project
let $PROJECT_HOME='~/projects'
" Use modeline overrides
set modeline
set modelines=10

" Trailing whitespace remove on save
autocmd BufWritePre *.rb,*.py,*.c,*.h,*.feature,*.conf,*rc,README,CHANGELOG,README.* :%s/\s\+$//e

function MyTagContext()
  if filereadable(expand('%:p:h') . '/tags')
    return "\<c-x>\<c-]>"
  endif
  " no return will result in the evaluation of the next
  " configured context
endfunction

let g:SuperTabCompletionContexts = ['MyTagContext', 's:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

function! Find(name)
  let l:list=system("find . -name '".a:name."' | grep -v \".svn/\" | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")
