let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 1

let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1

au BufRead,BufNewFile {*.hcl,*.nomad} set filetype=terraform
au BufNewFile,BufRead {*.hcl,*.nomad} TerraformFmt
au BufWritePre {*.hcl,*.nomad} TerraformFmt
