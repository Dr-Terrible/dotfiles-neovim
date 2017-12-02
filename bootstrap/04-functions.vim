" Functions
" ==============================================================================

function! StripTrailingWhitespaces()
	if &modifiable
		let l:l = line(".")
		let l:c = col(".")
		%s/\s\+$//e
		call cursor(l:l, l:c)
	endif
endfunction

" Unix Dos Conversion
function! Dos2Unix()
	execute 'update | e ++ff=dos | setlocal ff=unix'
	silent %s/\r//ge
	execute 'w'
endfunction

function! Unix2Dos()
	execute 'update | e ++ff=dos | w'
endfunction

" Shell command {
function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %

function! Cond(cond, ...)
	let opts = get(a:000, 0, {})
	return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction