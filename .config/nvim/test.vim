let g:test#javascript#runner = 'jest'

" Node
" ------------------------------------------------------------------------------

" Test all
nnoremap <Leader>ta :terminal npm run test<cr>
nnoremap <Leader>tt :terminal npm run test -- %<cr>

" Eslint
nnoremap <Leader>ll :terminal npm run eslint<cr>
nnoremap <Leader>lc :terminal npm run eslint -- %<cr>
nnoremap <Leader>lf :terminal npm run eslint -- --fix<cr>

" Storybook
nnoremap <Leader>ss :terminal npm start<cr>

" ------------------------------------------------------------------------------

" Rust
autocmd FileType rust nnoremap <buffer> <leader>rr :terminal cargo run<esc>

" Python
autocmd FileType python nnoremap <buffer> <leader>rr :!python %<cr>

" Latex
autocmd FileType tex nnoremap <buffer> <leader>rr :!pdflatex -output-directory %:p:h %<cr>
autocmd FileType tex nnoremap <buffer> <leader>rb :!biber %:r<cr>

