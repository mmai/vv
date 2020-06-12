let g:vvconfpath = fnamemodify(expand('<sfile>'), ':h')
set nocompatible

" /!\  Conflicts resolution
let g:AutoPairsShortcutToggle = '' " Disable shortcut <M-p> (conflict with yankstack)

" Must be before other imports
execute 'source' g:vvconfpath.'/plugins.vim'

if $VIMCONF == 'debug'
else
  execute 'source' g:vvconfpath.'/base.vim'
  execute 'source' g:vvconfpath.'/behaviour.vim'
  execute 'source' g:vvconfpath.'/appearance.vim'
  execute 'source' g:vvconfpath.'/sidebar.vim'
  execute 'source' g:vvconfpath.'/coding.vim'
  execute 'source' g:vvconfpath.'/writing.vim'
  execute 'source' g:vvconfpath.'/mappings.vim'
end
