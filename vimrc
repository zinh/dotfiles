execute pathogen#infect()
syntax on
filetype plugin indent on
set background=dark
colorscheme solarized
map <C-n> :NERDTreeFind<CR>
map <C-Left> :tabprevious<CR>
map <C-Left> :tabnext<CR>
set expandtab
set shiftwidth=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Search relate
set hlsearch
set incsearch

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>
" Set copy to system clipboard
map <leader>c "+y

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Set to auto read when a file is changed from the outside
set autoread

function! HasPaste()
  if &paste
    return 'PASTE MODE '
  en
    return ''
endfunction
