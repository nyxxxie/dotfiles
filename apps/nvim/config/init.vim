" Don't change the cursor style
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=

" Chose indent style based on what the file seems to use
set smarttab
set smartindent
set autoindent

" Install plugins
call plug#begin('~/.local/share/nvim/plugins')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'tpope/vim-surround'

Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'Shougo/neco-syntax.vim'

"Plug 'joereynolds/vim-minisnip'
"Plug 'joereynolds/deoplete-minisnip'

Plug 'Shougo/denite.vim'

call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview  " Don't pop up preview in completion window
