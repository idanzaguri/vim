" Remove any old syntax stuff hanging around "
syn clear

syn match  logWarning    "Warning: .\+"
syn match  logWarning    "^\[WARN\].\+"
syn match  logError      "^\[ERROR\].\+"

syn match  logWarning    "^Warning: .\+"
syn match  logError      "^Error: .\+"


"syn match  logDarkCyan   "^Note-\_.\{-}\n\s*\n"
"syn match  logWarning    "^Warning-\_.\{-}\n\s*\n"
"syn match  logError      "^Error-\_.\{-}\n\s*\n"

syn match  logDarkCyan   "^Note-.*"
syn match  logWarning    "^Warning-.*"
syn match  logError      "^Error-.*"

syn match  logWarning    "\*W,.\+"
syn match  logError      "\*E,.\+"

syn match  logDarkCyan   "^\*Denali\*.\+"
syn match  logWarning    "^\*Denali\* Warning: .\+"
syn match  logError      "^\*Denali\* Error: .\+"

syn match  logWarning    "^UVM_WARNING.\+"
syn match  logError      "^UVM_ERROR.\+"
syn match  logFatal      "^UVM_FATAL.\+"


syn match  AHBtrans      "\[AHB_Rd\]"
syn match  AHBtrans      "\[AHB_Wr\]"


syn match  pciePrints      "\S\+\.m_pcie_env\.\S\+"

"syn region logString  start=+"+  end=+"+  keepend

" The default methods for highlighting.  Can be overridden later "
hi        logDarkMagenta ctermfg=DarkMagenta ctermbg=NONE guifg=DarkMagenta guibg=NONE gui=bold
hi        logDarkYellow  ctermfg=DarkYellow  ctermbg=NONE guifg=DarkYellow  guibg=NONE gui=bold  
hi        logDarkCyan    ctermfg=DarkCyan    ctermbg=NONE guifg=DarkCyan    guibg=NONE gui=none
hi        logDarkRed     ctermfg=DarkRed     ctermbg=NONE guifg=DarkRed     guibg=NONE gui=bold
hi        logDarkRedUL   ctermfg=DarkRed     ctermbg=NONE guifg=DarkRed     guibg=NONE gui=bold,underline
hi        logDarkGreen   ctermfg=DarkGreen   ctermbg=NONE guifg=DarkGreen   guibg=NONE gui=bold
hi        logDarkBlue    ctermfg=DarkBlue    ctermbg=NONE guifg=DarkBlue    guibg=NONE gui=bold
hi        logRed         ctermfg=Red         ctermbg=NONE guifg=Red         guibg=NONE gui=bold
hi        logLightRed    ctermfg=Red        ctermbg=NONE guifg=lightred    guibg=NONE gui=bold
hi        logRedUL       ctermfg=Red         ctermbg=NONE guifg=Red         guibg=NONE gui=bold,underline
hi        logGreen       ctermfg=Green       ctermbg=NONE guifg=Green       guibg=NONE gui=bold
hi        logBlue        ctermfg=Blue        ctermbg=NONE guifg=Blue        guibg=NONE gui=bold
hi        logCyan        ctermfg=Cyan        ctermbg=NONE guifg=Cyan        guibg=NONE gui=bold
hi        AHBtrans       ctermfg=Blue        ctermbg=NONE guifg=Yellow       guibg=NONE gui=none
hi        pciePrints       ctermfg=Blue        ctermbg=NONE guifg=Cyan       guibg=NONE gui=none
hi  link  logSuccess     logBlue
hi  link  logError       logRed
hi  link  logWarning     logLightRed
hi  link  filelocation   logDarkBlue
hi  link  logSep         logGreen
hi  link  logSep         Separator  
hi  link  logGood        logDarkGreen
hi  link  logInfo        logSuccess 
hi  link  logData        Statement 
hi  link  logFatal       logError
hi  link  logDebug       logRedUL
hi  link  logQuoted1     Comment 
hi  link  logQuoted2     Type    
hi  link  logEmail       Special 
hi  link  logString      String  
