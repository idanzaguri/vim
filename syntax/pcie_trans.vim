" Remove any old syntax stuff hanging around "
syn clear

syn match  pcieRed      ".*RawDlp.*"

" The default methods for highlighting.  Can be overridden later "
hi  pcieDarkMagenta guifg=DarkMagenta guibg=NONE gui=none
hi  pcieDarkYellow  guifg=DarkYellow  guibg=NONE gui=none 
hi  pcieDarkCyan    guifg=DarkCyan    guibg=NONE gui=none
hi  pcieDarkRed     guifg=DarkRed     guibg=NONE gui=none
hi  pcieDarkGreen   guifg=DarkGreen   guibg=NONE gui=none
hi  pcieDarkBlue    guifg=DarkBlue    guibg=NONE gui=none
hi  pcieRed         guifg=Red         guibg=NONE gui=none
hi  pcieLightRed    guifg=lightred    guibg=NONE gui=none
hi  pcieGreen       guifg=Green       guibg=NONE gui=none
hi  pcieBlue        guifg=Blue        guibg=NONE gui=none
hi  pcielightBlue   guifg=lightBlue   guibg=NONE gui=bold
hi  pcieCyan        guifg=Cyan        guibg=NONE gui=none

"hi  pcieDarkMagenta guifg=DarkMagenta guibg=NONE gui=bold
"hi  pcieDarkYellow  guifg=DarkYellow  guibg=NONE gui=bold  
"hi  pcieDarkCyan    guifg=DarkCyan    guibg=NONE gui=none
"hi  pcieDarkRed     guifg=DarkRed     guibg=NONE gui=bold
"hi  pcieDarkRedUL   guifg=DarkRed     guibg=NONE gui=bold,underline
"hi  pcieDarkGreen   guifg=DarkGreen   guibg=NONE gui=bold
"hi  pcieDarkBlue    guifg=DarkBlue    guibg=NONE gui=bold
"hi  pcieRed         guifg=Red         guibg=NONE gui=bold
"hi  pcieLightRed    guifg=lightred    guibg=NONE gui=bold
"hi  pcieRedUL       guifg=Red         guibg=NONE gui=bold,underline
"hi  pcieGreen       guifg=Green       guibg=NONE gui=bold
"hi  pcieBlue        guifg=Blue        guibg=NONE gui=bold
"hi  pcieCyan        guifg=Cyan        guibg=NONE gui=bold
