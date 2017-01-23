" What is this 'Vee-Eye' of which you speak
set nocompatible

" Makes it so switching buffers will not require you to save changes
set hidden

" Sexy menu tab completion
set wildmenu
set wildmode=longest:full,full

" Sets <leader> binding
let mapleader="\\"

" Closes preview window
autocmd CompleteDone * pclose

" Set highlighting for searches
set hlsearch

set incsearch

" Copy the indents from the previous line
set autoindent

" Makes the above more similar to the previous
set copyindent

" Keeps cursor centered (set to 0 to turn it off)
set scrolloff=9999

" Bigger safety net
set history=1000
set undolevels=1000

" Make splits feel more natural
set splitbelow
set splitright
