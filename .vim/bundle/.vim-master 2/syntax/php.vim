" Vim syntax file
" Language: PHP 5.3 & up
" Maintainer: Jay
" Date: 2013-1-26
"
" Note: All of the switches for VIM 5.X and 6.X compatability were removed.
"       DO NOT USE THIS FILE WITH A VERSION OF VIM < 7.0.
"
" Note: All the php syntax files I found seemed really big and contained a lot
"       of stuff that I didn't care about (like highlighting every constant
"       and built-in function in php) so I took one of those php syntax files 
"       and modified it to suit my purposes
"
" Former URL: https://github.com/StanAngeloff/php.vim

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'php'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn on html highlighting for html embedded in php files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime! syntax/html.vim
unlet! b:current_syntax
" HTML syntax file turns on spelling for all top level words, we attempt to turn off
syntax spell default

syn cluster htmlPreproc add=phpRegion

syn sync clear
unlet! b:current_syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Magic Constants
syn match phpMagicConstants "__[A-Z]\+__" contained

" Magic Methods
syn match phpMagicMethods "__[a-zA-Z0-9_]\+(\@=" contained

" Control Structures
syn keyword phpStatement if else elseif while do for foreach break switch case contained

syn keyword phpStatement default continue return goto as endif endwhile endfor contained 
syn keyword phpStatement endforeach endswitch declare endeclare contained
" Exception Keywords
syn keyword phpStatement try catch throw contained
" Language Constructs
syn keyword phpStatement die exit eval empty isset unset list instanceof insteadof contained

" Class Keywords
syn keyword phpType class abstract extends interface implements static final var public private protected const trait contained
" Types
syn keyword phpType bool[ean] int[eger] real double float string array object null self parent global this stdClass callable contained
" Boolean
syn keyword phpBoolean true false  contained

" These special keywords have traditionally received special colors
syn keyword phpSpecial function echo print new clone contained

" Include & friends
syn keyword phpInclude include include_once require require_once namespace use contained

" Operator
syn match phpOperator "[!=<>]=" contained display
syn match phpOperator "[<>]"  contained display
syn match phpMemberSelector "->"  contained display

" Identifier
syn match  phpIdentifier "$\h\w*"  contained display

" Number
syn match phpNumber "-\=\<\d\+\>" contained display
syn match phpNumber "\<0x\x\{1,8}\>"  contained display
syn match phpNumber "\<0b[01]\+\>"    contained display
" Float
syn match phpNumber "\(-\=\<\d+\|-\=\)\.\d\+\>" contained display

" Todo
syn keyword phpTodo todo fixme xxx note contained

" Comment
syn region phpComment start="/\*" end="\*/" contained contains=phpTodo extend
syn match phpComment "#.\{-}\(?>\|$\)\@=" contained contains=phpTodo
syn match phpComment "//.\{-}\(?>\|$\)\@=" contained contains=phpTodo

" String
syn region phpStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=phpIdentifier contained extend keepend
syn region phpBacktick start=+`+ skip=+\\\\\|\\"+ end=+`+ contains=phpIdentifier contained extend keepend
syn region phpStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'+ contained keepend extend

" contains the php code blocks
syn cluster phpComments contains=phpComment,phpTodo
syn cluster phpString contains=phpStringDouble,phpBacktick,phpStringSingle
syn cluster phpCodeBlock contains=phpMagicConstants,phpMagicMethods,phpStatement,phpType,phpBoolean,phpSpecial,phpInclude,phpOperator,phpMemberSelector,phpIdentifier,phpNumber,@phpComments,@phpString

" Sync
syn region phpRegion matchgroup=Delimiter start="<?\(php\)\=" end="?>" contains=@phpCodeBlock keepend
syn sync match phpRegionSync grouphere phpRegion "^\s*<?\(php\)\=\s*$"
syn sync match phpRegionSync grouphere NONE "^\s*?>\s*$"
syn sync match phpRegionSync grouphere NONE "^\s*%>\s*$"
" syn sync maxlines=200
syn sync fromstart

" Define the default highlighting.
hi link phpMagicConstants   Constant
hi link phpMagicMethods     Constant
hi link phpStatement        Statement
hi link phpType             Type
hi link phpBoolean          Constant
hi link phpSpecial          PreProc
hi link phpInclude          PreProc

hi link phpOperator         Operator
" hi link phpMemberSelector   Type
hi link phpIdentifier       Identifier

hi link phpNumber           Number

hi link phpTodo             Todo
hi link phpComment          Comment

hi link phpStringSingle     String
hi link phpStringDouble     String
hi link phpBacktick         String

let b:current_syntax = "php"

if main_syntax == 'php'
  unlet main_syntax
endif

