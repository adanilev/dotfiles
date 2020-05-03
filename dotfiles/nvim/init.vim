"be able to use the mouse
set mouse=a

"theme
colorscheme nord

"disable soft wrap for lines
set nowrap

"confirm before unsafe actions
set confirm

"use hybrid relative line numbers
set number relativenumber

"allow switching away from edited buffers
set hidden

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

"turn on plugins based on filetype
"filetype plugin on

"netrw config
let g:netrw_liststyle = 3
nnoremap <C-O> :Ex!<CR>

"decrease timeout to make status bar reflect faster
"set ttimeoutlen=10

"vim-airline config
let g:airline_powerline_fonts = 1

"open vertical diff splits
set diffopt+=vertical

" invoke vim commands more easily
nmap ; :

" map leader to space
let mapleader="\<Space>"

"remove search highlight
nnoremap <Leader><Space> :nohlsearch<CR>

"make switching windows easier
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"make switching tabs easier
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

"make switching buffers easier
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>x :bdelete<CR>

" resize windows
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

"make shift-tab do the opposite of tab
inoremap <S-Tab> <C-d>

"remap keys for christoomey/vim-system-copy plugin
nmap cy <Plug>SystemCopy
xmap cy <Plug>SystemCopy
nmap cp <Plug>SystemPaste

"nerdcommenter config
"comment on the far left
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

"remap fzf trigger
nnoremap <silent> <C-p> :FZF<CR>

"ReplaceWithRegister
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual

""" coc config
"Use tab for trigger completion with characters ahead and navigate.
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

"Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
