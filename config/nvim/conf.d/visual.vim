" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Change the split character from | to │
set fillchars+=vert:│

" Add an indicator as to where our cursor is in this file
set ruler

" Get rid of the -- INSERT --, -- VISUAL --, etc prompts in the lower left
set noshowmode

" Make n and N highlight search results
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>

function! HLNext(blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('Flash', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" 256 colors
set t_Co=256
if &term =~ '256color'
   set t_ut=
endif

" Make tabs less wide and terrible
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Turn on line numbers
set number

" Highlight current line number
set cursorline

" Turn on syntax highlighting
syntax on
