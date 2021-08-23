" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'scrooloose/NERDTree'

    " Plug 'jiangmiao/auto-pairs'
    Plug 'dracula/vim'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/rainbow_parentheses.vim'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    Plug 'mhinz/vim-startify'

    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/gv.vim'

    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-commentary'
    " Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sensible'
    Plug 'geekjuice/vim-spec'
    Plug 'Yggdroot/indentLine'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'sebdah/vim-delve'
    Plug 'hashivim/vim-hashicorp-tools'
    Plug 'mbbill/undotree'
    Plug 'mechatroner/rainbow_csv'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'vim-syntastic/syntastic'
    Plug 'vimwiki/vimwiki'
    " Plug 'juliosueiras/terraform-lsp'
    Plug 'honza/vim-snippets'
    Plug 'ryanoasis/vim-devicons'
    Plug 'machakann/vim-highlightedyank'
    Plug 'pearofducks/ansible-vim'
    Plug 'wincent/ferret'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    Plug 'hashivim/vim-terraform'

call plug#end()
