
" ----------- Tags bar
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']

" Autopair for vim type : don't close the comment string '"'
augroup autopair
  au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}
augroup END

" --------------- Formating

" Tabulation (defaults from base.vim : 2 spaces)
augroup tabulation_languages
  autocmd Filetype python setlocal ts=4 sts=4 sw=4
  autocmd Filetype html setlocal ts=2 sts=2 sw=2
augroup END
