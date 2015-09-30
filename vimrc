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
Bundle 'tonekk/vim-ruby-minitest'
Bundle 'tonekk/vim-ruby-capybara'
set completefunc=syntaxcomplete#Complete

" - tmux & spring -
Bundle 'benmills/vimux'
map <leader>t :call VimuxRunCommand("clear && bin/spring rake test TEST=" . expand("%"))<CR>
map <leader>r :call VimuxRunCommand("clear && zet " . expand("%"))<CR>
map <leader>q :call VimuxCloseRunner()<CR>

" - Javascript -
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'moll/vim-node'
Bundle 'burnettk/vim-angular'
Bundle 'matthewsimo/angular-vim-snippets'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine,ember'

" - Other stuff -
Bundle 'jnwhiteh/vim-golang'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'othree/html5.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'skwp/greplace.vim'
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'tmux-plugins/vim-tmux'
Bundle 'dsawardekar/wordpress.vim'
Bundle 'tpope/vim-haml'


" - Rails -
Bundle 'tpope/vim-rails'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'slim-template/vim-slim'
Bundle 'ck3g/vim-change-hash-syntax'
Bundle 'tonekk/vim-binding-pry'

" - Snippets -
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

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
