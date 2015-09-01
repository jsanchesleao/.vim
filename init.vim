let mapleader = ","
set t_Co=256

"tabs
set expandtab
set shiftwidth=2
set softtabstop=2

source ~/.vim/keybindings.vim
source ~/.vim/arrowjs.vim

fu! Mkf() 
  :silent exec '!markfly ' . expand('%:p') . '&'
  :redraw!
endfunction


"ctrl-p configuration:
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|bower_components|out|target|compiled)$'

"easy motion config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"easy editing of this file
nmap <Leader>ev :tabnew ~/.vim/init.vim<CR>
nmap <Leader>sv :source ~/.vim/init.vim<CR>

"NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-U> :NERDTreeToggle<CR>

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

execute pathogen#infect()
syntax on
filetype plugin indent on

let g:solarized_termcolors=256
colorscheme solarized
set background=light
