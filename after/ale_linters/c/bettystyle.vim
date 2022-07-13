" Author:Stevary  https://github.com/bstevary
" Description: Betty Style linter for c files

call ale#Set('c_bettystyle_executable', 'betty-style')
call ale#Set('c_bettystyle_options', '')

function! ale_linters#c#bettystyle#Handle(buffer, lines) abort
    " Matches patterns line the following:
    "
    " get_bit.c:21: WARNING: Missing a blank line after declarations
    let l:pattern = '^.*:\(\d\+\): \([a-zA-Z]\+\):\([a-zA-Z_]\+\): \(.\+\)$'
    let l:output = []
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'text': l:match[4],
        \   'code': l:match[3],
        \   'type': l:match[2] is? 'ERROR' ? 'E' : 'W',
        \})
    endfor
    return l:output
endfunction

function! ale_linters#c#bettystyle#GetCommand(buffer) abort
    let l:flags = ale#Pad(ale#Var(a:buffer, 'c_bettystyle_options'))
    return '%e %t --show-types' . l:flags
endfunctio

function! ale_linters#c#bettystyle#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'c_bettystyle_executable')
endfunctio

call ale#linter#Define('c', {
\   'name': 'betty-style',
\   'executable': function('ale_linters#c#bettystyle#GetExecutable'),
\   'command': function('ale_linters#c#bettystyle#GetCommand'),
\   'callback': 'ale_linters#c#bettystyle#Handle',
\})
