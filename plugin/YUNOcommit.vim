let s:max_writes = get(g:, 'YUNOcommit_max', 20)

let s:branch = ''
let s:commit = ''
let s:writes = 0

function! s:checkCommits()

    let branch = system('git rev-parse --abbrev-ref HEAD')
    let commit = system('git rev-parse --verify HEAD')

    if s:branch !=# branch || s:commit !=# commit
        let s:writes = 0
    endif

    let s:branch = branch
    let s:commit = commit

    if s:writes >= s:max_writes
        let s:writes = 0
        echohl Todo
        echo "Y U NO commit?????"
        echohl None
    endif

    let s:writes = s:writes + 1
endf

augroup YUNOcommit
    autocmd!
    autocmd BufWritePost * call s:checkCommits()
augroup END

