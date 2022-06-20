if has('nvim')
  call plug#begin(stdpath('data').'/plugged')
else
  call plug#begin(expand('~/.vim/plugged'))
endif

if $VIMCONF == 'debug'
else
Plug 'mhinz/vim-startify' " Fancy start screen with links to recent files
Plug 'ryanoasis/vim-devicons' " Dev icons, needed by spaceline.vim
if $VIMCONF == 'all'
  Plug 'bagrat/vim-buffet' " top tab bar (buffers)
  Plug 'glepnir/spaceline.vim' " status line (faster than airline lightline eline)
else
  Plug 'vim-airline/vim-airline' " Status bar & buffers in tab bar
endif

"--------- Layout and style
Plug 'wesQ3/vim-windowswap' "swap windows: <leader>ww (1st time on 1st window, 2nd time on 2nd window => the two windows are then swaped)
Plug 'moll/vim-bbye' " :Bdelete and :Bwipeout quit buffers nicely without destroying windows
if $VIMCONF == 'all'
  Plug 'voldikss/vim-floaterm'
endif

"----------- Navigation
Plug 'ton/vim-bufsurf' " enables surfing through buffers based on viewing history per window
Plug 't9md/vim-choosewin' " easy pane switching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " needed by fzf.vim
Plug 'junegunn/fzf.vim' " integrate fzf with vim : provides Rg for search, Buffers, Files, GFiles (open files based on git), Maps... 
if has('nvim')
  " --- defx
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } " sidebar file browser
  Plug 'kristijanhusak/defx-icons' " dev icons for defx
  Plug 'kristijanhusak/defx-git' " git status for defx
else
  Plug 'scrooloose/nerdtree' " sidebar file browser
endif
if $VIMCONF == 'all'
  " --- lf
  Plug 'rbgrouleff/bclose.vim' " needed by ptzz/lf.vim
  Plug 'ptzz/lf.vim' " lf file navigator integration :: launch with <leader>f
else
  Plug 'dhruvasagar/vim-vinegar' " Enhance netrw (vim default file browser), NERDTree version
endif

Plug 'simnalamburt/vim-mundo' " Visualize undo tree
Plug 'maxbrunsfeld/vim-yankstack' " Enable to paste previous yanks : <alt>p / <alt><shift>p

" -- maybe ?
"  https://github.com/miyakogi/sidepanel.vim " unify sidebars (mundo, defx,
"  tagbar..)

" Tmux
Plug 'christoomey/vim-tmux-navigator' " Allow pane movement to jump out of vim into tmux

if $VIMCONF == 'all'
  " web browser integration
  if has('nvim')
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  endif
endif

" -----------  Coding
Plug 'editorconfig/editorconfig-vim' " EditorConfig support (project based code style) 
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tomtom/tcomment_vim' " Comments
Plug 'godlygeek/tabular' " :Tabularize /<delimiter> (must be before vim-markdown)
if $VIMCONF == 'all'
  Plug 'ludovicchabant/vim-gutentags' " Autogenerate tags
  Plug 'liuchengxu/vista.vim' " Navigate tags
endif

" Polyglot : syntax highlighting, indentation for a wide collection of languages
" provides, among others plugins :
"     'LnL7/vim-nix'
"     'rust-lang/rust.vim'
"     'HerringtonDarkholme/yats.vim' , { 'for': 'typescript' }
"     'posva/vim-vue'
"     'Vimjas/vim-python-pep8-indent' , { 'for': 'python' }
"     'vim-python/python-syntax' , { 'for': 'python' }
"     'plasticboy/vim-markdown'
"     'aklt/plantuml-syntax'
Plug 'sheerun/vim-polyglot' 

Plug 'alvan/vim-closetag' " Close html / xml tags
Plug 'jiangmiao/auto-pairs' " deals intelligently with pairs of punctuation () [] '' {} ... (better than kana/vim-smartinput)
if $VIMCONF == 'all'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine, full LSP support as VSCode
  Plug 'honza/vim-snippets' " snippets for many languages, used by coc-snippets extension
  Plug 'pechorin/any-jump.vim' " <leader>j open floating window with definition and usages
  Plug 'mfussenegger/nvim-dap' " (needs neovim >= 0.6) Debug Adapter Protocol. See coding.vim for languages adapters installs & configs
  Plug 'rcarriga/nvim-dap-ui' " UI for nvim-dap

  Plug 'alvan/vim-php-manual', {'for': 'php'} " Search for word under cursor

  Plug 'tobyS/vmustache' " required by https://github.com/Rican7/php-doc-modded
  Plug 'Rican7/php-doc-modded' " generate functions php documentation - double emploi avec coc-phpls si intelephense 'premium' a été activé

  " Typescript / Js (see also plugins loaded by polyglot)
  Plug 'gavocanov/vim-js-indent' "works well whith yajs.vim

  " Python (see also plugins loaded by polyglot)
  Plug 'vim-scripts/python_match.vim' , { 'for': 'python' }
  Plug 'raimon49/requirements.txt.vim' , { 'for': 'requirements' }
endif

" Markdown (see also plugins loaded by polyglot)
Plug 'dhruvasagar/vim-table-mode' " Markdown tables auto-format (enable with <leader>tm)
Plug 'pbrisbin/vim-mkdir' " Automatically create any non-existent directories before writing the buffer
Plug 'mmai/vim-markdown-wiki' " eases the navigation between files in a personnal wiki based on markdown
if $VIMCONF == 'all'
  Plug 'mmai/vim-markdownizer' " Organizer based on markdown 
  Plug 'junegunn/goyo.vim' " writeroom like
  Plug 'junegunn/limelight.vim' " to be use with Goyo: dim surrounding paragraphs
  " Plug 'reedes/vim-pencil' "vim for writers (TooglePencil) : line wrap, undo/redo by sentences, hide markdown formating chars.. => TODO comment désactiver le line wrap par config ?
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " can preview Plantuml diagrams (not livedown) :MarkdownPreview / :MarkdownPreviewStop
endif
endif " vimdebug

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
