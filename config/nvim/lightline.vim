" colorscheme could be
" - monokai_pro
" - gruvbox_material

let g:lightline = {
  \ 'colorscheme': 'gruvbox_material',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo', 'cocstatus', 'currentfunction' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'filename': 'FilenameForLightline'
  \ },
  \ }

" command! LightlineReload call LightlineReload()

" if ! exists("LightlineReload")
"   function! LightlineReload()
"     call lightline#init()
"     call lightline#colorscheme()
"     call lightline#update()
"   endfunction
" endif

if ! exists("FilenameForLightline")
  function! FilenameForLightline()
    return @%
  endfunction
endif

" if ! exists("CocCurrentFunction")
"   function! CocCurrentFunction()
"     return get(b:, 'coc_current_function', '')
"   endfunction
" endif

