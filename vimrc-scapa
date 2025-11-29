execute pathogen#infect()

set t_Co=256

if has('gui_running')
    set background=light
    set guioptions-=T
    colorscheme solarized
    map <silent> <F11>
    \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
else
    colorscheme monokai
endif

set nocompatible
set number
set showcmd
set laststatus=2
set history=200

syntax on

filetype plugin on
filetype indent on

" automatically use prolog syntax highlighting for .pl files
autocmd Filetype pl set ft=prolog

" automatically use markdown syntax highlighting for .md files
autocmd BufRead,BufNewFile *.md set filetype=markdown

" replace tab by four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" For some files I want two spaces tab lengths
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

" show an 80 char column for a bunch of filetypes
autocmd FileType python,bash,lisp,cpp set colorcolumn=80

" disable color column for these files:
autocmd FileType htmldjango,html,css,javascript,text set cc=
autocmd FileType markdown,mkd,md,text set cc= 

set backspace=2
" print to student printer
set printdevice=sl1-1
set printoptions=number:y,wrap:y

set dictionary=/usr/share/dict/words
set suffixesadd=.pl,.java,.c,.cpp,.m

" indent options
set autoindent
" set smartindent

" highlight the search results
set hls
" show the `best match so far' as search strings are typed:
set incsearch

" Change j and k behavior to move through rows on the screen, not lines
nmap j gj
nmap k gk

vmap > >gv
vmap < <gv

" temporary files
set directory=~/tmp,.,/var/tmp,/tmp

" quickly open your .vimrc
map <F9> :sp ~/.vimrc<Enter>
"
" Mapping Ctrl-Enter to opening Quickfix list
map <C-CR> <CR>:copen<CR>

" up and down arrow keys work as expected when lines are wrapped
map <Up> g<Up>
map <Down> g<Down>

" Ctrl-C and Esc behave slightly different. Ctrl-C skips the InsertLeave
" command and goes straight to normal mode. This shortcut makes the behave the
" same
vnoremap <C-c> <Esc>
" Set line numbers
nmap \n :setlocal number!<CR>
" Set paste mode
nmap \p :set paste!<CR>
" Set nohl
nmap \l :nohlsearch<CR>

" =============== BUFFERS =================

" Save undo history when switching buffers
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Go to previous buffer 
nmap <leader>bb :b#<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

""""" Plugins configuration

nmap ; :CtrlPBuffer<CR>

""""" Syntastic configuration

:nmap \t :NERDTreeToggle<CR>
:nmap \f :NERDTreeFind<CR>


" Use python3
" let g:syntastic_python_python_exec = '/usr/bin/python3'

""""" Airline configuration

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'


let g:airline#extensions#tabline#enabled = 1

let g:vim_markdown_folding_disabled=1

" Writing prose 
"
"
let g:goyo_margin_top = -2
let g:goyo_margin_bottom = -2

function! s:goyo_enter()
    silent !tmux set status off
    set noshowmode
    set noshowcmd
"    set scrolloff=999
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    set showmode
    set showcmd
"    set scrolloff=5
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

set nocompatible
filetype plugin on       " may already be in your .vimrc

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"-- pandoc Markdown+LaTeX -------------------------------------------

function! s:MDSettings()
    " adjust syntax highlighting for LaTeX parts
    "   inline formulas:
    syntax region Statement oneline matchgroup=Delimiter start="\$" end="\$"
    "   mathjax math
    syntax region Statement matchgroup=Delimiter start="\$\$" end="\$\$" contains=Statement
    "   environments:
    syntax region Statement matchgroup=Delimiter start="\\begin{.*}" end="\\end{.*}" contains=Statement
    "   commands:
    syntax region Statement matchgroup=Delimiter start="{" end="}" contains=Statement
endfunction

autocmd FileType markdown :call <SID>MDSettings()

" ALE
" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 0
let g:airline#extensions#ale#enabled = 1

" read project-specific .vimrc files
set exrc
" do not allow autocmd commands from files not owned by me from here on
set secure 

" Thoughtbot: How to Do 90% of What Plugins Do (With Just Vim) https://www.youtube.com/watch?v=XA2WjJbmmoM

set path+=**

" Echo the relative path and current line of a file
command Curline echo join([expand('%'),  line(".")], ':')

" Display python docs
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" 2024/2/24
" insert current date (useful for journal)
nnoremap <leader>n o# <C-R>=strftime("%Y/%m/%d")<CR><CR><CR>
" Run python on current file
nnoremap <leader>py :!python %<CR>
" Run python on current selection
vnoremap <leader>py :!python<CR>
" Pretty-print currently selected JSON
vnoremap <leader>jq :!jq<CR>

nmap <silent> <C-j> :ALENext<cr>
nmap <silent> <C-k> :ALEPrevious<cr>

" 2025/07/04

" Only search git files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
" Find buffer
nmap <leader>bf :CtrlPBuffer<CR>
" Find file
nmap <leader>g :CtrlPMixed<CR>

" 2025/11/13
" Show current file name in shell title bar

set title
