" My personal vimrc

" - Tabs/Spaces -
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set expandtab
set listchars=tab:>-,trail:.,extends:>
set list
set noswapfile

" - Line numbers -
set number

" - Disable Cursorkeys -
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" - Search -
set ignorecase
set smartcase
set incsearch

" - Backspace behavior -
set backspace=indent,eol,start

" - etc -
set noswapfile
set autoread
let mapleader = ","
map <Leader>p <C-^> " Go to previous file
map <Leader>w :w!<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|log\|tmp\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" - NERDTree -
" Auto close if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <Leader>-n to nerdtree
map <Leader>n :NERDTreeToggle<CR>

" - Vundle -
filetype off "required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" -------------
" -- Plugins --
" -------------

" - Plugin management -
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-pathogen'

" - Git -
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" - Getting around -
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" - Minitest -
Bundle 'fheemeyer/vim-ruby-minitest'
set completefunc=syntaxcomplete#Complete

" - tmux & zeus -
Bundle 'benmills/vimux'
Bundle 'jingweno/vimux-zeus'
map <Leader>zc :ZeusConsole<CR>
map <Leader>zr :ZeusRake<CR>
map <Leader>zz :ZeusTest %<CR>
map <Leader>zi :VimuxInspectRunner<CR>
map <Leader>zq :VimuxCloseRunner<CR>

" - Node.js -
Bundle 'juvenn/mustache.vim'
Bundle 'moll/vim-node'
Bundle 'pangloss/vim-javascript'

" - Other stuff -
Bundle 'jnwhiteh/vim-golang'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'othree/html5.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'skwp/greplace.vim'

filetype plugin indent on

" - Pathogen -
execute pathogen#infect()

" - Colorization"
syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
let g:solarized_termcolors=256
