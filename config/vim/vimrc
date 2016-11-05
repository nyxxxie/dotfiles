filetype on

" Run all files in the config directory
if has("gui_running")
    for f in split(glob('~/.vim/gvimrc.d/*.vim'), '\n')
        exe 'source' f
    endfor
else
    for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
        exe 'source' f
    endfor
endif

" Set the color scheme
if filereadable(expand("~/.vimtheme"))
    colorscheme import_from_file
else
    colorscheme default
endif
