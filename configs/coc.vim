" " autocomplete
" function! UnifiedJumpToDefinition()
"   if CocAction('jumpDefinition') == v:true
"     echomsg 'coc'
"   else
"     echomsg 'find'
"     execute "normal gf"
"   endif
" endfunction

" function! s:isWhitespaceOrNothingBeforeCursor() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" inoremap <expr><C-j>   pumvisible() ? "\<C-n>" : coc#refresh()
" inoremap <expr><C-k>   pumvisible() ? "\<C-p>" : coc#refresh()
" vmap <C-e> <Plug>(coc-snippets-select)


" let g:coc_snippet_next = '<tab>'
" let g:coc_snippet_prev = '<s-tab>'

" imap <expr><C-e>
"       \ coc#expandableOrJumpable() ?
"       \ "\<Plug>(coc-snippets-expand-jump)" :
"       \ "\<Plug>(emmet-expand-abbr)"


" " inoremap <silent><expr> <TAB>
" "       \ pumvisible() ? coc#_select_confirm() :
" "       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
" "       \ <SID>isWhitespaceOrNothingBeforeCursor() ? "\<TAB>" : '\<C-n>'

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" =============================


" autocomplete
function! UnifiedJumpToDefinition()
  if CocAction('jumpDefinition') == v:true
    echomsg 'coc'
  else
    echomsg 'find'
    execute "normal gf"
  endif
endfunction
function! s:isWhitespaceOrNothingBeforeCursor() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><C-j>   pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <expr><C-k>   pumvisible() ? "\<C-p>" : coc#refresh()
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
imap <expr><C-e>
      \ coc#expandableOrJumpable() ?
      \ "\<Plug>(coc-snippets-expand-jump)" :
      \ "\<Plug>(emmet-expand-abbr)"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>isWhitespaceOrNothingBeforeCursor() ? "\<TAB>" : "\<C-n>"
