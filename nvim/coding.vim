
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

vim.fn.sign_define('DapBreakpoint', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟥', texthl='', linehl='', numhl=''})
EOF
  " see https://github.com/David-Kunz/vim/blob/master/_init.vim & https://www.youtube.com/watch?v=SIYt1dopfTc
  " see mappings.vim
  " dap ui
  lua require('dapui').setup()
lua <<EOF
  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
EOF
endif
