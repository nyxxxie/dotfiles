" Each theme is contained in its own file and declares variables scoped to the
" file.  These variables represent the possible "modes" that airline can
" detect.  The mode is the return value of mode(), which gets converted to a
" readable string.  The following is a list currently supported modes: normal,
" insert, replace, visual, and inactive.
"
" Each mode can also have overrides.  These are small changes to the mode that
" don't require a completely different look.  "modified" and "paste" are two
" such supported overrides.  These are simply suffixed to the major mode,
" separated by an underscore.  For example, "normal_modified" would be normal
" mode where the current buffer is modified.
"
" The theming algorithm is a 2-pass system where the mode will draw over all
" parts of the statusline, and then the override is applied after.  This means
" it is possible to specify a subset of the theme in overrides, as it will
" simply overwrite the previous colors.  If you want simultaneous overrides,
" then they will need to change different parts of the statusline so they do
" not conflict with each other.
"
" First, let's define an empty dictionary and assign it to the "palette"
" variable. The # is a separator that maps with the directory structure. If
" you get this wrong, Vim will complain loudly.
let g:airline#themes#nyx#palette = {}

" First let's define some arrays. The s: is just a VimL thing for scoping the
" variables to the current script. Without this, these variables would be
" declared globally. Now let's declare some colors for normal mode and add it
" to the dictionary.  The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.

"          [  guifg,     guibg,    ctermfg, ctermbg, opts ]
" Normal mode
let s:N1 = [ '#141413', '#CAE682',   7,     238 ] " mode
let s:N2 = [ '#CAE682', '#32322F',   6,     236 ] " info
let s:N3 = [ '#CAE682', '#242424', 239,     234 ] " statusline
let s:N4 = [ '#141413', '#CAE682',   7,     90  ] " mode modified

" Insert mode
let s:I1 = [ '#141413', '#FDE76E',   5,     234 ]
let s:I2 = [ '#FDE76E', '#32322F',   5,     234 ]
let s:I3 = [ '#FDE76E', '#242424', 238,     234 ]
let s:I4 = [ '#FADE3E', 221 ]

" Visual mode
let s:V1 = [ '#141413', '#FDE76E',   3,     234 ]
let s:V2 = [ '#B5D3F3', '#32322F',   3,     234 ]
let s:V3 = [ '#B5D3F3', '#242424', 238,     234 ]
let s:V4 = [ '#7CB0E6',  8 ]

" Replace mode
let s:R1 = [ '#141413', '#FDE76E',   1,     234 ]
let s:R2 = [ '#E5786D', '#32322F',   1,     234 ]
let s:R3 = [ '#E5786D', '#242424', 238,     234 ]
let s:R4 = [ '#E55345',  203 ]

" Paste mode
let s:PA = [ '#94E42C',  47 ]

" Info modified
let s:IM = [ '#40403C',  238 ]

" Inactive mode
let s:IA = [ '#767676' , s:N3[1] , 243 , s:N3[3] , '' ]

let g:airline#themes#nyx#palette = {}

" Colors for the tabline thing at the top of the vim window
let g:airline#themes#nyx#palette.tabline = {
      \ 'airline_tab':     ['#2aa198', '#003f3f', 238, 234, ''],
      \ 'airline_tabsel':  ['#ffffff', '#2e8b57', 238, 235, ''],
      \ 'airline_tabtype': ['#ffffff', '#005252', 238, 234, ''],
      \ 'airline_tabfill': ['#ffffff', '#002b2b', 238, 234, ''],
      \ 'airline_tabmod':  ['#ffffff', '#780000', 5,   235, ''],
      \ }

let g:airline#themes#nyx#palette.accents = {
      \ 'red': [ '#E5786D' , '' , 203 , '' , '' ],
      \ }


let g:airline#themes#nyx#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#nyx#palette.normal_modified = {
    \ 'airline_c': [ s:N3[0], s:N3[1], 5, s:N3[3], '' ] }

let g:airline#themes#nyx#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let g:airline#themes#nyx#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let g:airline#themes#nyx#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let g:airline#themes#nyx#palette.inactive = airline#themes#generate_color_map(s:N1, s:N1, s:N1)
let g:airline#themes#nyx#palette.inactive_modified = {
    \ 'airline_a': [ s:N1[0], s:N1[1], 8, s:N1[3], '' ],
    \ 'airline_b': [ s:N2[0], s:N2[1], 8, s:N2[3], '' ],
    \ 'airline_c': [ s:N3[0], s:N3[1], 8, s:N3[3], '' ] }

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#nyx#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 160 , ''  ]
      \ }

let g:airline_left_sep = '█▓░'
let g:airline_right_sep = '░▓█'
