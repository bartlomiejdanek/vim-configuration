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

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" " Use preset argument to open it
" nmap <space>ed :CocCommand explorer --preset .vim<CR>
" nmap <space>ef :CocCommand explorer --preset floating<CR>
" nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
" nmap <space>eb :CocCommand explorer --preset buffer<CR>
nmap <silent> <F1> :CocCommand explorer --toggle --sources=buffer+,file+ --preset floating<CR>

" List all presets
" nmap <space>el :CocList explPresets<CR>
