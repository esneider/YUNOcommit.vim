
let s:max_writes = get(g:, 'YUNOcommit_max', 2)

let s:writes_since_commit = {}

function! s:checkCommits()

    let writes = get(s:writes_since_commit, @%, 0) + 1

    if writes > s:max_writes
        let writes = 0
        echohl Todo
        echo "Y U NO commit?????"
        echohl None
    endif

    let s:writes_since_commit[@%] = writes
endf

augroup YUNOcommit
    autocmd!
    autocmd BufWritePost * call s:checkCommits()
augroup END
