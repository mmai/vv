call plug#begin(stdpath('data').'/plugged')

Plug 'mhinz/vim-startify' " Fancy start screen with links to recent files

" Navigation
Plug 'tpope/vim-vinegar' " Enhance netrw (vim default file browser)

" Coding
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine, full LSP support as VSCode

call plug#end() " Initialize plugin system

