set term=xterm-256color
syntax enable
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

filetype on
filetype plugin on
filetype indent on

set cc=80
set laststatus=2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.git/*

set foldmethod=indent
set nofoldenable

set guioptions-=T
set ruler
set autochdir
set nocp

if has("gui_running")
    set number
endif

syntax on
set showcmd

"indetation stuff
set autoindent
set smartindent

" spaces instead of tabs - 4 thereof
set tabstop=4
set shiftwidth=4

set softtabstop=4
set expandtab
set nocompatible

set nobackup
set noswapfile

"Allow backspace to delete stuff from outside this session
set backspace=2
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

"show matching braces
set showmatch

" blowfish encryption
set cm=blowfish

" searching
set hlsearch
set incsearch
let &hlsearch=1
set ignorecase
set smartcase
set showmatch

set nowrap

noremap % v%

"Allow hidden buffers
set hidden

let g:netrw_banner = 0

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move up/down editor lines
nnoremap j gj
nnoremap k gk


" Use Unix as the standard file type
set ffs=unix,dos,mac

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

autocmd Filetype gitcommit setlocal spell textwidth=72

augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%121v.*/
    autocmd FileType python set nowrap
augroup END

" set highlight current line
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END


