syn clear markdownError

syn clear markdownItalic
"syn region markdownItalic start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=markdownLineStart
syn region markdownItalic start="\_s\@<=_[^_]\@=" end="[^_]\@<=_\_s\@=" keepend contains=markdownLineStart
