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

" Wildmenu
set wildmenu
" set wildmode=list:longest,full

" Latex settings
" NB: Don't need it because of spell shortcuts
"autocmd FileType tex setlocal wrap spell

" Colorscheme
colorscheme desert

" keybinds
nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <s-Tab> :bprev<CR>:redraw<CR>:ls<CR>

map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :setlocal spell! spelllang=nb<CR>

" Goyo
map <F10> :Goyo<CR>

" TeX shortcuts
autocmd FileType tex nnoremap <C-b> :w<CR> :! pdflatex %<CR>

" Not optimal when manually tabbing
inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l

" C settings

" C snippets
autocmd FileType c inoremap ,f <Esc>:-1read $HOME/.vim/skeleton/.forloop.c<CR>V3j=<Esc>f<la
autocmd FileType c inoremap ,i <Esc>:-1read $HOME/.vim/skeleton/.iftest.c<CR>V3j=<Esc>f(a
autocmd FileType c inoremap ,e <Esc>:-1read $HOME/.vim/skeleton/.else.c<CR>V3j=<Esc>1jo
autocmd FileType c inoremap ,ie <Esc>:-1read $HOME/.vim/skeleton/.ifelse.c<CR>V7j=<Esc>f(a
autocmd FileType c inoremap ,ei <Esc>:-1read $HOME/.vim/skeleton/.elseif.c<CR>V7j=<Esc>f(a

autocmd FileType c inoremap ,w while()<CR>{<CR><++><CR>}<Esc>3kf(a


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


" Syntastic

" Default
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
