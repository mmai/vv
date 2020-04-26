" top10, top20... : if i have to choose only 10, 20,.. plugins

call plug#begin(stdpath('data').'/plugged')

Plug 'mhinz/vim-startify' " - Fancy start screen with links to recent files

" Navigation
Plug 'tpope/vim-vinegar' " top10 - Enhance netrw (vim default file browser)
" --- defx
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } " top10 - sidebar file browser
Plug 'kristijanhusak/defx-icons' " top10 - dev icons for defx
Plug 'kristijanhusak/defx-git' " top10 - git status for defx
" --- lf
Plug 'rbgrouleff/bclose.vim' " needed by ptzz/lf.vim
Plug 'ptzz/lf.vim' " lf file navigator integration :: launch with <leader>f
" -- maybe ?
"  https://github.com/miyakogi/sidepanel.vim " unify sidebars (mundo, defx,
"  tagbar..)


" Tmux
Plug 'christoomey/vim-tmux-navigator' " top10 - Allow pane movement to jump out of vim into tmux

" Coding
Plug 'neoclide/coc.nvim', {'branch': 'release'} " top10 - Intellisense engine, full LSP support as VSCode

call plug#end() " Initialize plugin system

