" Author: Stevary https://github.com/bstevary
" Description: Betty doc linter for c files

call ale#Set('c_bettydoc_executable', 'betty-doc')
call ale#Set('c_bettydoc_options', '')

function! ale_linters#c#bettydoc#Handle(buffer, lines) abort
    " Matches patterns line the following:
    "
    " /tmp/vCaHuRM/3/main.c:9: warning: No description found for return value of 'main'
    let l:pattern = '^.*:\(\d\+\): \([a-zA-Z]\+\): \(.\+\)$'
    let l:output = []
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'type': l:match[2] is? 'error' ? 'E' : 'W',
        \   'text': l:match[3],
        \})
    endfor
    return l:output
endfunction

function! ale_linters#c#bettydoc#GetCommand(buffer) abort
    let l:flags = ale#Pad(ale#Var(a:buffer, 'c_bettydoc_options'))
    return "%e %t" . l:flags
endfunctio

function! ale_linters#c#bettydoc#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'c_bettydoc_executable')
endfunctio

call ale#linter#Define('c', {
\   'name': 'betty-doc',
\   'executable': function('ale_linters#c#bettydoc#GetExecutable'),
\   'command': function('ale_linters#c#bettydoc#GetCommand'),
\   'callback': 'ale_linters#c#bettydoc#Handle',
\   'output_stream': 'stderr'
\})
