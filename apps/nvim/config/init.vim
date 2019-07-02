" neovim/neovim#3702
set mouse=

" Don't change the cursor style
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=

" Display line numbers
set nu

" Add a bind to set relative numbers
nnoremap <leader>r :set rnu!"<CR>

" Chose indent style based on what the file seems to use
set smarttab
set smartindent
set autoindent

" Use our custom color theme
colorscheme nyx

" Escape terminal mode by pressing escape
tnoremap <Esc> <C-\><C-n>

" Sometimes files use tabs for some reason, this makes that changable with
" :retab
set expandtab ts=4 sw=4

" Visually display tab characters and trailing spaces
set list listchars=tab:▸\ ,trail:.

" Install plugins
call plug#begin('~/.local/share/nvim/plugins')

" Shougo requires a weird install process for a few of their plugins, combined them together here
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Snippet support
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Fancy status bar
Plug 'vim-airline/vim-airline'

" Deoplete completion sources
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'

" File tree explorer + an integration to show changed git-tracked files
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Helm/Unite-like plugin
Plug 'Shougo/denite.nvim'

" Allows you to quickly edit surrounding characters
Plug 'tpope/vim-surround'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Display lines to show indentation level
Plug 'Yggdroot/indentLine'

call plug#end()


""" NERDTree
" Bind to open nerd tree
nmap <silent> <leader>n :NERDTreeToggle<CR>

" Arrow character in browser
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" If we delete a file in NERDTree, also delete any open buffers containing it
let NERDTreeAutoDeleteBuffer = 1

" Make the UI a little cleaner
"let NERDTreeMinimalUI = 1

" Close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Quit NERDTree after we use it to open a file
let g:NERDTreeQuitOnOpen = 1


""" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = '~'


""" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview  " Don't pop up preview in completion window

" Use the tab key to select completion candidates.  For the tab binding, we also
" add in a neat check that ensures we also use Tab to expand snippets
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

imap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#manual_complete()

imap <silent><expr> <S-TAB>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#manual_complete()

" Use the enter key to confirm a completion candidate selection.  If the
" candidate is a snippet, we'll expand it.  If it's an ordinary item, we can
" just close the PUM since it'll have already expanded.  Otherwise, the PUM
" isn't open or we haven't selected an item and should just press enter.
imap <silent><expr> <CR>
  \ pumvisible() && !empty(v:completed_item) ?
  \ neosnippet#expandable_or_jumpable() && split(v:completed_item.menu . " a")[0] == "[ns]" ?
  \ "\<Plug>(neosnippet_expand_or_jump)" :
  \ deoplete#close_popup() :
  \ "\<CR>"


""" Denite
" Key binding
nmap <silent> <leader><space> :Denite buffer file/rec<CR>
nmap <silent> <leader>b<space> :Denite buffer<CR>
nmap <silent> <leader>f<space> :Denite buffer<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" Ignore anything matching these
if exists('denite')  " Prevent error if denite isn't installed
    call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
        \ [ '.git/', '.ropeproject/', '__pycache__/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
endif


""" Airline
let g:airline_theme="nyx"


""" indentLine
" Set the character that indicates an indent level
let g:indentLine_char = '┊'

" TODO: fetch colors from theme
" Set indent colors
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#4e4e4e'
