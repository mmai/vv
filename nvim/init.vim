let g:vvconfpath = fnamemodify(expand('<sfile>'), ':h')

" Must be first
execute 'source' g:vvconfpath.'/plugins.vim'

execute 'source' g:vvconfpath.'/sidebar.vim'
execute 'source' g:vvconfpath.'/base.vim'
execute 'source' g:vvconfpath.'/behaviour.vim'
execute 'source' g:vvconfpath.'/mappings.vim'
execute 'source' g:vvconfpath.'/appearance.vim'
