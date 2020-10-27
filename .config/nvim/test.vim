let g:test#javascript#runner = 'jest'

" Test all
nnoremap <Leader>ta :terminal npm run test<cr>
nnoremap <Leader>tt :terminal npm run test -- %<cr>

" Eslint
nnoremap <Leader>ll :terminal npm run eslint<cr>
nnoremap <Leader>lc :terminal npm run eslint -- %<cr>
nnoremap <Leader>lf :terminal npm run eslint -- --fix<cr>

" Storybook
nnoremap <Leader>ss :terminal npm start<cr>

