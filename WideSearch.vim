" Multi buffer search

" :Ds <pattern>
" ^N^N for next match
" ^B^B for previous match
" ^V^V to search for word under cursor

" Probably better implemented using quick-fix. Vim probably
" already does this anyway, I just don't know how.

" Works better if you start vim by preloading your entire project into
" buffers.

function! WideSearchForward(target)
  let g:globaltarget = a:target
  let b = bufnr('%')
  let c = -1
  let n = search(a:target, "W")
  while n == 0 && b != c
    bnext
    let pos = getcurpos()
    let r = cursor(1, 1)
    let c = bufnr('%')
    let n = search(a:target)
    if n == 0
      let r = cursor(pos[1], pos[2])
    endif
  endwhile
endfun

function! WideSearchBackwards(target)
  let g:globaltarget = a:target
  let b = bufnr('%')
  let c = -1
  let n = search(a:target, "Wb")
  while n == 0 && b != c
    bprevious
    let pos = getcurpos()
    let r = cursor(1000000, 1)
    let c = bufnr('%')
    let n = search(a:target, "b")
    if n == 0
      let r = cursor(pos[1], pos[2])
    endif
  endwhile
endfun

command! -nargs=1 Ds call WideSearchForward(<f-args>)
command! -nargs=0 Ns call WideSearchForward(g:globaltarget)
command! -nargs=0 Ps call WideSearchBackwards(g:globaltarget)
command! -nargs=0 Ss call WideSearchForward(expand('<cword>'))

:nmap <c-N><c-N> :Ns
:nmap <c-B><c-B> :Ps
:nmap <c-V><c-V> :Ss
