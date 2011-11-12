set encoding=utf-8
filetype on
call pathogen#infect()
syntax on
filetype plugin indent on
set spelllang=en_gb
" set spell

" =========================================
" THEME
" =========================================

set nocompatible
syntax enable
set background=dark
colorscheme xoria256

" =========================================
" BASIC CONFIGURATION
" =========================================

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

" hide buffers when not displayed
set hidden
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backup    " Where backups will go.
set directory=~/.vim/tmp       " Where temporary files will go.

" indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" make uses real tabs
au FileType make set noexpandtab

" mouse settings
set mousehide

" set selectmode+=mouse
set mouse=a
set fo=1
set laststatus=2
set statusline=[%n]\ %<%f%m%r
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%w\<%{&fileformat}>%\=[%o]\ %l,%c%V\/%L\ \ %P

" =========================================
" BUFFER SETTINGS
" =========================================

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
au FileType python  set tabstop=2

" =========================================
" GUI SETTINGS
" =========================================

if has("gui_runnning")
  set guioptions=a
  set guioptions+=m
  "set guitablabel=%M%t
  set lines=30
  set columns=99
  "set guifont=Droid\ Sans\ Mono\ Dotted\ 10
  set guicursor=a:blinkon0
endif

" =========================================
" KEYBINDS
" =========================================

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
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=.svn --exclude=log -R *<CR><CR>

" Stupid shift key fixes
cmap WQ wq
cmap wQ wq
cmap Qa qa
cmap QA qa
cmap qA qa
cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Stop using <Insert>
nnoremap a <Insert>
nnoremap <Insert> <nop>

" Stop using arrows
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" double 'a' as escape
imap <silent> jj <ESC>

" moving lines
nnoremap <C-DOWN> :m+<CR>==
nnoremap <C-UP> :m-2<CR>==
inoremap <C-DOWN> <Esc>:m+<CR>==gi
inoremap <C-UP> <Esc>:m-2<CR>==gi
vnoremap <C-DOWN> :m'>+<CR>gv=gv
vnoremap <C-UP> :m-2<CR>gv=gv

" cycle through buffers with <ALT><Left> and <ALT><Right>
nmap <M-Left> :bprev<CR>
nmap <M-Right> :bnext<CR>

" cycle tabs with <CTRL><Left> and <CTRL><Right>
nmap <C-Left> :tabprev<CR>
nmap <C-Right> :tabnext<CR>

" =========================================
" PLUGINS
" =========================================

" gem-ctags
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      \ pathogen#split(&tags) +
      \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))


" gitv
nnoremap <C-g> :Gitv<CR>
inoremap <C-g> :Gitv<CR>
vnoremap <C-g> :Gitv<CR>

" syntastic - enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Taglist
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=1
let Tlist_Show_Menu=0
nnoremap <C-]> g<C-]>

" project
let $PROJECT_HOME='~/projects'
" use modeline overrides
set modeline
set modelines=10

" rgrep
map <C-f> :Rgrep<CR>
au FileType qf nmap <buffer> <cr> <cr><c-w><c-p>
let Grep_Skip_Files = '*.bak *~ *tags *.log'
let Grep_Skip_Dirs = '.git .svn'"

" =========================================
" OTHER HACKS
" =========================================

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" change current location
map <Leader>C :cd %:p:h<CR>

" Remove whitespaces on save
autocmd BufWritePre *.rb,*.py,*.c,*.h,*.feature,*.conf,*rc,*.yml,*.yaml,README,CHANGELOG,README.* :%s/\s\+$//e"

" Quick fix for Mac Os X Rgrep"
let s:os = system("uname")
if s:os =~ "Darwin"
  let g:Grep_Xargs_Options='-0'
endif
