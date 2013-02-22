" =========================================
" PLUGINS
" =========================================

" supertab
let g:SuperTabCrMapping = 0
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" gem-ctags
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      \ pathogen#split(&tags) +
      \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

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
let Grep_Skip_Files = '*.bak *~ *tags *.log *.orig'
let Grep_Skip_Dirs = '.git .svn'"

" " PowerLine
let g:Powerline_symbols = 'fancy'

" =========================================
" OTHER HACKS
" =========================================

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" Autoreload VIM config
if has("autocmd")
  autocmd BufWritePost *vimrc source $MYVIMRC
endif

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

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
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

" Gundo
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"

"The_NERD_tree
augroup ps_nerdtree
    au!
    au Filetype nerdtree setlocal nolist
    " au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'

" Ctrlp
map <leader>t :CtrlPMixed<CR>
let g:ctrlp_max_files = 0

"Colorizer
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,scss,sass'
let g:colorizer_skip_comments = 1
let g:colorizer_colornames = 0

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" RVM
autocmd BufEnter * Rvm
