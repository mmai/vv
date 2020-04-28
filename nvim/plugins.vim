" top10, top20... : if i have to choose only 10, 20,.. plugins

call plug#begin(stdpath('data').'/plugged')

Plug 'mhinz/vim-startify' " Fancy start screen with links to recent files
Plug 'ryanoasis/vim-devicons' " Dev icons, needed by spaceline.vim
Plug 'hardcoreplayers/spaceline.vim' " status line (faster than airline lightline eline)

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
Plug 'honza/vim-snippets' " snippets for many languages, used by coc-snippets extension
Plug 'tomtom/tcomment_vim' " Comments

call plug#end() " Initialize plugin system

" Coc extensions
let g:coc_global_extensions =[
    \ 'coc-marketplace',
    \ 'coc-explorer',
    \ 'coc-actions',
    \ 'coc-pairs',
    \ 'coc-highlight',
    \ 'coc-git',
    \ 'coc-snippets',
    \ 'coc-yank',
    \ 'coc-prettier',
    \ 'coc-html','coc-emmet',
    \ 'coc-css coc-stylelint',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-phpls',
    \ 'coc-python',
    \ 'coc-rust-analyzer'
    \]
