if has('nvim')
  call plug#begin(stdpath('data').'/plugged')
else
  call plug#begin(expand('~/.vim/plugged'))
endif

Plug 'mhinz/vim-startify' " Fancy start screen with links to recent files
Plug 'ryanoasis/vim-devicons' " Dev icons, needed by spaceline.vim
Plug 'hardcoreplayers/spaceline.vim' " status line (faster than airline lightline eline)

"--------- Layout and style
Plug 'wesQ3/vim-windowswap' "swap windows: <leader>ww (1st time on 1st window, 2nd time on 2nd window => the two windows are then swaped)
Plug 'moll/vim-bbye' " :Bdelete and :Bwipeout quit buffers nicely without destroying windows

"----------- Navigation
Plug 'hardcoreplayers/vim-buffet' " top tab bar (buffers)
Plug 't9md/vim-choosewin' " easy pane switching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " needed by fzf.vim
Plug 'junegunn/fzf.vim' " integrate fzf with vim : provides Rg for search, Buffers, Files, GFiles (open files based on git), Maps... 
" --- defx
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } " sidebar file browser
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons' " dev icons for defx
Plug 'kristijanhusak/defx-git' " git status for defx
if $VIMCONF == 'all'
  " --- lf
  Plug 'rbgrouleff/bclose.vim' " needed by ptzz/lf.vim
  Plug 'ptzz/lf.vim' " lf file navigator integration :: launch with <leader>f
else
  Plug 'tpope/vim-vinegar' " Enhance netrw (vim default file browser)
endif

" -- maybe ?
"  https://github.com/miyakogi/sidepanel.vim " unify sidebars (mundo, defx,
"  tagbar..)

" Tmux
Plug 'christoomey/vim-tmux-navigator' " Allow pane movement to jump out of vim into tmux

" -----------  Coding
Plug 'tomtom/tcomment_vim' " Comments
Plug 'ludovicchabant/vim-gutentags' " Autogenerate tags
if $VIMCONF == 'all'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine, full LSP support as VSCode
  Plug 'pechorin/any-jump.vim' " <leader>j open floating window with definition and usages
endif
Plug 'liuchengxu/vista.vim' " Navigate tags
Plug 'honza/vim-snippets' " snippets for many languages, used by coc-snippets extension

if $VIMCONF == 'all'
  Plug 'LnL7/vim-nix' " nix 
  Plug 'rust-lang/rust.vim' " rust
endif

call plug#end() " Initialize plugin system

" ============ Coc extensions
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
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-stylelint',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-phpls',
    \ 'coc-python',
    \ 'coc-rust-analyzer'
    \]
