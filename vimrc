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
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\|log\|tmp\|node_modules\|bower_components\|vendor\|dist$',
  \ 'file': '\.exe$\|\.so$\|\.dat\|\.gem$'
  \ }

" - Force writing file as root -
cmap w!! w !sudo tee > /dev/null %

" - Reopen file (to e.g. reload .vimrc) -
cmap reload !vim %

" - Toggle paste mode with ,z -
set pastetoggle=<leader>z

au BufNewFile,BufRead *.tag setlocal ft=javascript

" - windows creation -
" * split window
nnoremap <Leader>s <c-w>s
" * vertical split window
nnoremap <Leader>v <c-w>v
" * close window
nnoremap <Leader>q <c-w>q

" window movement
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

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
map <leader>t :call VimuxRunCommand("clear && bin/spring rake test TEST=" . expand("%"))<CR>
map <leader>r :call VimuxRunCommand("clear && zet " . expand("%"))<CR>
map <leader>q :call VimuxCloseRunner()<CR>

" - Javascript -
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'moll/vim-node'
Plugin 'burnettk/vim-angular'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,ember'

" - Ruby / Rails -
Plugin 'tpope/vim-rails'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'slim-template/vim-slim'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'tonekk/vim-binding-pry'

" - Other language-related stuff -
Plugin 'jnwhiteh/vim-golang'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'tpope/vim-haml'
Plugin 'jlong/sass-convert.vim'
Plugin 'nicklasos/vim-jsx-riot'

" - Snippets -
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" - Vim Extensions -
Plugin 'bling/vim-airline'
Plugin 'skwp/greplace.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'

call vundle#end()
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
