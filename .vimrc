" This is a test comment
execute pathogen#infect()
filetype plugin indent on

" Tap options - 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab

" Indenting
autocmd FileType c set cindent

" Syntax highlighting
syntax on

" Colorscheme
colorscheme desert

" Show matching brackets
set showmatch
highlight MatchParen ctermbg=green

" Show line numbers
set number
set relativenumber

" Text width
set textwidth=80
set colorcolumn=+1
hi ColorColumn ctermbg=0

" Whitespace and tabs
set listchars=tab:☞☞,nbsp:_,trail:⋅
set list

" Do not wrap lines
set nowrap

" Split
set splitright
set splitbelow

" Wildmenu
" set wildmenu
set wildmode=list:longest,full

" Latex settings
" NB: Don't need it because of spell shortcuts
autocmd FileType tex setlocal wrap

" keybinds
nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <s-Tab> :bprev<CR>:redraw<CR>:ls<CR>

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

map <C-N> :NERDTreeToggle<CR>

nnoremap <C-c> <C-w>c
inoremap jk <Esc>

map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :setlocal spell! spelllang=nb<CR>

" Goyo
map <F10> :Goyo<CR>

" youcompleteme
let g:ycm_min_num_of_chars_for_completion = 3
" Temp, try again later
let g:loaded_youcompleteme = 1

" TeX shortcuts
autocmd FileType tex nnoremap <C-b> :w<CR> :! pdflatex %<CR>

" Not optimal when manually tabbing
autocmd FileType c inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l

" C settings

" C snippets
autocmd FileType c inoremap ,f <Esc>:-1read $HOME/.vim/skeleton/.forloop.c<CR>Vj=<Esc>f<la
autocmd FileType c inoremap ,i <Esc>:-1read $HOME/.vim/skeleton/.iftest.c<CR>Vj=<Esc>f(a
autocmd FileType c inoremap ,e <Esc>:-1read $HOME/.vim/skeleton/.else.c<CR>Vj=<Esc>o
autocmd FileType c inoremap ,ie <Esc>:-1read $HOME/.vim/skeleton/.ifelse.c<CR>V4j=<Esc>f(a
autocmd FileType c inoremap ,ei <Esc>:-1read $HOME/.vim/skeleton/.elseif.c<CR>V4j=<Esc>f(a
autocmd FileType c inoremap ,s <Esc>:-1read $HOME/.vim/skeleton/.switch.c<CR>V16j=<Esc>f(a

autocmd FileType c inoremap ,w while()<CR><++><Esc>kf(a


" Statusline 

set laststatus=2

hi StatusLine ctermfg=8 ctermbg=3 cterm=NONE
hi StatusLineNC ctermfg=2 ctermbg=8 cterm=NONE

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#CursorColumn#
set statusline+=%{StatuslineGit()}
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=\ %2*[%M%R%H%W]%*
" Right side of statusline 
set statusline+=%#PmenuSel#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
