" -------------------------------------------------
" Name:    ink16.vim
" Author:  github.com/stillwwater
" Version: 1.0
" License: The MIT License (MIT)
" --------------------------------------------------

hi clear

let g:colors_name = "ink16"

" Dark palette
let s:d_black    = ["#0C0C0C",  0]
let s:d_red      = ["#C50F1F",  1]
let s:d_green    = ["#13A10E",  2]
let s:d_yellow   = ["#C19C00",  3]
let s:d_blue     = ["#0037DA",  4]
let s:d_purple   = ["#881798",  5]
let s:d_cyan     = ["#3A96DD",  6]
let s:d_white    = ["#CCCCCC",  7]

" Bright palette
let s:b_black  = ["#767676",  8]
let s:b_red    = ["#F05D80",  9]
let s:b_green  = ["#16C60C", 10]
let s:b_yellow = ["#F9F1A5", 11]
let s:b_blue   = ["#3B78FF", 12]
let s:b_purple = ["#B4009E", 13]
let s:b_cyan   = ["#61D6D6", 14]
let s:b_white  = ["#F2F2F2", 15]

" Interface
let s:accent     = ["#B3AAEE", 13]
let s:menu       = ["#262626",  8]
let s:linenumber = ["#3A3A3A",  8]
let s:cursorline = ["#202020",  8]

let s:cursor     = s:accent
let s:background = s:d_black
let s:foreground = s:d_white

let s:interface_bg  = ["#3A3A3A", 8]
let s:interface_nc  = ["#7A7A7A", 7]
let s:interface_fg  = s:foreground

let s:none      = ["NONE", "NONE"]
let s:bold      = "bold"
let s:italic    = "italic"
let s:underline = "underline"
let s:undercurl = "undercurl"
let s:inverse   = "inverse"

function! s:h(group, fg, bg, ...)
  execute "highlight" a:group
    \ "guifg=" . a:fg[0]
    \ "guibg=" . a:bg[0]
    \ "ctermfg=" . a:fg[1]
    \ "ctermbg=" . a:bg[1]
    \ "gui=" . (a:0 >= 1 ? a:1 : "NONE")
    \ "cterm=" . (a:0 >= 1 ? a:1 : "NONE")
endfunction

call s:h("Normal", s:foreground, s:background)
hi! link Identifier  Normal
hi! link Delimiter   Normal
hi! link Operator    Normal

call s:h("Constant", s:b_purple, s:none)
hi! link Character      Constant
hi! link Number         Constant
hi! link Boolean        Constant
hi! link Float          Constant

call s:h("Type", s:b_purple, s:none)
hi! link StorageClass   Type
hi! link Structure      Type
hi! link Typedef        Type

call s:h("Keyword", s:b_yellow, s:none)
hi! link Conditional    Keyword
hi! link Repeat         Keyword
hi! link Label          Keyword
hi! link Statement      Keyword
hi! link Exception      Keyword

call s:h("Preproc", s:b_red, s:none)
hi! link Include        PreProc
hi! link Define         PreProc
hi! link Macro          PreProc
hi! link PreCondit      PreProc

call s:h("Special", s:b_black, s:none)
hi! link SpecialChar    Special
hi! link Tag            Special
hi! link SpecialComment Special
hi! link Debug          Special

call s:h("Function", s:b_cyan, s:none)
call s:h("Comment",  s:b_blue, s:none)
call s:h("Cursor",   s:none, s:accent)

call s:h("VertSplit",    s:interface_bg, s:interface_bg)
call s:h("CursorLine",   s:none,         s:cursorline)
call s:h("CursorLineNR", s:background,   s:cursorline)
call s:h("StatusLine",   s:interface_fg, s:interface_bg)
call s:h("StatusLineNC", s:interface_nc, s:interface_bg)
call s:h("LineNR",       s:linenumber,   s:none)

call s:h("Pmenu",        s:foreground,   s:menu)
call s:h("PmenuSel",     s:menu,         s:accent)
call s:h("PmenuSBar",    s:foreground,   s:menu)
call s:h("PmenuThumb",   s:foreground,   s:accent)

call s:h("NonText",      s:b_blue,       s:none)
call s:h("DiffAdd",      s:b_green,      s:none)
call s:h("DiffChange",   s:b_yellow,     s:none)
call s:h("DiffDelete",   s:b_red,        s:none)
call s:h("DiffText",     s:foreground,   s:none)

call s:h("ModeMsg",      s:foreground,   s:none)
call s:h("Directory",    s:b_cyan,       s:none)
call s:h("MatchParen",   s:accent,       s:interface_nc, s:bold)

call s:h("IncSearch",    s:background,   s:b_yellow)
call s:h("Search",       s:background,   s:b_cyan)
call s:h("Visual",       s:none,         s:none, s:inverse)
call s:h("Ignore",       s:background,   s:none)
call s:h("Error",        s:background,   s:b_red)
call s:h("Todo",         s:background,   s:accent)

if has("terminal")
    call s:h("Terminal",         s:foreground,   s:background)
    call s:h("StatusLineTerm",   s:interface_fg, s:interface_bg)
    call s:h("StatusLineTermNC", s:interface_nc, s:interface_bg)
endif

" coc-nvim
hi! link CocErrorSign   ErrorMsg
hi! link CocWarningSign WarningMsg
hi! link CocInfoSign    Question
hi! link CocHintSign    Comment

" ALE
hi! link ALEErrorSign   ErrorMsg
hi! link ALEWarningSign WarningMsg

" git-gutter, Signify
hi! link SignifySignAdd     DiffAdd
hi! link SignifySignDelete  DiffDelete
hi! link SignifySignChange  DiffChange
hi! link GitGutterAdd       DiffAdd
hi! link GitGutterDelete    DiffDelete
hi! link GitGutterChange    DiffChange
