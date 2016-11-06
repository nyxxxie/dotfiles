""" Initialization
set background=dark

hi clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'Whatever'

if ! has('gui_running')
    if &t_Co != 256
        echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'
        finish
    endif
endif

""" Define colors
hi Normal                 ctermfg=246 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi NonText                ctermfg=236 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Visual                 ctermfg=0   ctermbg=7   guifg=#FFFFFF   guibg=#FFFFFF
hi Flash                  ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi Cursor                 ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi lCursor                ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi CursorColumn           ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
"hi CursorLine             ctermfg=    ctermbg=    guifg=          guibg=
hi CursorLineNr           ctermfg=95  ctermbg=234 guifg=#FFFFFF   guibg=#FFFFFF
hi LineNr                 ctermfg=239 ctermbg=234 guifg=#FFFFFF   guibg=#FFFFFF
hi Folded                 ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi FoldColumn             ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi SignColumn             ctermfg=7   ctermbg=90  guifg=#FFFFFF   guibg=#FFFFFF
hi ColorColumn            ctermfg=7   ctermbg=30  guifg=#FFFFFF   guibg=#FFFFFF
hi StatusLine             ctermfg=234 ctermbg=239 guifg=#FFFFFF   guibg=#FFFFFF
hi StatusLineNC           ctermfg=234 ctermbg=239 guifg=#FFFFFF   guibg=#FFFFFF
hi VertSplit              ctermfg=234 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi WildMenu               ctermfg=7   ctermbg=100 guifg=#FFFFFF   guibg=#FFFFFF
hi Directory              ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi Question               ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi MoreMsg                ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi WarningMsg             ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF
hi ErrorMsg               ctermfg=7   ctermbg=0   guifg=#FFFFFF   guibg=#FFFFFF

hi Comment                ctermfg=237 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi vimCommentTitleLeader  ctermfg=237 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi vimCommentTitle        ctermfg=237 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi vimCommentString       ctermfg=237 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi TabLine                ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi TabLineSel             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi TabLineFill            ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi TabLineNumber          ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi TabLineClose           ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi SpellCap               ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi SpecialKey             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi MatchParen             ctermfg=92  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Constant               ctermfg=241 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Special                ctermfg=95  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Identifier             ctermfg=80  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Statement              ctermfg=95  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PreProc                ctermfg=241 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Type                   ctermfg=241 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi String                 ctermfg=241 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Number                 ctermfg=95  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Define                 ctermfg=237 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Error                  ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Function               ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Include                ctermfg=237 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PreCondit              ctermfg=241 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Keyword                ctermfg=95  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Search                 ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Title                  ctermfg=239 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Delimiter              ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi StorageClass           ctermfg=95  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi Operator               ctermfg=237 ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi TODO                   ctermfg=95  ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF

hi Pmenu                  ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PmenuSel               ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PmenuSbar              ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpEOL                 ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpStringDelim         ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpDelimiter           ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpFunctions           ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpBoolean             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpOperator            ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpMemberSelector      ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi phpParent              ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PHPClassTag            ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PHPInterfaceTag        ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PHPFunctionTag         ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonDocString        ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonDocStringTitle   ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonRun              ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonBuiltinObj       ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonSelf             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonFunction         ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonClass            ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonExClass          ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonException        ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonOperator         ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonPreCondit        ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonDottedName       ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi pythonDecorator        ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PythonInterfaceTag     ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PythonClassTag         ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PythonFunctionTag      ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PythonVariableTag      ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi PythonMemberTag        ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi CTagsImport            ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi CTagsClass             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi CTagsFunction          ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi CTagsGlobalVariable    ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi CTagsMember            ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi xmlTag                 ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi xmlTagName             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi xmlEndTag              ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi cssImportant           ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi DiffAdd                ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi DiffChange             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi DiffDelete             ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi DiffText               ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi diffLine               ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi diffFile               ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF
hi diffNewFile            ctermfg=7   ctermbg=233 guifg=#FFFFFF   guibg=#FFFFFF

""" Color links
hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete
