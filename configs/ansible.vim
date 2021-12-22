" https://github.com/pearofducks/ansible-vim

au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END
