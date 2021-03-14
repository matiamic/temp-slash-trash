"vundle support
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"papercolor_scheme
Plugin 'NLKNguyen/papercolor-theme'

"status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"relative numbers shown
Plugin 'vim-scripts/RltvNmbr.vim'


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

""end of vundle

"most of following from https://github.com/amix/vimrc

"No automatic compatibility with Vi
set nocompatible

"Spliting will open new window on the right or below from active window
set splitright splitbelow

"Set minimal scheme
"colo 0x4545-256

"Set colorpaper-scheme
set t_Co=256   " This is may or may not needed.
set background=light
colorscheme PaperColor

"Set vertiacal guide on 80 characters
set colorcolumn=80

"How many operations will vim remember
set history=500

"Showing line number
set nu

"Showing relative numbers
set rnu

" Enable syntax highlighting
syntax enable

"INDENTATION SETTING 
"Takes line indent from upper line
"set autoindent

"indents by rules given by cinkeys and cinoptions
set cindent

"default indent size
set shiftwidth=4
"indent already inner braces
set cinoptions+={.5s
"indent interior of top level functions only 0.5 shiftwidth
set cinoptions+=^-.5s
"indent multi-line comments by 2
set cinoptions+=c2
"when in function, the arguments on new line are alligned to opening brace
set cinoptions+=(0
"when the line is too long, this may be handy
set cinoptions+=Ws,k2s

"end of indent settings----------

"FOLDING SETTINGS folding setting
set foldmethod=syntax "folds given by syntax
set foldnestmax=1 "only top level entities
set nofoldenable "so the file opens without folding on


"support for mouse
set mouse=a

"debuger support
packadd termdebug
let g:termdebug_wide = 163

"Overwrite while the file is changed from outside
set autoread
au FocusGained,BufEnter * checktime

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" How many tenths of a second to blink when matching brackets
set mat=2

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Always show the status line
set laststatus=2

"Set wildmenu - better command line helper
set wildmenu

" Always show curr position
set ruler

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"Show typed command
set showcmd

"Set settings for list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
