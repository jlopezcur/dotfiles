let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS='--reverse'

" The Silver Searcher as the main grep tool
if executable('rg')
  set grepprg=rg\ --nogroup\ --nocolor
endif

" bind \ (backward slash) to grep shortcut
nnoremap <Leader>º :Rg<space>

nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
" nnoremap <Leader>g :BCommits<CR>
" nnoremap <Leader>v :GFiles?<CR>

nnoremap <Leader>d :CocFzfList diagnostics<CR>
nnoremap <Leader>o :CocFzfList outline<CR>
nnoremap <Leader>y :CocFzfList yank<CR>

