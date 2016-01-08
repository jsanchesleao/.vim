nnoremap <C-PageUp> :tabprev<CR>
nnoremap <C-PageDown> :tabnext<CR>

nnoremap ]ç i()<Esc>i
inoremap ]ç ()<Esc>i
nnoremap <leader>o o<Esc>k

"shift text selection
inoremap <S-Up> <Esc>v<Up>
inoremap <S-Left> <Esc>v<Left>
inoremap <S-Down> <Esc>v<Down>
inoremap <S-Right> <Esc>v<Right>
nnoremap <S-Up> v<Up>
nnoremap <S-Left> v<Left>
nnoremap <S-Down> v<Down>
nnoremap <S-Right> v<Right>
vnoremap <S-Up> <Up>
vnoremap <S-Left> <Left>
vnoremap <S-Down> <Down>
vnoremap <S-Right> <Right>

nnoremap <C-Up><C-Up><C-Down><C-Down><C-Left><C-Right><C-Left><C-Right><C-b><C-a><C-CR> :echo "STOP CHEATING!"<CR>

"change dir
nnoremap <leader>cd :cd %:p:h<CR>

"open file
nnoremap <leader>op :browse confirm e<CR> :cd %:p:h<CR> :echo 'Changing base directory'<CR>

"node please test
nnoremap <leader>npt :!clear && npm test<CR>

"node please start
nnoremap <leader>nps :!clear && npm start<CR>

"git status
nnoremap <leader>gs :!clear && git status<CR>

"git interactive mode
nnoremap <leader>ga :!clear && git add -i<CR>

"git commit
fu! GitCommit() 
  let bla = input('commit message: ')
  let command = '!git commit -m "' . bla . '"'
  if bla == ''
    echo 'commit aborted'
  else
    silent clear!
    execute command
  endif
endfunction

nnoremap <leader>gg :call GitCommit()<CR>

"git push
nnoremap <leader>gp :!clear && git push<CR>

"git tag
fu! GitTag() 
  let bla = input('tag name: ')
  let command = '!git tag ' . bla 
  if bla == ''
    echo 'tagging aborted'
  else
    silent clear!
    execute command
  endif
endfunction

nnoremap <leader>gt :call GitTag()<CR>

fu! ShellExec()
  let cmd = input('$>')
  if cmd == ''
    echo 'no command executed'
  else
    execute '!clear && ' . cmd
  endif
endfunction

nnoremap <leader><space> :call ShellExec()<CR>

fu! NpmRun()
  let cmd = input('npm run ')
  if cmd == ''
    echo 'no command executed'
  else
    execute '!clear && npm run ' . cmd
  endif
endfunction

nnoremap <leader>npm :call NpmRun()<CR>
