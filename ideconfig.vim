let s:ide_mappings = {}

"Tmux functions
function! TRun(t, c)
  execute ':Silent tmux send-keys -t ' . a:t . ' "' . a:c . '" Enter'
endfunction

function! TPrompt(t)
  let cmd = input(a:t . '$ ')
  call TRun(a:t, cmd)
endfunction

"IDE functions
function! IDEAddMapping(m, t, c)
  let s:ide_mappings[a:m] = {'target': a:t, 'cmd': a:c}
endfunction

function! IDEShowMappings()
  echo s:ide_mappings
endfunction

function! IDEBind(key, target, cmd)
  execute ':nnoremap ' . a:key . ' :call TRun(''' . a:target . ''', ''' . a:cmd. ''') <CR>'
endfunction

function! IDERebind()
  for binding in items(s:ide_mappings)
    call IDEBind(binding[0], binding[1].target, binding[1].cmd)
  endfor
endfunction

function! IDEAskMapping()
  echo 'Registering TMUX mapping:'
  let target = input('Enter tmux target: ')
  if target == ''
    echo 'invalid target.'
    return
  endif

  let cmd = input('Enter command: ')
  if cmd == ''
    echo 'invalid command.'
    return
  endif

  let binding = input('Enter key mapping: ')
  if binding == ''
    echo 'invalid key mapping'
    return
  endif

  call IDEAddMapping(binding, target, cmd)
  call IDERebind()
endfunction

call IDEAddMapping('<c-b>', 'dev:0.1', 'ls')
call IDERebind()

command! -nargs=* TRun call TRun(<f-args>)
command! -nargs=1 TPrompt call TPrompt(<f-args>)
command! IDEAskMapping :call IDEAskMapping()

nnoremap <leader>t :IDEAskMapping<CR>

