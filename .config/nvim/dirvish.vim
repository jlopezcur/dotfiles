function! FloatingDirvish()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let winheight = winheight(0)
  let winwidth = winwidth(0)

  let width = float2nr(winwidth-(winwidth*2/10))

  let opts = {
    \ 'relative': 'editor',
    \ 'row': &lines - 3,
    \ 'col': float2nr((winwidth-width)/2),
    \ 'width': width,
    \ 'height': &lines - 3
    \ }

  call nvim_open_win(buf, v:true, opts)
  " call execute(':Dirvish %')
endfunction

" function! RelativeDirvish()
"   bufexists(expand('%')) ? "\:Dirvish %<CR>" : ":\Dirvish<CR>"
" endfunction

nnoremap <silent> <expr> <space>e bufexists(expand('%')) ? "\:Dirvish %<CR>" : ":\Dirvish<CR>"
nnoremap <silent> <expr> <space>w bufexists(expand('%')) ? "\:Dirvish %<CR>" : ":\Dirvish<CR>"

