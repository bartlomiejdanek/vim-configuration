" Load OS config file for 'os' directory
let s:os = system("uname")
if s:os =~ "Darwin"
  so ~/.vim/os/darwin.vim
else
  so ~/.vim/os/linux.vim
endif
