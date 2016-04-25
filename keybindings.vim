nnoremap <C-PageUp> :tabprev<CR>
nnoremap <C-PageDown> :tabnext<CR>
inoremap <C-PageUp> <Esc>:tabprev<CR>
inoremap <C-PageDown> <Esc>:tabnext<CR>
nnoremap <space>n :tabnext<CR>
nnoremap <space>p :tabprev<CR>

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>o o<Esc>k

nnoremap <c-g> <c-w>gf
nnoremap ; :

nnoremap / /\v
vnoremap / /\v

nnoremap <tab> %
vnoremap <tab> %

nnoremap <leader>a :Ack<Space>

"save as root
cmap w!! w !sudo tee % >/dev/null

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

nnoremap <C-Up><C-Up><C-Down><C-Down><C-Left><C-Right><C-Left><C-Right><C-b><C-a> :echo "STOP CHEATING!"<CR>

"change dir
nnoremap <leader>cd :cd %:p:h<CR>

"open file
nnoremap <leader>op :browse confirm e<CR> :cd %:p:h<CR> :echo 'Changing base directory'<CR>

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
nnoremap <leader>gp :!clear && echo "git push" && git push<CR>

"git pull
nnoremap <leader>gl :!clear && echo "git pull" && git pull<CR>

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

nnoremap <leader>gh :echo "GIT keybindings:\n\ngs: git status\nga: git add -i\ngg: git commit\ngp: git push\ngt: git tag\ngl: git pull"<CR>

fu! ShellExec()
  let cmd = input('$> ')
  if cmd == ''
    echo 'no command executed'
  else
    execute '!' . cmd
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

fu! RunCmd()
  let cmd = input('$> ')
  if cmd == ''
    echo 'no command'
  else
    :new
    :setlocal buftype=nofile
    execute ':read !'.cmd
    nnoremap <buffer><silent> q :q!<CR>
  endif
endfunction

nnoremap <space><space> :call RunCmd()<CR>

"Toggle Conceal
fu! ToggleConceal()
  if (&conceallevel == 0)
    set conceallevel=1
  else
    set conceallevel=0
  endif
endfunction

command! ToggleConceal call ToggleConceal()

nnoremap <F8> :ToggleConceal<CR>
inoremap <F8> <Esc>:ToggleConceal<CR>a


"npm run query
fu! RunQuery()
  let q = input('SQL> ')
  if q == ''
    echo 'no query'
  else
    :new
    :setlocal buftype=nofile
    execute ':read !npm run query -- "' .q .'"'
    nnoremap <buffer><silent> q :q!<CR>
  endif
endfunction

nnoremap <leader>q :call RunQuery()<CR>

