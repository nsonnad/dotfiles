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

"============================
"COLORS
"=============================
syntax enable
filetype off
"let base16colorspace=256

NeoBundle 'chriskempson/base16-vim'
:command Dark set background=dark | colorscheme base16-ocean
:command Light set background=light | colorscheme base16-solarized
:Dark

noremap ˆ :Dark<CR>
noremap ¬ :Light<CR>

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'

" Utilities
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'danro/rename.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ivanov/vim-ipython'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'MarcWeber/ultisnips'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Valloric/YouCompleteMe' , { 'build': {
      \     'mac' : './install.sh',
      \    },
      \ } 

" Utilities not being used
"============================
"NeoBundle 'vim-scripts/ShowMarks'
"NeoBundle 'mattn/gist-vim'
"NeoBundle 'mattn/webapi-vim'
"NeoBundle 'rizzatti/funcoo.vim'
"NeoBundle 'rizzatti/dash.vim'
"NeoBundle 'Lokaltog/vim-easymotion'

"============================
"Syntax highlighting
"===========================

"tern is a js parser
NeoBundle 'marijnh/tern_for_vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

NeoBundle 'hdima/python-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'

NeoBundle 'plasticboy/vim-markdown'
" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'wavded/vim-stylus'

"Check for new/updated bundles
NeoBundleCheck

" Auto-refrech vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"============================
"SETTINGS
"=============================
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

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Auto complete setting
set completeopt=longest,menuone

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=node_modules/**,bower_components/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/
set wildignore+=*/.nx/**,*.app

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
set colorcolumn=+1

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0"

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

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

filetype plugin on
filetype indent on

"dont tell me to save when switching buffers
set hidden
set relativenumber
set number
set expandtab tabstop=2 shiftwidth=2
" vim-seek leaping motions
let g:seek_enable_jumps = 1
"
"Better redrawing for large files
set ttyfast

"Disable the vbell
set visualbell t_vb="
set title

"Let backspace do what it's supposed to: allow backspace over indent, eol, and start of an insert
set backspace=indent,eol,start

"===============================================================================
" Function Key Mappings
"===============================================================================

" <F1>: Help
nmap <F1> [unite]h

" <F2>: Open Vimfiler

" <F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>

" <F4>: Save session
nnoremap <F4> :<C-u>UniteSessionSave

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

" Toggle display of unprintable characters
nnoremap <silent> <Leader>2 :set list!

" <Leader>w: Close current buffer
nnoremap <Leader>w :bdelete<cr>

" <Leader>o: only
nnoremap <Leader>o :only<cr>

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>e :e! /Users/nikhil/docs/dotfiles/.vimrc<cr>

:nmap <silent> <leader>d :Dark<cr>
:nmap <silent> <leader>l :Light<cr>

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
nnoremap <leader>A :wa!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>th :tabprevious<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>t0 :tabfirst<cr>
nnoremap <leader>t$ :tablast<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>te :tabedit

"Alt-g: Toggle gitgutter
noremap <leader>gg :GitGutterToggle<CR>
"Alt-g: Toggle gitgutter
noremap <leader>gu :GundoToggle<CR>
"Alt-n: Toggle numbers
nnoremap <silent> <leader>nn :set nonumber! \| set relativenumber!<cr>

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

" Make Y act like other uppercase commands
nnoremap Y y$"

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

" Tab: Go to matching element
nnoremap <Tab> %

" Ctrl-p: Find MRU and buffers
nmap <c-p> [unite]u

" Ctrl-\: Quick outline
nmap <silent> <c-\> [unite]o

"===============================================================================
" Visual Mode Key Mappings
"===============================================================================

" y: Yank and go to end of selection
xnoremap y y`]

" p: Paste in visual mode should not replace the default register with the
" deleted text
xnoremap p "_dP

" d: Delete into the blackhole register to not clobber the last yank. To 'cut',
" use 'x' instead
xnoremap d "_d

" \: Toggle comment
xmap \ <Leader>c<space>

"Backspace Delete selected and go into insert mode
xnoremap <bs> c

" Tab Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

" Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

"===============================================================================
" Normal Mode Key Mappings
"===============================================================================
" Up Down Left Right resize splits
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l

" Bubble single lines
nmap ˚ [e
nmap ∆ ]e

"Alt-h: Go to previous buffer
noremap ˙ :bprevious<CR>
"Alt-l: Go to next buffer
noremap ¬ :bnext<CR>
"Alt-Shift-j: Duplicate line down
noremap Ô mzyyp`zj
"Alt-Shift-k: Duplicate line up
noremap  mzyyp`z

"===============================================================================
" NERDTree
"===============================================================================

nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

"===============================================================================
" Unite 
"===============================================================================

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

" Start in insert mode
let g:unite_enable_start_insert = 1
let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

"===============================================================================
" GitGutter
"===============================================================================
let g:gitgutter_eager=0

"===============================================================================
" EasyMotion
"===============================================================================

" Tweak the colors
"hi link EasyMotionTarget WarningMsg
"hi link EasyMotionShade Comment

"let g:EasyMotion_do_mapping = 0
" nnoremap <silent> <C-f>f :call EasyMotion#F(0, 0)<CR>
" nnoremap <silent> <C-f><C-f> :call EasyMotion#F(0, 1)<CR>
" nnoremap <silent> <C-f>t :call EasyMotion#T(0, 0)<CR>
" nnoremap <silent> <C-f><C-t> :call EasyMotion#T(0, 1)<CR>
"nnoremap <silent> <C-f> :call EasyMotion#F(0, 0)<CR>
"nnoremap <silent> <C-t> :call EasyMotion#T(0, 0)<CR>

"===============================================================================
" YouCompleteMe
"===============================================================================
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"===============================================================================
" Sneak
"===============================================================================
" Trying the defaults, but I may miss `s`

"===============================================================================
" Fugitive
"===============================================================================
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gs :Gstatus<cr>


"===============================================================================
" Airline
"===============================================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

set laststatus=2

" Short mode letters
if !exists('g:airline_mode_map')
    let g:airline_mode_map = {}
endif

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

"===============================================================================
" Syntastic
"===============================================================================
" specify which checkers to use
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffee_checkers = ['coffeelint']
"let g:syntastic_less_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Check on buffer open
let g:syntastic_check_on_open = 1"


"===============================================================================
" Emmet
"===============================================================================
" only use for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"===============================================================================
" UltiSnips
"===============================================================================

let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"                                       
let g:UltiSnipsJumpBackwardTrigger="<c-k>" 

let g:UltiSnips.always_use_first_snippet = 1
let g:UltiSnips.snipmate_ft_filter = {
            \ 'default' : {'filetypes': ["FILETYPE"] },
            \ 'javascript'    : {'filetypes': ["javascript"] },
            \ 'python': {'filetypes': ["python"] },}

"
"===============================================================================
" R
"===============================================================================
let vimrplugin_r_path = "/usr/local/bin/R"
" Press the space bar to send lines (in Normal mode) and selections to R:
"vmap <Space> <Plug>RDSendSelection
"nmap <Space> <Plug>RDSendLine
"===============================================================================
" Custom commands
"===============================================================================
:command Ipysource source ~/docs/dotfiles/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

