source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/buffers.vim

" source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/dracula.vim

source $HOME/.config/nvim/keys/mappings.vim

source $HOME/.config/nvim/configs/coc.vim
source $HOME/.config/nvim/configs/editorconfig.vim
source $HOME/.config/nvim/configs/fzf.vim
source $HOME/.config/nvim/configs/quickscope.vim
source $HOME/.config/nvim/configs/rainbow.vim
source $HOME/.config/nvim/configs/rooter.vim
source $HOME/.config/nvim/configs/sneak.vim
source $HOME/.config/nvim/configs/start-screen.vim
source $HOME/.config/nvim/configs/synastic.vim
source $HOME/.config/nvim/configs/terraform.vim
source $HOME/.config/nvim/configs/vim-go.vim


set autoindent
set cindent
inoremap { {<CR>}<up><end><CR>

inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction


"status line
hi User1 ctermfg=grey guifg=#69697c guibg=#1b1b24
hi User2 ctermfg=red guifg=#ff66ff guibg=#1b1b24
hi User3 ctermfg=darkgrey guifg=#A843A8 guibg=#1b1b24
hi User4 ctermfg=magenta guifg=#A843A8 guibg=#1b1b24
set statusline=
set statusline=%2*%5l%*            "lines
set statusline+=%1*/%L:%*
set statusline+=%3*%-3v%*             "column
set statusline+=%1*%=
set statusline+=%4*\ %f\ %*            "path
set statusline+=%1*%=
set statusline+=%1*\ %{&ft}\ %{&encoding}\ %1*            "file info
set statusline+=%2*\%{StatuslineMode()}\ %*
set fillchars=stl:\-,stlnc:\-,fold:-,diff:-  "https://vimhelp.org/options.txt.html#%27fillchars%27

" statusline
function! CurrentMode()
  let l:mode = mode()

  if l:mode==#"n"
    return "N"
  elseif l:mode==?"v"
    return "V"
  elseif l:mode==?"V"
    return "V"
  elseif l:mode==#"i"
    return "I"
  elseif l:mode==#"R"
    return "R"
  elseif l:mode==#"Ctrl-V"
    return "B"
  endif
endfunction

function! StatuslineMode()
  let l:mode = CurrentMode()

  return '['.l:mode.']'
endfunction
