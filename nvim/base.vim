" --------------------------------------------------
" -----------------  General config ----------------
" --------------------------------------------------
set mouse=a " Enable mouse for scrolling and window resizing.
set number

set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif
if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif


" Sync the last copy register with the system clipboard 
set clipboard^=unnamed,unnamedplus

" Open links with system default applications (replace by 'firefox' for
" example if xdg-open behaves strangely  )
let g:netrw_browsex_viewer= "xdg-open"

" Always focus on splited window.
set splitright
set splitbelow

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescrolloff=15

" Wrap lines by default
set wrap linebreak
set showbreak=" "

" When 'wrap' is on, display last line even if it doesn't fit.
set display+=lastline

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk
 
" Enable persistent undo so that undo history persists across vim sessions
set undofile

" Autoindent when starting new line, or using `o` or `O`.
set autoindent

" Use 'shiftwidth' when using `<Tab>` in front of a line.
" By default it's used only for shift commands (`<`, `>`).
set smarttab

" Indent using two spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" select short messages displayed in status bar
set shortmess=ac
if $VIMCONF == 'all'
  set shortmess+=F
endif

" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Wildmenu {{{
" --------
if has('wildmenu')
	if ! has('nvim')
		set wildmode=list:longest
	endif
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,**/tmp/**,*.DS_Store
	set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
	set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
	set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif
" }}}


" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=500   " Time out on mappings
set ttimeoutlen=10   " Time out on key codes
set updatetime=100   " Idle time to write swap and trigger CursorHold
set redrawtime=1500  " Time in milliseconds for stopping display redraw

" }}}

" Searching {{{
" ---------
set ignorecase    " Search ignoring case
set smartcase     " Keep case when searching with *
set infercase     " Adjust case in insert completion mode
set incsearch     " Incremental search
set wrapscan      " Searches wrap around the end of the file
set hlsearch      " Highlight search results

set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary

if exists('+inccommand')
	set inccommand=nosplit
endif

if executable('rg')
	set grepformat=%f:%l:%m
	let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
	set grepformat=%f:%l:%m
	let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif
" }}}

" Return to last edit position when opening files
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END



" Autocomplete {{{
" ----------------
set completeopt=menu,menuone    " Always show menu, even for one item
if $VIMCONF == 'all'
  set completeopt+=noselect,noinsert
endif

if exists('+completepopup')
	set completeopt+=popup
	set completepopup=height:4,width:60,highlight:InfoPopup
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
	" set diffopt=indent-heuristic,algorithm:patience
endif
" }}}


set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
set winminheight=1      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set showcmd             " Show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set equalalways       " Resize windows on split or close
set laststatus=2        " Always show a status line
set display=lastline

if has('folding') && has('vim_starting')
	set foldenable
	set foldmethod=indent
	set foldlevelstart=99
endif

if has('nvim-0.4')
	set signcolumn=yes:1
elseif $VIMCONF == 'all'
	set signcolumn=yes
endif

if has('conceal') && v:version >= 703
	" For snippet_complete marker
	" set conceallevel=2 concealcursor=niv
	set conceallevel=2
endif

if exists('+previewpopup')
	set previewpopup=height:10,width:60
endif
