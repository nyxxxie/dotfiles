" Undofile allows you to save your undo history after exiting
" and restarting.  This enables that option if vim is 7.3+ and
" is compiled with it.  Also makes the files saved in a less
" annoying spot.
" This is only present in 7.3+
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undodir+=.
  set undofile
endif
