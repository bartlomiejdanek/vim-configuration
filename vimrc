set encoding=utf-8

set termencoding=utf-8
filetype on
call pathogen#infect()
syntax on
filetype plugin indent on
set spelllang=en_gb
" set spell

" =========================================
" THEME
" =========================================

set t_Co=256
set nocompatible
set cursorline

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
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.DS_Store,*.orig
set clipboard+=unnamed
set ruler

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

set number
set linebreak
set showbreak=...
"set autowrite
"set autochdir
set keymodel=startsel,stopsel
set ttyfast
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell
set noerrorbells
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set foldmethod=manual
set switchbuf=usetab,newtab
set lazyredraw

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
augroup END
" split settings
set splitright
set splitbelow

" hide buffers when not displayed
set hidden
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backup    " Where backups will go.
set directory=~/.vim/tmp       " Where temporary files will go.
set noswapfile

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
set statusline+=%{fugitive#statusline()}%=
set statusline+=%w\ <%{&fileformat}>%\=\ [%o]\ %l,%c%V\/%L\ \ %P

let g:Powerline_symbols = 'fancy'

so ~/.vim/os.vim
so ~/.vim/plugins.vim
so ~/.vim/keybinds.vim
so ~/.vim/colorscheme.vim

" VAM
fun! EnsureVamIsOnDisk(plugin_root_dir)
  let vam_autoload_dir = a:plugin_root_dir.'/vim-addon-manager/autoload'
  if isdirectory(vam_autoload_dir)
    return 1
  else
    if 1 == confirm("Clone VAM into ".a:plugin_root_dir."?","&Y\n&N")
      " I'm sorry having to add this reminder. Eventually it'll pay off.
      call confirm("Remind yourself that most plugins ship with ".
            \"documentation (README*, doc/*.txt). It is your ".
            \"first source of knowledge. If you can't find ".
            \"the info you're looking for in reasonable ".
            \"time ask maintainers to improve documentation")
      call mkdir(a:plugin_root_dir, 'p')
      execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.
            \       shellescape(a:plugin_root_dir, 1).'/vim-addon-manager'
      " VAM runs helptags automatically when you install or update
      " plugins
      exec 'helptags '.fnameescape(a:plugin_root_dir.'/vim-addon-manager/doc')
    endif
    return isdirectory(vam_autoload_dir)
  endif
endfun

fun! SetupVAM()
  " VAM install location:
  let plugin_root_dir = expand('$HOME/.vim/bundle')
  if !EnsureVamIsOnDisk(plugin_root_dir)
    echohl ErrorMsg | echomsg "No VAM found!" | echohl NONE
    return
  endif
  let &rtp.=(empty(&rtp)?'':',').plugin_root_dir.'/vim-addon-manager'

  " Tell VAM which plugins to fetch & load:
  call vam#ActivateAddons([], {'auto_install' : 1})
  " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})

endfun
call SetupVAM()

set runtimepath+=~/.vim/bundle/vim-addon-manager
call vam#ActivateAddons(["Dart", "Gundo", "Haml", "Tabular", "The_NERD_tree", "Vim_Rspec", "ZenCoding", "afterimage",
      \ "apidock", "bundler%3207", "commentary", "endwise", "fugitive", "git-vim", "gitv", "html5", "javascript%1747",
      \ "ragtag", "rails", "rake", "rfc5424", "ruby-matchit", "Syntastic", "unimpaired",
      \ "vim-addon-mw-utils", "vim-coffee-script", "vimlatex", "vim-ruby", "vim-rvm", "grep", "xterm-color-table",
      \ "surround", "repeat", "buffet", "taglist-plus", "Solarized", "SuperTab%1643", "hybrid", "Powerline",
      \ "Tail_Bundle", "snipmate-snippets", "vim-addon-sql", "qfnotes", "Auto_Pairs", "ctrlp"], {'auto_install': 1})
