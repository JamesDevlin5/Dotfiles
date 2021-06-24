" Markdown Syntax File
" ********************

" Ensure we only load this file once; prevent duplicate bindings
if exists("b:current_syntax")
    finish
endif

" Characters that are normally special, but have been escaped to provide normal meaning
"   >  *
"   >  _
"   >  { }
"   >  [ ]
"   >  ( )
"   >  #
"   >  +
"   >  -
"   >  .
"   >  !
syntax keyword EscapedChar \\\+ \\\-
syntax keyword EscapedChar \\\* \\_
"syntax keyword EscapedChar /\\# /\\\. /\\!
"syntax keyword EscapedChar /\\{ /\\}
"syntax keyword EscapedChar /\\[ /\\]
"syntax keyword EscapedChar /\\( /\\)

" Section Headings
"   --  Using Prefix
syntax region mdHead1 matchgroup=mdHeading start="^\s*#\{1}" end="$"
syntax region mdHead2 matchgroup=mdHeading start="^\s*#\{2}" end="$"
syntax region mdHead3 matchgroup=mdHeading start="^\s*#\{3}" end="$"
syntax region mdHead4 matchgroup=mdHeading start="^\s*#\{4}" end="$"
syntax region mdHead5 matchgroup=mdHeading start="^\s*#\{5}" end="$"
syntax region mdHead6 matchgroup=mdHeading start="^\s*#\{6}" end="$"
"   --  Using Underline
syntax match mdHead1 "^.\+\_$=\+$"
syntax match mdHead2 "^.\+\_$-\+$"

