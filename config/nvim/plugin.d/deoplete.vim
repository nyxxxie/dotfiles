let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0

" Tab wrapper
function! g:TabComplete()
    let l:col = col('.') - 1

    if pumvisible()
        return "\<C-n>"
    else
        if !l:col || getline('.')[l:col - 1] !~# '\k'
            return "\<TAB>"
        else
            return "\<C-n>"
        endif
    endif
endfunction
inoremap <silent> <expr> <Tab> g:TabComplete()

" Perform completion operation if we're in the menu
function! g:PerformCompletion()
  if pumvisible()
    "if neosnippet#expandable_or_jumpable
    return g:deoplete#mappings#close_popup()
  else
    return "\<CR>"
  endif
endfunction
inoremap <silent> <expr> <CR> g:PerformCompletion()

" Undo completion when backspace is pressed
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
