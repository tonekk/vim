﻿" Tabs/Spaces
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set expandtab
set listchars=tab:>-,trail:.,extends:>
set list
set noswapfile
set hidden

" encoding
set encoding=utf-8

" Line numbers / highlighting
set number
set cursorline

" Do not scroll at the end of view
set scrolloff=5

" Disable Cursorkeys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Search
set ignorecase
set smartcase
set incsearch

" Backspace behavior
set backspace=indent,eol,start

" etc
set noswapfile
set autoread
let mapleader = ","
map <Leader>p <C-^> " Go to previous file
map <Leader>w :w!<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\|log\|tmp\|berks-cookbooks\|node_modules\|_build\|bower_components\|vendor\|dist$',
  \ 'file': '\.exe$\|\.so$\|\.dat\|\.gem$'
  \ }
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>bx :CtrlPMixed<cr>

" handling buffers

" Open a new empty buffer
nmap <C-T> :enew<CR>
" Move to the next buffer
nmap <C-l> :bnext<CR>
" Move to the previous buffer
nmap <C-h> :bprevious<CR>
" Close the current buffer and move to the previous one
" Remapping control-c, because lol
nmap <C-c> :bp <BAR> bd #<CR>

" Force writing file as root
cmap w!! w !sudo tee > /dev/null %

" Reopen file (to e.g. reload .vimrc)
cmap reload !vim %
map <Leader>r :reload<CR>

" Toggle paste mode with ,z
set pastetoggle=<leader>z

au BufNewFile,BufRead *.tag setlocal ft=javascript

" windows creation
" * split window
nnoremap <Leader>s <c-w>s
" * vertical split window
nnoremap <Leader>v <c-w>v
" * close window
map <Leader>q :q<CR>

" Enable system clipboard yank
nnoremap <Leader>c "2y
nnoremap <Leader>v "2p

" window movement
noremap   <Up>     <C-w><C-k>
noremap   <Down>   <C-w><C-j>
noremap   <Left>   <C-w><C-h>
noremap   <Right>  <C-w><C-l>

" NERDTree
" Auto close if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <Leader>-n to nerdtree
map <Leader>n :NERDTreeToggle<CR>

" Use old regex engine, becasuse new one is slow with ruby
set re=1

" Required for vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" -------------
" -- Plugins --
" -------------

" Plugin management
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-pathogen'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Getting around
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" Javascript
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'

" Other language-related stuff
Plugin 'rstacruz/sparkup'
let g:vim_markdown_folding_disabled = 1
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'

" Syntax
Plugin 'w0rp/ale'
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['tslint'] }
let g:ale_fixers = { 'javascript': ['prettier']}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1

" Vim Extensions
Plugin 'tpope/vim-sensible'
Plugin 'yegappan/mru'
map <Leader>m :MRU<CR>
Plugin 'bling/vim-airline'
Plugin 'skwp/greplace.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-dispatch'
" Map <F5> to undotree
nnoremap <F5> :UndotreeToggle<cr>
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}


call vundle#end()
filetype plugin indent on

" Pathogen
execute pathogen#infect()

" Colorization
syntax enable
colorscheme Tomorrow-Night-Eighties

" Persistent undo
if has("persistent_undo")
  set undodir=~/etc/vim/undo
  set undofile
endif

" Golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go set listchars=tab:--
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" MacVim
set guioptions-=r
set guioptions-=L
