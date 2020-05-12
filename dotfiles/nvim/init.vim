colorscheme nord       " theme

set mouse=a            " use the mouse 

set confirm            " confirm before unsafe actions

set nowrap             " disable soft wrap for lines
set nu rnu             " use hybrid relative line numbers
set hidden             " allow switching away from edited buffers

set incsearch          " incremental search
set hlsearch           " highlight search
set ignorecase         " searches are case insensitive 
set smartcase          " ...unless they contain at least one capital letter

set expandtab          " use 2 spaces for tabs
set tabstop=2
set shiftwidth=2

set splitbelow         " new splits will open to the bottom 
set splitright         " ...or to the right side of the current window

set updatetime=500     " makes vim-gitgutter update more quickly

set signcolumn=yes     " always show the gutter
set diffopt+=vertical  " open vertical diff splits

" filetype plugin on  " turn on plugins based on filetype

" map leader to space
let mapleader="\<Space>"

" invoke vim commands more easily
nmap ; :

" remove search highlight
nnoremap <Leader><Space> :nohlsearch<CR>

" make switching windows easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make switching tabs easier
nnoremap <Leader>tn :tabnew<Space>
nnoremap <Leader>tk :tabnext<CR>
nnoremap <Leader>tj :tabprev<CR>

" make switching buffers easier
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>d :bp<CR>:bd #<CR>

" resize windows
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" make shift-tab do the opposite of tab
inoremap <S-Tab> <C-d>

"     plugin configs
""""""""""""""""""""""""""

" remap keys for christoomey/vim-system-copy plugin
nmap cy <Plug>SystemCopy
xmap cy <Plug>SystemCopy
nmap cp <Plug>SystemPaste

"vim-airline configs
let g:airline_powerline_fonts = 1

""""" NERDTree
" toggle the drawer
map <Leader>b :NERDTreeToggle<CR>
" go to current file in drawer
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
" delete the buffer when i delete a file from nertree
let NERDTreeAutoDeleteBuffer = 1
" make pretty
let NERDTreeMinimalUI = 1
let NERDTreeStatusline = ""
" show dot files
let NERDTreeShowHidden=1
" quit vim if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""" nerdcommenter config
" comment on the far left
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" remap fzf trigger
nnoremap <silent> <C-p> :FZF<CR>

" ReplaceWithRegister
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual

""""" coc config
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" always open the quickfix / renaming window full-width at the bottom of the screen
autocmd FileType qf wincmd J

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
