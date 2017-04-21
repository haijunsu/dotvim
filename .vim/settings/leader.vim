" Pick a leader key
let mapleader = ","
let g:mapleader = ","

" Show indent guides 
nmap <leader>i :IndentGuidesToggle<CR>

" Make tabs look nicer when list is on
nmap <leader>l :set list!<CR>
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" Turn on line numbers
nmap <leader>n :set number!<CR>

" Insert PDB debug statement
map <leader>b :call InsertRPDB()<CR>

" delete trailing space
nnoremap <Leader>dtw :%s/\s\+$//e<CR>

" clear search result
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Fast saving
nmap <leader>w :w!<cr>

"  :W sudo saves the file
"  (usefull for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>rm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

