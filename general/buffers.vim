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

autocmd FileType vimwiki set ft=markdown
autocmd InsertEnter * norm zz

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

au FocusLost * :silent! wall
au VimResized * :wincmd =

augroup trailing
  au!
  au InsertEnter * :set listchars-=
      \eol:$,
      \tab:>-,
      \trail:⌴,
      \extends:>,
      \precedes:<
augroup END
