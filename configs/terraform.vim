let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

au BufNewFile,BufRead {*.hcl,*.nomad} call terraform#fmt()
au BufWritePre {*.hcl,*.nomad} call terraform#fmt()
