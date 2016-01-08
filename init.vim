let mapleader = ","
set t_Co=256
set guifont=Source\ Code\ Pro\ Medium\ 14
set number
set relativenumber

"tabs
set expandtab
set shiftwidth=2
set softtabstop=2

set backspace=indent,eol,start
set incsearch
set nobackup
set noswapfile
set pastetoggle=<F2>

set ignorecase
set smartcase
set colorcolumn=85

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml,jsx set listchars-=tab:>.
autocmd FocusLost * :wa

autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim

source ~/.vim/keybindings.vim

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
colorscheme vendetta
set background=light

"rainbow parentheses

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
