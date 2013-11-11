syn match pythonFormatStrTemplate	"{[a-zA-Z0-9_]*}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" http://ssiaf.blogspot.com/2009/07/negative-lookbehind-in-vim.html
syn match pythonMethod "\.[a-zA-Z0-9_]*(\@="
syn keyword NonReservedKeyword self cls
syn keyword pythonBuiltinObj	__class__ __builtin__

" I like these (eg, and in is not or) better as the same color as for loops and stuff
hi link pythonOperator Statement

" multi-line strings not assigned to a variable should be treated as comments
syn region pythonDocBlock start=/^\s*\zs'''/ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region pythonDocBlock start=/^\s*\zs"""/ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest2,pythonSpaceError,@Spell

hi link pythonMethod	Function
hi link pythonFormatStrTemplate Special
hi link NonReservedKeyword Special
hi link pythonDocBlock Comment

" these things annoy me, so remove their highlighting
syn clear PythonError
