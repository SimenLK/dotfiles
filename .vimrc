" This is a test comment
execute pathogen#infect()
filetype plugin indent on

" Tap options - 4 spaces
set shiftwidth=4
set tabstop=4

" Indenting
set cindent

" Syntax highlighting
syntax on

" Show matching brackets
set showmatch

" Show line numbers
set number

" Do not wrap lines
set nowrap

" Split
set splitright

" Latex settings
autocmd FileType tex setlocal wrap spell

" Colorscheme
colorscheme desert

" keybinds
nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <s-Tab> :bprev<CR>:redraw<CR>:ls<CR>

inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l

" C keybindings
autocmd FileType c inoremap ,for <Esc>:-1read $HOME/.vim/skeleton/.forloop.c<CR>V3j=<Esc>f<la


" Syntastic
" Temp options
