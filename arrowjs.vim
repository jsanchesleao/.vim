"Arrow Functions

fu! OpenArrowJS()
  silent! :%s /=>/➔/g
  execute 'normal! gg'
  imap => ➔
endfunction

fu! SaveArrowJS()
  execute 'normal! mx'
  silent! :%s /➔/=>/g
endfunction

fu! PostSaveArrowJS()
  silent! :%s /=>/➔/g
  execute 'normal! `x'
endfunction

:autocmd BufRead *.js call OpenArrowJS()
:autocmd BufWritePre *.js call SaveArrowJS()
:autocmd BufWritePost *.js call PostSaveArrowJS()
