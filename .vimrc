"autoinstall vim-plug if it ain't installed:
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"end of vim-plug autoinstall

"vim-plug begin
call plug#begin('~/.vim/plugged')

"Plugins go here:

" git plugin
Plug 'tpope/vim-fugitive'

" comments gcc - line
"          gc  - target of motion (or selection)
Plug 'tpope/vim-commentary'

" vim vinegar - built in file explorer netrw extension
" press - in any buffer to jump to its directory browser
" press gh to toggle hidden files
" press . to populate filename under the cursor to the end of :command line
" press y. to yank absolute path to the file
" press ~ to go home
" pres CTRL^ to go back to the buffer
Plug 'tpope/vim-vinegar'

Plug 'ctrlpvim/ctrlp.vim'

"some file searching tool
"now not used because a preference for ctrlP
"Plug 'git://git.wincent.com/command-t.git'

"solarized color theme
Plug 'altercation/vim-colors-solarized'

"papercolor_scheme could be, but I opt for solarized
"Plug 'NLKNguyen/papercolor-theme'
"Set colorpaper-scheme
" set t_Co=256   " This is may or may not needed.
" set background=light
" colorscheme PaperColor


"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Fuzzy finder
"Plug '/usr/local/opt/fzf'
"let's use CtrlP rather
"nnoremap <leader>z :FZF <cr>

"file tree
"not not used for vim-vinegar
"Plug 'preservim/nerdtree'
"nnoremap <leader>nt :NERDTreeToggle<cr>

"showing buffers on the status line
Plug 'bling/vim-bufferline'
"the bufferline should not automatically echo to the command line
let g:bufferline_echo = 0


call plug#end()
"end of vim-plug

set background=light
colorscheme solarized

"No automatic compatibility with Vi, now it can be iMproved
set nocompatible

" Set utf-8 as standard encoding
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"Spliting will open new window on the right or below from active window
set splitright splitbelow

"split navigations w/o <C-W>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Invoke Coc code action using ga
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

"map escape to turn off highlights the second line is to prevent a bug
nnoremap <silent><esc> :noh <CR>
nnoremap <esc>^[ <esc>^[

"allow clipboard shared with other apps
set clipboard=unnamed

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

"indents by rules given by cinkeys and cinoptions
set cindent

set shiftwidth=4 "default indent size
set cinoptions+={.5s "indent already inner braces
set cinoptions+=^-.5s "indent interior of top level functions only 0.5 shiftwidth
set cinoptions+=c2 "indent multi-line comments by 2
set cinoptions+=(0 "when in function, the arguments on new line are alligned to opening brace
set cinoptions+=Ws,k2s "when the line is too long, this may be handy

"folding
set foldmethod=syntax "folds given by syntax
set foldnestmax=1 "only top level entities
set nofoldenable "so the file opens without folding on
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal foldnestmax=2

"show extra whitespace:
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
"highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

"normal backspace function, allow backspace to go through the following
set backspace=indent,eol,start

"support for mouse
set mouse=a

"Overwrite while the file is changed from outside
set autoread
au FocusGained,BufEnter * checktime

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" How many tenths of a second to blink when matching brackets
set matchtime=2

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

" Use spaces instead of tabs
set expandtab

" Always show the status line
set laststatus=2

"Set wildmenu - when in command line, show me options (filenames) above
"the command line (invoked by <tab>)
set wildmenu

" Highlight search results
set hlsearch

" searches before hitting enter
set incsearch

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

"Show typed command
set showcmd

"Set settings for list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"No modelines (modelines are special lines for vim in at the beginning of a file)
set nomodeline

"CoC preffered settings follow (some may be duplicated, but that does not mind)
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden
"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
