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
set hlsearch
set incsearch
set si
set wrap
set ai

function! HasPaste()
  if &paste
    return 'PASTE MODE '
  en
    return ''
endfunction
