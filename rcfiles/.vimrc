
"set ai sm nu ru noaw terse noic

set background=dark
set tabstop=4
set shiftwidth=4
set backspace=2

set showmatch


" buffer managemant: 
" bb buffer list
" b1..b9 goto buffer 1..9
" bq quit current buffer
:map bb :buffers
:map b1 :buffer 1
:map b2 :buffer 2
:map b3 :buffer 3
:map b4 :buffer 4
:map b5 :buffer 5
:map b6 :buffer 6
:map b7 :buffer 7
:map b8 :buffer 8
:map b9 :buffer 9
:map b0 :buffer 10
:map b- :buffer 11
:map b= :buffer 12
:map b\ :buffer 13
:map b` :buffer 14
:map bq :bdelete



"========== insert '#' at start of current line
map ##      :s/^/\#/
"========== insert ';' at start of current line
map ;;      :s/^/\;/
"========== insert '%' at start of current line
map %%      :s/^/\%/
"========== insert '//' at start of current line
map @@      :s/^/\/\//
"========== remove '#' from start of current line
map #!      :s;^\#;;
"========== insert '*' at start of current line
map *(      :s;^;\*;
"========== remove '*' from start of current line
map *)      :s;^\*;;
"========== enclose line with '/*' '*/'
map **      :s;^.*$;\/\* & \*\/;
"========== remove '/*' '*/'
map *!      :s;\/\* ;;:s; \*\/;;


map vv : set syntax=systemverilog<ENTER>



"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
":map <2-LeftMouse> za



set noequalalways " disable equale window resizing
set wmh=0         " This sets the minimum window height to 0, so you can stack many more files before things get crowded
set nocp          " nocompatible - This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice.
set number        " show line numbers
set showcmd       " This shows what you are typing as a command.
set wrap
set autochdir     " this automatically changes the dir

" Make use of the 'status line' to show possible completions of command line commands, file names, and more.
set wildmenu
set wildmode=list:longest,full


set mouse=a " Enable mouse support in console


" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase


"set autoindent
filetype plugin indent on

colorscheme mustang

set guifont=Bitstream\ Vera\ Sans\ Mono\ 12

set scroll=9
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set t_Co=256
let g:airline_powerline_fonts = 0


"map <C-R> <A-Up> : 
