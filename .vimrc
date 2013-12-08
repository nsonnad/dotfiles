set nocompatible

"========================================================
" NeoBundle
"========================================================

if has ('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \ 'windows': 'make -f make_mingw32.mak',
      \ 'cygwin': 'make -f make_cygwin.mak',
      \ 'mac': 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
      \ } }

"NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'

NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'MarcWeber/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ivanov/vim-ipython'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'danro/rename.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Valloric/YouCompleteMe' , { 'build': {
      \     'mac' : './install.sh',
      \    },
      \ } 

"============================
"Language specific
"===========================
NeoBundle 'hdima/python-syntax'

"tern is a js parser
NeoBundle 'marijnh/tern_for_vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'wookiehangover/jshint.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'cakebaker/scss-syntax.vim'

NeoBundleCheck

"============================
"SETTINGS
"=============================
syntax on
" Always splits to the right and below
set splitright
set splitbelow

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowriteall

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" Case insensitive search
set ignorecase
set smartcase

" Set sensible heights for splits
set winheight=50
" Setting this causes problems with :Unite -outline. Don't really need it
" set winminheight=5

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb="

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
set colorcolumn=+1

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

" Text display settings
set linebreak
set textwidth=80
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]

filetype plugin on
filetype plugin indent on

"dont tell me to save when switching buffers
set hidden
set relativenumber
set number
set expandtab tabstop=2 shiftwidth=2
set t_Co=256
" vim-seek leaping motions
let g:seek_enable_jumps = 1

"===============================================================================
" Leader Key Mappings
"===============================================================================

let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

nnoremap <Leader>`` :qa!<cr><F5>

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" <Leader>w: Close current buffer
nnoremap <Leader>w :bdelete<cr>

" <Leader>o: only
nnoremap <Leader>o :only<cr>

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! ~/dotfiles/.vimrc<cr>

" <Leader>s: Spell checking shortcuts
nnoremap <Leader>ss :setlocal spell!<cr>
nnoremap <Leader>sj ]s
nnoremap <Leader>sk [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=

" <Leader>,: Switch to previous split
nnoremap <Leader>, <C-w>p

nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
nnoremap <leader>s :w!<cr>
nnoremap <leader>a :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>th :tabprevious<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>t0 :tabfirst<cr>
nnoremap <leader>t$ :tablast<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>te :tabedit

""===============================================================================
" Normal Mode Shift Key Mappings
"===============================================================================

"U Redos since 'u' undos
nnoremap U :redo<cr>

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>


"===============================================================================
" Normal Mode Ctrl Key Mappings
"===============================================================================

" Ctrl-q: Visual block mode

" Ctrl-w: Window management

" Ctrl-e: Find (e)verything
nmap <c-e> [unite]f

" Ctrl-r: Command history using :Unite , this matches my muscle memory in zsh
nmap <c-r> [unite];

" Ctrl-y: Yanks
nmap <c-y> [unite]y

" Ctrl-p: Find MRU and buffers
nmap <c-p> [unite]u

" Ctrl-\: Quick outline
nmap <silent> <c-\> [unite]o

" Ctrl-u: Scroll half a screen up smoothly
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 1)<CR>

"============================
"MAPPINGS
"=============================
map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l

"Alt-h: Go to previous buffer
noremap ˙ :bprevious<CR>
"Alt-j: Move current line down
noremap ∆ mz:m+<cr>`z==
"Alt-k: Move current line up
noremap ˚ mz:m-2<cr>`z==
"Alt-l: Go to next buffer
noremap ¬ :bnext<CR>
"Alt-Shift-j: Duplicate line down
noremap Ô mzyyp`zj
"Alt-Shift-k: Duplicate line up
noremap  mzyyp`z

"============================
"COLORS
"=============================
NeoBundle 'Zenburn'
NeoBundle 'altercation/vim-colors-solarized'

:command Zenburn colorscheme zenburn
  \ | let g:indent_guides_auto_colors = 0
  \ | autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
  \ | autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

:command Solard set background=dark | colorscheme solarized
:command Solarl set background=light | colorscheme solarized

":Solarized
:Zenburn
noremap ⁄ :Zenburn<CR>
noremap € :Solarl<CR>
noremap ‹ :Solard<CR>

"============================
"PLUGIN MAPPINGS
"=============================
nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
call yankstack#setup()

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])
" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
" \ -buffer-name=files -prompt=%\ buffer file_mru bookmark file<CR>

" Quick commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>

" EasyMotion
" Tweak the colors
hi link EasyMotionTarget WarningMsg
hi link EasyMotionShade Comment

let g:EasyMotion_do_mapping = 0
" nnoremap <silent> <C-f>f :call EasyMotion#F(0, 0)<CR>
" nnoremap <silent> <C-f><C-f> :call EasyMotion#F(0, 1)<CR>
" nnoremap <silent> <C-f>t :call EasyMotion#T(0, 0)<CR>
" nnoremap <silent> <C-f><C-t> :call EasyMotion#T(0, 1)<CR>
nnoremap <silent> <C-f> :call EasyMotion#F(0, 0)<CR>
nnoremap <silent> <C-t> :call EasyMotion#T(0, 0)<CR>

"YouCompleteMe
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"Sneak
nmap f <Plug>SneakForward
nmap F <Plug>SneakBackward

"Fugitive
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gs :Gstatus<cr>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

" Gundo
nnoremap <F5> :GundoToggle<CR>

" UltiSnips
let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"                                       
let g:UltiSnipsJumpBackwardTrigger="<c-k>" 
let g:UltiSnips.always_use_first_snippet = 1
let g:UltiSnips.snipmate_ft_filter = {
            \ 'default' : {'filetypes': ["FILETYPE"] },
            \ 'javascript'    : {'filetypes': ["javascript"] },
            \ 'python': {'filetypes': ["python"] },}

