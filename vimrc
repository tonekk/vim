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
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" - NERDTree -
" Auto close if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <Leader>n :NERDTreeToggle<CR>

" - Vundle -
filetype off "required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" - Plugins -
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'

" - Node.js -
Bundle 'juvenn/mustache.vim'
Bundle 'moll/vim-node'
Bundle "pangloss/vim-javascript"

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
