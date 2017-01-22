filetype on

" Run all files in the config directory
for f in split(glob('~/.config/nvim/conf.d/*.vim'), '\n')
    exe 'source' f
endfor

" Start up plugin manager
source ~/.config/nvim/plugin.vim

" Run all files in the plugin config directory
for f in split(glob('~/.config/nvim/plugin.d/*.vim'), '\n')
    exe 'source' f
endfor

" Set the color scheme
if filereadable(expand("~/.vimtheme"))
    colorscheme import_from_file
else
    colorscheme theme
endif
