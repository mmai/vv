let s:confpath = fnamemodify(expand('<sfile>'), ':h')
" let s:confpath = stdpath('config')

" Must be first
execute 'source' s:confpath.'/plugins.vim'

execute 'source' s:confpath.'/sidebar.vim'
execute 'source' s:confpath.'/base.vim'
execute 'source' s:confpath.'/behaviour.vim'
execute 'source' s:confpath.'/mappings.vim'
execute 'source' s:confpath.'/appearance.vim'
