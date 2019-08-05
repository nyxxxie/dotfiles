" Colors
let s:fg_tui=241
let s:fg_gui="#626262"
let s:bg_tui=234
let s:bg_gui="#262626"
let s:acc_tui=53
let s:acc_gui="#5f005f"

" Color combos     gui fg    gui bg    tui fg    tui bg    options
let s:c_normal = [ s:fg_gui, s:bg_gui, s:fg_tui, s:bg_tui, "" ]
let s:c_invert = [ s:bg_gui, s:fg_gui, s:bg_tui, s:fg_tui, "" ]

" Color maps
let s:m_uniform = airline#themes#generate_color_map(s:c_normal, s:c_normal, s:c_normal)
let s:m_modified = { 'airline_c': s:c_invert }  " Make filename inverted

" Assign mappings to theme
let g:airline#themes#nyx#palette = {}
let g:airline#themes#nyx#palette.insert   = s:m_uniform
let g:airline#themes#nyx#palette.normal   = s:m_uniform
let g:airline#themes#nyx#palette.visual   = s:m_uniform
let g:airline#themes#nyx#palette.replace  = s:m_uniform
let g:airline#themes#nyx#palette.inactive = s:m_uniform
let g:airline#themes#nyx#palette.insert_paste = s:m_uniform
"let g:airline#themes#nyx#palette.insert_modified   = s:m_modified
"let g:airline#themes#nyx#palette.normal_modified   = s:m_modified
"let g:airline#themes#nyx#palette.visual_modified   = s:m_modified
"let g:airline#themes#nyx#palette.replace_modified  = s:m_modified
"let g:airline#themes#nyx#palette.inactive_modified = s:m_modified
