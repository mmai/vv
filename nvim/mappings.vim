let g:mapleader="\<Space>"
let g:maplocalleader=','

"ESC remap
inoremap kj <esc>
inoremap KJ <esc>
inoremap jk <esc>
inoremap JK <esc>

"Easy vimrc editing
nnoremap <expr> ,ev ':vsplit '.g:vvconfpath.'/init.vim'. "\n"
nnoremap <expr> ,sv ':source '.g:vvconfpath.'/init.vim'. "\n"

" ,cd => change directory to the file being edited
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Save with sudo
cmap W!! w !sudo tee % >/dev/null

"delete buffer
if $VIMCONF == 'all'
 "uses vim-buffet (keeps the window open)
  nnoremap <C-x> :Bw<CR>
else
  nnoremap <C-x> :<C-u>bd<CR>
endif

" choosewin
nnoremap ù :ChooseWin<CR>

" php-manual (override default <c-h> conflicting with tmux-navigator)
let g:php_manual_online_search_shortcut = '<leader>h'

"--------------- Personal wiki ----------------
" , + Enter : open markdown wiki links in a new split
nnoremap ,<CR> <C-w>v:MdwiGotoLink<CR>
" Go back in history
nnoremap ,, :BufSurfBack<CR>
" Go forward in history
nnoremap ,; :BufSurfForward<CR>
" When cursor is on a command between backtics, execute it (ex: `tmuxp load -y myproject`)
nnoremap gt yi`:!<C-r>"<CR>
" Toggle checkboxes
nnoremap <silent> <buffer> <space><space> :call behaviour#SwitchStatus()<CR>

" ------- FZF Fuzzy-find plugin shortcuts
let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_CTRL_T_COMMAND  = 'fd --type f'
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>
" View commits in fzf
nmap <Leader>g :Commits<cr>

" ------- FloatTerm-----------
if $VIMCONF == 'all'
  nnoremap   <silent>   <F9>    :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=
  tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=
  nnoremap   <silent>   <F8>    :FloatermPrev<CR>
  tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
  nnoremap   <silent>   <F10>    :FloatermNext<CR>
  tnoremap   <silent>   <F10>    <C-\><C-n>:FloatermNext<CR>
  nnoremap   <silent>   <F12>   :FloatermToggle<CR>
  tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
endif

" ------ UI ------------
" Open sidebar file browser
"nnoremap <leader>e :CocCommand explorer<CR> 
if $VIMCONF == 'all'
  nnoremap <leader>e :Defx<CR>
else
  nnoremap <leader>e :NERDTreeToggle<CR>
endif

if $VIMCONF == 'all'
  " browse tags 
  nnoremap <leader>t :Vista coc<CR>
  " browse current file directory with lf
  nnoremap - :LfCurrentDirectory<CR>
else
  " browse tags 
  nnoremap <leader>t :Vista<CR>
endif

" undo tree
nnoremap <silent> <Leader>u :MundoToggle<CR>

" Markdownizer dashboard
nnoremap <silent> <Leader>p :MarkdownizerDashboard<CR>

" See also coc-config.vim
