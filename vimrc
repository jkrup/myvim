" Basic stuff
set nocompatible
set noexrc

" Pathogen
execute pathogen#infect()

"Syntax and Indentation
syntax on
filetype plugin indent on


"" Pretty stuff
set background=dark
colorscheme desert
highlight clear SignColumn " Make gutter invisible

"" mappings {
inoremap <C-E> <End>
inoremap <C-A> <Home>
nnoremap ; :
let mapleader=","
nnoremap <S-space> <C-y>
nnoremap <space> <C-e>
map <esc>t <esc>:NERDTree<CR>
map <left> <esc><C-w>h
map <up> <esc><C-w>k
map <right> <esc><C-w>l
map <down> <esc><C-w>j
nmap <silent> <leader>a ggVG"+y<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>v :call ToggleCursorColumn()<CR>
set pastetoggle=<F2>
"nnoremap j gj
"nnoremap k gk
"use arrow keys to navigate windows/buffers
nmap <silent> ,/ :nohlsearch<CR>

"map <leader>F :FufFile<CR>
"map <leader>f :FufTaggedFile<CR>
"map <leader>s :FufTag<CR>
"" }


"" Vim Behaviours {
set hidden          "hides buffers instead of closing (forcing save)
"set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
set nowrap          " don't wrap lines
set expandtab
set tabstop=4       " a tab is four spaces
set backspace=indent,eol,start
"" allow backspacing over everything in insert mode
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set nu              " always show line numbers
set shiftwidth=2    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
""set showmatch       " show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if searchpattern is all lowercase, case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set nobackup
set directory=~/.vim/tmp
set fileformats=unix,mac,dos
set mouse=a
set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildmenu
set wildignore=*.swp
set title           " change the terminal's title
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " show tabs and trailing
set iskeyword+=\- "autocomplete hyphens
""set makeprg=rake " set make to rake

""autocmd BufEnter * :syntax sync fromstart
""autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec
""autocmd BufReadPost,BufNewFile *_spec.rb setlocal commentstring=#\ %s

""au BufWinLeave * silent! mkview
""au BufWinEnter * silent! loadview
""au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
"" }

""Airline
set laststatus=2

""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"" Toggle the cursor column when typing <leader>v
function! ToggleCursorColumn()
  if &cursorcolumn
    set nocursorcolumn
  else
    set cursorcolumn
  endif
endfunction

function! s:goyo_enter()
  silent !tmux set status off
  "set noshowmode
  "set noshowcmd
  "set scrolloff=999
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  "set showmode
  "set showcmd
  "set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
