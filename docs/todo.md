# TODO

- markdown
- tabularize ??
- %% to get current file in cde
- colors in gutter
- php symfony : imports ?

plugins à tester :
- https://github.com/liuchengxu/vim-which-key
- https://github.com/nvim-neorg/neorg
- https://github.com/kyazdani42/nvim-tree.lua
- https://github.com/AstroNvim/AstroNvim
- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/nvim-telescope/telescope.nvim
- https://github.com/NvChad/NvChad

résoudre erreurs sur serveur ratpdev (vim 7): 
```
Erreur détectée en traitant /home/web_portail2/vv/nvim/base.vim :
ligne   67 :
E539: Caractère <F> invalide: shortmess=aFc
ligne  139 :
E474: Argument invalide: completeopt+=noselect,noinsert
ligne  177 :
E518: Option inconnue: signcolumn=yes
Erreur détectée en traitant /home/web_portail2/vv/nvim/appearance.vim :
ligne    4 :
E518: Option inconnue: notermguicolors
ligne    8 :
E113: Option inconnue : termguicolors
E15: Expression invalide : &termguicolors
Erreur détectée en traitant /home/web_portail2/vv/nvim/sidebar.vim :
ligne  225 :
E121: Variable non définie : v:true
E15: Expression invalide : v:true
Erreur détectée en traitant /home/web_portail2/vv/nvim/plugged/vim-gutentags/plugin/gutentags.vim :
ligne   17 :
gutentags: this plugin requires the job API from Vim8 or Neovim.
Erreur détectée en traitant function <SNR>26_do_vim_enter..vista#RunForNearestMethodOrFunction :
ligne    3 :
E121: Variable non définie : v:false
Erreur détectée en traitant function <SNR>26_do_vim_enter..vista#RunForNearestMethodOrFunction :
ligne    3 :
E116: Arguments invalides pour la fonction vista#executive#ctags#Execute
```
