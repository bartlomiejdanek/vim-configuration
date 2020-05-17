set nocompatible
filetype off

let mapleader = "\<BS>"

language en_US.UTF-8
set encoding=utf8
set fileencoding=utf-8
set langmenu=en_US.UTF-8
set spelllang=en_gb
set termencoding=utf-8

syntax on sync minlines=100

set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode
set list
set nowrap
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.DS_Store,*.orig,*.*~
set clipboard+=unnamed
set clipboard=unnamedplus
set ruler
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set endofline
set number! relativenumber!
set linebreak
set showbreak=...
"set autowrite
"set autochdir
" set keymodel=startsel,stopsel
set ttyfast
set lcs=tab:\ \ ,eol:¬,trail:•,extends:»,precedes:«
set novisualbell
set noerrorbells
" set cinoptions=:0,p0,t0
" set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set foldmethod=manual
set switchbuf=usetab,newtab
set lazyredraw
set notimeout
set ttimeout
set ttimeoutlen=10
set complete=.,w,b,u,t,i
" set completeopt=longest,menuone,preview,noselect,noinsert

set completeopt=menuone,noinsert,noselect,longest

set undofile
set showtabline=1
au FocusLost * :silent! wall
au VimResized * :wincmd =
" set completeopt-=preview

augroup trailing
  au!
  au InsertEnter * :set listchars-=
      \eol:$,
      \tab:>-,
      \trail:⌴,
      \extends:>,
      \precedes:<
augroup END

set splitright
set splitbelow

set hidden
set nobackup                     " Enable creation of backup file.
set nowritebackup
set directory=./tmp              " Where temporary files will go.
set noswapfile

set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set fo=1
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set grepprg=rg
set inccommand=nosplit
set conceallevel=2

" You can't stop me
cmap w!! w !sudo tee %
