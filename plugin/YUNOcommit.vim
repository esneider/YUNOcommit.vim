let s:max_writes = get(g:, 'YUNOcommit_after', 20)

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
        redraw
        echo 'Y U NO COMMIT !!!!!!!!????????????'
        echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'
        echo '░░░░░░░░░░░░▄▄▄█▀▀▀▀▀▀▄▄▄░░░░░░░░░'
        echo '░░░░░░░░░▄█▀▀░░░░░░░░░░░▀▀█▄▄░░░░░'
        echo '░░░░░░░▄█▀░░░░░░▄▄▄░░░░░░░░▄▀█▄░░░'
        echo '░░░░░░░█░░░░░░░░░░▀▀▄░░░░▄▀▀░░░█▄░'
        echo '░░░░░░█░░░░░░░░░▄█▀▀▀█▄░▄█▀▀▀█▄░▀▄'
        echo '░░░░░█░░░░░░░░░░██░▀░██░██░▀░██░░█'
        echo '░░░░░█░░░░░░░░░░▀█████▀░▀█████▀░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░░▄░░░░█░░░░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░░██▀▀▀▀█░░░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░█░▄▀▄▄▄▀░░░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░▄█▀▀▀▀▄░░░░░█'
        echo '░░░░░█▄░░░░░░░░░░░░░░█▄█▄█▄█░░░░░█'
        echo '░░░░░░█▄░░░░░░░░░░░░▄▀█████▀░░░░▄▀'
        echo '░░░░░░▄█▄░░░░░░░░░░░░░░░░░░░░░▄█▀░'
        echo '░░░░▄█▀▄░░▀▄▄░░▄▄░░░░░░░▀▀▀▄▄▀▀░░░'
        echo '░░▄█▀░░░▀▄░░░▀▀▀██▄▄▄▄▄▄█▀▀░░░░▄▄░'
        echo '▄▀░░░░░░░░█░░░░░░░▄█▀▄░▄▄▄░░░░▀██▀'
        echo '▀░░░░░░░░░░█▄░░░░▄█▄▄▄█████▄▄▄▀▀░░'
        echo '░░░░░░░░░░░░░▀▀▀█▀▀▀▀▀░▀██▀░░░░░░░'
        echo '░░░░░░░░░░░░░░░▄▀░░░░░░░░░░░░░░░░░'
        echohl None
    endif

    if s:branch !~# '^fatal'
        let s:writes = s:writes + 1
    endif
endf

augroup YUNOcommit
    autocmd!
    autocmd BufWritePost * call s:checkCommits()
augroup END

