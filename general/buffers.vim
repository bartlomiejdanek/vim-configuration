"=========================================
" BUFFER SETTINGS
" =========================================

" Capfile, Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile} set ft=ruby

augroup LargeFile
  let g:large_file = 10485760 " 10MB

  " Set options:
  "   eventignore+=FileType (no syntax highlighting etc
  "   assumes FileType always on)
  "   noswapfile (save copy of file)
  "   bufhidden=unload (save memory when other file is viewed)
  "   buftype=nowritefile (is read-only)
  "   undolevels=-1 (no undo possible)
  au BufReadPre *
        \ let f=expand("<afile>") |
        \ if getfsize(f) > g:large_file |
        \ set eventignore+=FileType |
        \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
        \ else |
        \ set eventignore-=FileType |
        \ endif
augroup END

" make uses real tabs
au FileType make set noexpandtab

" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType vimwiki set ft=markdown
autocmd InsertEnter * norm zz
set splitbelow splitright

" Remember last location in file
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
