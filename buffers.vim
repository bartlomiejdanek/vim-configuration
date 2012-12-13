" =========================================
" BUFFER SETTINGS
" =========================================

" Capfile, Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" Make json highlight as javascript
au BufNewFile,BufRead *.json set ft=javascript

" Rdoc syntax
au BufNewFile,BufRead *.rdoc set ft=rdoc

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4
