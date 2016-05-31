let mapleader = ","
"set t_Co=256
"set guifont=Source\ Code\ Pro\ Medium\ 14
set guifont=Monospace\ 15
set number
set relativenumber

set concealcursor=nc
set colorcolumn=0

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
set splitbelow
set splitright

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml,jsx set listchars-=tab:>.
autocmd FocusLost * :wa

autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim

"Silent command
command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

source ~/.vim/keybindings.vim

"ctrl-p configuration:
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|elm-stuff|bower_components|out|target|compiled)$'

"easy motion config
nnoremap <Leader>l <Plug>(easymotion-lineforward)
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)
nnoremap <Leader>h <Plug>(easymotion-linebackward)

"easy editing of this file
nnoremap <Leader>ev :tabnew ~/.vim/init.vim<CR>
nnoremap <Leader>sv :source ~/.vim/init.vim<CR>

"vimux config
let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"
let g:VimuxPromptString = "tmux> "
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vx :VimuxInterruptRunner<CR>

"NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <C-U> :NERDTreeToggle<CR>

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


"BASH WINDOW
fu! BashWindow()
  :tabnew
  :setlocal buftype=nofile
  :file bash
  inoremap <silent><buffer> <CR> <Esc>yyGpO<Esc>j!!bash<CR>
  nnoremap <silent><buffer> <CR> yyGpO<Esc>j!!bash<CR>
  nnoremap <buffer> <C-l> ggdGa
  inoremap <buffer> <C-l> <Esc>ggdGa
  nnoremap <buffer> q :q!<CR>
  nnoremap <buffer> <C-G> <c-w>gf
  startinsert
endfunction

nnoremap <F3> :call BashWindow()<CR>


"AUTOMATIC MARKS
autocmd BufLeave *.css,*.less,*scss normal! mC
autocmd BufLeave *.html,*.jsx       normal! mH
autocmd BufLeave *.js               normal! mJ
autocmd BufLeave *.clj,*.cljs       normal! mL
autocmd BufLeave *.elm              normal! mE
autocmd BufLeave vimrc,*.vim        normal! mV

source ~/.vim/ideconfig.vim
