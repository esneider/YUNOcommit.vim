
let s:writes_since_commit = {}

function! s:checkCommits(file)

    echomsg 'hey ' . a:file
endf

augroup YUNOcommit
    autocmd!
    autocmd BufWritePost * call s:checkCommits('<afile>')
augroup END
