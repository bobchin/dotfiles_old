
" PHP Lint
function PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction

nmap ,l :call PHPLint()<CR>




