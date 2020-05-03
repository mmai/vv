let g:mapleader="\<Space>"
let g:maplocalleader=';'

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
nnoremap <C-x> :<C-u>bd<CR>

" choosewin
nnoremap ù :ChooseWin<CR>

"--------------- Personal wiki ----------------
" Space + Enter : open markdown wiki links in a new split
nnoremap <Space><CR> <C-w>v:MdwiGotoLink<CR>

" ------- FZF Fuzzy-find plugin shortcuts
let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_CTRL_T_COMMAND  = 'fd --type f'
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>
" View commits in fzf
nmap <Leader>c :Commits<cr>


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

if $VIMCONF == 'all'
  " ------ Completion with Coc ---------
  "Use tab for trigger completion with characters ahead and navigate
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction


  " ---------  Coc ------------------
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> <Leader>ci <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
endif
