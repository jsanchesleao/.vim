nnoremap <S-Left> :tabprev<CR>
nnoremap <S-Right> :tabnext<CR>

nnoremap lp i()<Esc>i
nnoremap <leader>o o<Esc>k

"change dir
nnoremap <leader> :cd %:p:h<CR>

"open file
nnoremap <leader>op :browse confirm e<CR> :cd %:p:h<CR> :echo 'Changing base directory'<CR>

"node please test
nnoremap npt :!clear && npm test<CR>

"node please start
nnoremap nps :!clear && npm start<CR>

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

fu! MarkFly()
  let c = '!curl -X POST -d "' . expand('%:f:g')  . '" http://localhost:8494/file'
  silent! c
  redraw!
endfunction

fu! Ahkmed()
  execute 'normal! mab"zyw`a'
  if @z == 'silenc'
    execute 'normal! ae I KILL YOU!'
  else
    execute 'normal! ae'
  endif
endfunction

inoremap e <Esc>:call Ahkmed()<CR>a
