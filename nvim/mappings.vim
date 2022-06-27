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
" When cursor is on a command between backtics, split tmux window and execute it 
nnoremap gs yi`:!tmux split-window <C-r>"<CR>
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

if $VIMCONF == 'all'
  " DAP ( debugger adapter protocol)
  " see https://github.com/David-Kunz/vim/blob/master/_init.vim & https://www.youtube.com/watch?v=SIYt1dopfTc
  nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
  " nnoremap <S-k> :lua require'dap'.step_out()<CR>
  " nnoremap <S-l> :lua require'dap'.step_into()<CR>
  " nnoremap <S-j> :lua require'dap'.step_over()<CR>
  nnoremap <leader>dk :lua require'dap'.step_into()<CR>
  nnoremap <leader>dj :lua require'dap'.step_over()<CR>
  nnoremap <leader>ds :lua require'dap'.stop()<CR>
  nnoremap <leader>dn :lua require'dap'.continue()<CR>
  nnoremap <leader>dK :lua require'dap'.up()<CR>
  nnoremap <leader>dJ :lua require'dap'.down()<CR>
  nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
  nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
  nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
  vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
  nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
  nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
  nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
  nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>
  nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>

  " DAP UI
  nnoremap <leader>dq :lua require('dapui').toggle()<CR>
endif

" See also coc-config.vim
