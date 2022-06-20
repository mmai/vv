
" ----------- Tags bar
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']

" Autopair for vim type : don't close the comment string '"'
augroup autopair
  au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}
augroup END

" --------------- Formating

" Tabulation (defaults from base.vim : 2 spaces)
augroup tabulation_languages
  autocmd Filetype python setlocal ts=4 sts=4 sw=4
  autocmd Filetype html setlocal ts=2 sts=2 sw=2
augroup END

" ---------------- Coc
if $VIMCONF == 'all'
  execute 'source' g:vvconfpath.'/coc-config.vim'
endif

" ----------------- Debugger
if $VIMCONF == 'all'
" Installation : 
" - cd /home/henri/softs_/
" - git clone https://github.com/xdebug/vscode-php-debug.git
" - cd vscode-php-debug
" - npm install && npm run build
"
" see phpinfo for the port config
lua <<EOF
local dap = require('dap')
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/henri/softs_/vscode-php-debug/out/phpDebug.js' }
 }

dap.configurations.php = {
  {
      type = 'php',
      request = 'launch',
      name = 'Listen for Xdebug',
      port = 9003
  }
 }

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
EOF
" see https://github.com/David-Kunz/vim/blob/master/_init.vim & https://www.youtube.com/watch?v=SIYt1dopfTc
nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <S-k> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.stop()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>dk :lua require'dap'.up()<CR>
nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>
nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
  " lua require('dapui').setup()
  " nnoremap <leader>dq :lua require('dapui').toggle()<CR>
endif
