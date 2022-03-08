
" REF: /usr/local/share/vim/vim60/syntax/verilog.vim
" A bunch of useful keywords

syn keyword ohadKeywords     ohad Ohad OHAD Shafrir SHAFRIR Hi
"syn keyword ohadKeywords_2   # [ ] 


highlight comment_ohad ctermfg=green guifg=green
highlight comment_ohad_2 ctermfg=magenta guifg=magenta
highlight comment_ohad_magenta ctermfg=magenta guifg=magenta
highlight comment_ohad_yellow ctermfg=yellow guifg=yellow
highlight comment_ohad_blue_bg ctermfg=white ctermbg=darkblue guifg=white guibg=darkblue
highlight comment_ohad_dark_yellow ctermfg=DarkYellow guifg=DarkYellow
highlight comment_ohad_cyan ctermfg=cyan guifg=cyan
highlight comment_ohad_dark_cyan ctermfg=DarkCyan guifg=DarkCyan
highlight comment_ohad_red ctermfg=red guifg=red
highlight comment_ohad_brown ctermfg=brown guifg=brown
highlight comment_ohad_blue ctermfg=blue guifg=blue
highlight comment_ohad_orange ctermfg=darkyellow guifg=orange
highlight comment_ohad_seagreen ctermfg=darkgreen guifg=seagreen
highlight comment_ohad_sblue ctermfg=blue guifg=SlateBlue
highlight comment_ohad_violet ctermfg=blue guifg=violet

"syntax match Special  /[\\\/;#]/
syntax match Special  /[\\\/#]/
syntax match Number  /\d/
syntax region Comment start="//" end="$"  

syntax region comment_ohad_magenta start="("  end=")"
syntax region comment_ohad_blue_bg start="\""  end="\""
syntax region comment_ohad_cyan start="\["  end="\]"
syntax region comment_ohad_red start="{"  end="}"
syntax match comment_ohad_blue_bg /;/
syntax match comment_ohad_yellow  /+/
syntax region comment_ohad_orange start="\~"  end="\~"
syntax region comment_ohad start="^=="  end="$"
syntax region comment_ohad start="--"  end="$"
"syntax match comment_ohad  /|/
syntax match comment_ohad_red /|/
syntax match comment_ohad_blue  /\<v\>/
syntax match comment_ohad_red  /\<x\>/
syntax match comment_ohad  /\<[A-Z][A-Z0-9_]\+\>/
syntax region comment_ohad_2 start="^///\-" end="^///\.$"
syntax region comment_ohad_yellow start="/\*"hs=e+1 end="\*/"he=s-1
syntax match comment_ohad_cyan  /\./
syntax match comment_ohad_cyan  /\,/
syntax region comment_ohad_orange start="^//-" end="$"
syntax region comment_ohad_seagreen start="^http://www\." end="$"
syntax region comment_ohad_brown start="$[{]*\w" end="[\/\\;, \$]"

"syn match   ohadVerilogOperator "[&|~><!)(#%@+/?:;}{\^\[\]]"


if version >= 508 || !exists("did_ohd_syntax_inits")
  if version < 508
    let did_ohd_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlighting.
  HiLink ohadKeywords          comment_ohad_violet
"  HiLink ohadVerilogOperator   Special

  delcommand HiLink
endif


