" Use ctrl-scroll up or down to "zoom" in or out on window under cursor.
" <c-N-ScrollWheelXXX> is how you deal with a fast sequence of incoming scroll operations.
" eg. see https://github.com/neovim/neovim/issues/6211

nnoremap <c-ScrollWheelUp> <cmd>call win_execute(getmousepos().winid, "resize +3")<CR>
nnoremap <c-ScrollWheelDown> <cmd>call win_execute(getmousepos().winid, "resize -3")<CR>
nnoremap <c-1-ScrollWheelUp> <cmd>call win_execute(getmousepos().winid, "resize +3")<CR>
nnoremap <c-1-ScrollWheelDown> <cmd>call win_execute(getmousepos().winid, "resize -3")<CR>
nnoremap <c-2-ScrollWheelUp> <cmd>call win_execute(getmousepos().winid, "resize +3")<CR>
nnoremap <c-2-ScrollWheelDown> <cmd>call win_execute(getmousepos().winid, "resize -3")<CR>
nnoremap <c-3-ScrollWheelUp> <cmd>call win_execute(getmousepos().winid, "resize +3")<CR>
nnoremap <c-3-ScrollWheelDown> <cmd>call win_execute(getmousepos().winid, "resize -3")<CR>
nnoremap <c-4-ScrollWheelUp> <cmd>call win_execute(getmousepos().winid, "resize +3")<CR>
nnoremap <c-4-ScrollWheelDown> <cmd>call win_execute(getmousepos().winid, "resize -3")<CR>
