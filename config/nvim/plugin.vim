call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()
