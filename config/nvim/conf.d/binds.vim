" Navigate splits without using ctrl+w
" nmap <silent> <C-h> :wincmd h<CR>
" nmap <silent> <C-j> :wincmd j<CR>
" nmap <silent> <C-k> :wincmd k<CR>
" nmap <silent> <C-l> :wincmd l<CR>

" Make arrow keys adjust split sizes
nnoremap <buffer> <silent> <up> :wincmd +<CR>
nnoremap <buffer> <silent> <down> :wincmd -<CR>
nnoremap <buffer> <silent> <left> :wincmd <<CR>
nnoremap <buffer> <silent> <right> :wincmd ><CR>

" Make ctrl+c mimic escape in normal mode
nnoremap <C-c> <ESC>

" Tab and buffer switching
noremap <silent> <leader>] :bnext<CR>
noremap <silent> <leader>[ :bprevious<CR>
noremap <silent> <leader>} :tabn<CR>
noremap <silent> <leader>{ :tabp<CR>

" Useful for counting multiline operations
nnoremap <leader>r :set relativenumber!<CR>

" Save file as root
cmap w!! w !sudo tee % >/dev/null

" Ignore line indenting and etc, useful for pasting
set pastetoggle=<F2>

" Enable mouse stuff (useful for overviewing a file)
set mouse=a

" Clears search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" Shows highlighting as we are searching
nnoremap <silent> <leader>zz :let &scrolloff=999-&scrolloff<CR>
