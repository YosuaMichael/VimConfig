"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle config start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'croaker/mustang-vim.git'
Plugin 'fs111/pydoc.vim'
Plugin 'hdima/python-syntax'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kien/ctrlp.vim'
Plugin 'lepture/vim-jinja'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'oplatek/Conque-Shell'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'vim-scripts/cmdalias.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'xuhdev/SingleCompile'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle config end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"tab settings
set tabstop=4       "a tab is four spaces
set shiftwidth=4    "number of spaces to use for autoindenting
set shiftround      "use multiple of shiftwidth when indenting with '<' and '>'
set expandtab       "convert tabs to spaces
set smarttab        "insert tabs on the start of a line according to shiftwidth, not tabstop

"enable backspace on some computers
set backspace=indent,eol,start

"case settings
set ignorecase      "ignore case
set smartcase       "override ignore case when pattern has uppercase characters

"indent settings
set autoindent
set smartindent

"search settings
set hlsearch        "highlight search terms
set incsearch       "show search matches as you type

"backup settings
set nobackup
set nowritebackup
set noswapfile

"wildmenu settings
set wildmenu
set wildmode=list:longest,full

"ignore some files
set wildignore+=*.o,*.out,*.so,*.swp,*.zip

"colorscheme settings
colorscheme mustang

"misc settings
set tildeop         "use ~ like an operator
set ruler           "enable ruler
set laststatus=2    "status line
set guifont=Courier\ 10\ Pitch\ 10
set title           "change the terminal's title
set visualbell      "don't beep
set noerrorbells    "don't beep
set vb t_vb=        "don't flash
set nowrap          "don't wrap lines
set number          "show line number
set mouse=a         "enable mouse
set t_Co=256        "enable terminal colors
set diffopt=filler,vertical
filetype plugin indent on
"set paste          "no autoindent, useful when pasting
"set nopaste        "turn autoindent back on
set cursorline      "enable cursorline
set cursorcolumn    "enable cursorcolumn
set encoding=utf-8  "utf-8

"update vim setting after saving .vimrc
"if has("autocmd")
    "autocmd bufwritepost .vimrc source $MYVIMRC
"endif

"remap settings
let mapleader=","
nnoremap ,, ,

"Tab for next buffer
"Shift-Tab for previous buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"easier movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"bind omni-completion to ctrl+space
inoremap <Nul> <C-x><C-o>

"ycw --> yank inner word to clipboard
"ycy --> yank line to clipboard
"yc --> visual mode yank
"ycp --> paste from clipboard
nnoremap <silent> ycw "+yiw
nnoremap <silent> ycy "+yy
vnoremap <silent> yc "+y
nnoremap <silent> ycp "+p

"space -> :
nnoremap <space> :

",ss --> turn syntax back on
nnoremap <silent> <Leader>ss :syntax off<CR>:syntax on<CR>

"EasyMotion, force color
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

"NERDTree
noremap <silent> <Leader>nt :NERDTreeToggle<CR>
"Disable changing buffer by tabs in NERDTree
autocmd FileType nerdtree nnoremap <buffer> <Tab> <nop>
autocmd FileType nerdtree nnoremap <buffer> <S-Tab> <nop>

"Tagbar
noremap <silent> <Leader>tb :TagbarToggle<CR>

"ConqueTerm
nnoremap <silent> <Leader>bash :ConqueTermSplit bash<CR>

"NERDCommenter
let NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nnoremap <silent> <Leader>nct :call NERDComment("n", "toggle")<CR>
vnoremap <silent> <Leader>nct :call NERDComment("x", "toggle")<CR>
nnoremap <silent> <Leader>ncn :call NERDComment("n", "nested")<CR>
vnoremap <silent> <Leader>ncn :call NERDComment("x", "nested")<CR>
nnoremap <silent> <Leader>ncu :call NERDComment("n", "uncomment")<CR>
vnoremap <silent> <Leader>ncu :call NERDComment("x", "uncomment")<CR>

"SingleCompile
nnoremap <F9> :SCCompile<CR>
nnoremap <F10> :SCCompileRun<CR>
let g:SingleCompile_showquickfixiferror = 1

"A.vim
let g:alternateExtensions_cc = "hh"
let g:alternateExtensions_hh = "cc"

"airline
let g:airline#extensions#tabline#enabled = 1

"bufkill as default
autocmd VimEnter * call CmdAlias('bd', 'BD')

"Turn off omni-completion window on select or move
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go autocmd BufWritePre <buffer> Fmt
