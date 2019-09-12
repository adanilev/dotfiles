"be able to use the mouse
set mouse=a

"syntax highlighting on
syntax on

"display incomplete commands
set showcmd

"a better menu in command mode
set wildmenu
set wildmode=longest:full,full

"disable soft wrap for lines
set nowrap

"use hybrid relative line numbers
set number relativenumber
"make the line numbers grey
highlight LineNr ctermfg=grey

"highlight the current line in the active window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"always set autoindenting on
set autoindent

"incremental search
set incsearch
"highlight search
set hlsearch
"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set smartcase

"use 2 spaces for tabs
set expandtab
set tabstop=2
set shiftwidth=2

"new splits will be at the bottom or to the right side of the screen
set splitbelow
set splitright

"decrease timeout to make status bar reflect faster
set ttimeoutlen=10

"NERDTree config
let NERDTreeShowHidden=1

"vim-airline config
"show tabline at top
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

"make switching windows easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"make shift-tab do the opposite of tab
inoremap <S-Tab> <C-d>

"remap keys for christoomey/vim-system-copy plugin
nmap Y <Plug>SystemCopy
xmap Y <Plug>SystemCopy
nmap P <Plug>SystemPaste

"easier tab switching
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>
