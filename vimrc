" Begin Vundle Config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
" End Vundle config
set encoding=utf-8
syntax on
filetype plugin indent on
set background=dark
colorscheme solarized
set t_Co=256
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

" Set wild menu. Demo: :spe<tab><tab>
set wildmenu
set wildmode=list:longest,full

" Moving around viewport
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap VIM 0 to first non-blank character
map 0 ^

" Linebreak on 500 characters
set lbr
set tw=500

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" map <leader>t<leader> :tabnext<cr>
map <leader><tab> :tabnext<cr>

" Set copy to system clipboard
map <leader>c "+y
map <leader>p "+p

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Enable/Disable line number
nmap <leader>n :set invnumber<CR>

" Set to auto read when a file is changed from the outside
set autoread

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

function! HasPaste()
  if &paste
    return 'PASTE MODE '
  en
    return ''
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
