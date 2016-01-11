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

" - encoding -
set encoding=utf-8

" - Line numbers / highlighting -
set number
set cursorline

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
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\|log\|tmp\|node_modules\|_build\|bower_components\|vendor\|dist$',
  \ 'file': '\.exe$\|\.so$\|\.dat\|\.gem$'
  \ }

" - Force writing file as root -
cmap w!! w !sudo tee > /dev/null %

" - Reopen file (to e.g. reload .vimrc) -
cmap reload !vim %
map <Leader>r :reload<CR>

" - Toggle paste mode with ,z -
set pastetoggle=<leader>z

au BufNewFile,BufRead *.tag setlocal ft=javascript

" - windows creation -
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

" - NERDTree -
" Auto close if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <Leader>-n to nerdtree
map <Leader>n :NERDTreeToggle<CR>

" - Required for vundle -
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" -------------
" -- Plugins --
" -------------

" - Plugin management -
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-pathogen'

" - Git -
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" - Getting around -
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" - Minitest -
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tonekk/vim-ruby-capybara'
set completefunc=syntaxcomplete#Complete

" - tmux & spring -
Plugin 'benmills/vimux'
" map <leader>t :call VimuxRunCommand("clear && bin/spring rake test TEST=" . expand("%"))<CR>

" - Javascript -
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'moll/vim-node'
Plugin 'burnettk/vim-angular'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,ember'

" - Ruby / Rails -
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'slim-template/vim-slim'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'tonekk/vim-binding-pry'

" - Other language-related stuff -
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'tpope/vim-haml'
Plugin 'jlong/sass-convert.vim'
Plugin 'nicklasos/vim-jsx-riot'

" - Snippets -
Plugin 'honza/vim-snippets'

" - Vim Extensions -
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
" Map <F5> to undotree
nnoremap <F5> :UndotreeToggle<cr>
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}


call vundle#end()
filetype plugin indent on

" - Pathogen -
execute pathogen#infect()

" - Colorization"
syntax enable
colorscheme Tomorrow-Night-Eighties

" - Persistent undo"
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
