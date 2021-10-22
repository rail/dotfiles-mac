if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/vim-auto-save'
" Plug 'vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Add maktaba and bazel to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
" let g:deoplete#enable_at_startup = 1

let mapleader = "\<Space>"
let maplocalleader = ","
scriptencoding utf-8
set encoding=utf-8
set backupdir=~/.config/nvim/tmp/backups//
set undodir=~/.config/nvim/tmp/undo//
set directory=~/.config/nvim/tmp/swap//
" Make the folders automatically if they don't already exist.
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), 'p')
endif
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), 'p')
endif
" Persistent Undo, Vim remembers everything even after the file is closed.
set undofile
set undolevels=500
set undoreload=500
" Use the OS clipboard by default
set clipboard+=unnamedplus
" Enhance command-line completion
set wildmenu
set wildmode=longest,full
set wildignore+=*.gif,*.png,*.jp*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.sass-cache/*,*.map
" Saner backspacing
set backspace=indent,eol,start
set showcmd
set autoread
set hidden
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" scroll the screen before I reach the bottom
set laststatus=2
set nrformats-=octal
set notimeout
set nottimeout
" More natural split opening
set splitbelow
set splitright
" Mapping
" Unmap space in normal and visual modes
nnoremap <SPACE> <nop>
vnoremap <SPACE> <nop>
" Map ctrl c to escape to fix multiple cursors issue
noremap <C-c> <Esc>
" Map the capital equivalent for easier save/exit
cabbrev Wq wq
cabbrev W w
cabbrev Q q
" Cylces through splits using a double press of enter in normal mode
nnoremap <CR><CR> <C-w><C-w>
" Unmaps the arrow keys
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>
" Map ; to :
noremap ; :
" Maps Tab to indent blocks of text in visual mode
vmap <TAB> >gv
vmap <BS> <gv
" Jumps to the bottom of Fold
nmap <Leader>b zo]z
" and up
nmap <Leader>u zo[z
" Easily move to start/end of line
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $
" za/az toggle folds
" ezpz to spam open/close folds now
nmap az za
" highlight all tabs and trailing whitespace characters
" highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=#592929
" match ExtraWhitespace /\s\+$\|\t/
" Spaces and Tabs {{{
" Set indent to 4 spaces wide
set tabstop=4
set shiftwidth=4
" A combination of spaces and tabs are used to simulate tab stops at a width
set softtabstop=4
set expandtab
" Show “invisible” characters
" set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set listchars=tab:⇥\ ,trail:☠
set listchars=tab:\ \ ,trail:☠
set list
" }}}
" Line Wrap {{{
" Soft wraps lines without editing file
set wrap
" Stops words from being cut off during linebreak
set linebreak
" Set textwidth to 80 characters
set textwidth=0
set wrapmargin=0
" Copy indent from previous line on linebreak
set autoindent
" Linebreaks keep indent level
set breakindent
" }}}
" Look and Feel {{{
" force minimun window width
set winwidth=100
" Enable true color for neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
" Enables cursor similar to gui programs
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" use relative numbers
set number relativenumber
" Hide ruler
set noruler
" Don't redraw screen as often
set lazyredraw
set nocursorcolumn
set nocursorline
" Don’t show the intro message when starting Vim
set shortmess=atIc
" Hide mode indicator
set noshowmode
" scroll when reach 3rd line from the bottom
set scrolloff=3
" }}}
" Searching {{{
" Highlight search matches
set hlsearch
" Show search results as you type
set incsearch
" Ignore case in searches if query doesn't include capitals
set ignorecase
set smartcase
" }}}
" {{{ Tabs
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <silent> <S-A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" }}}
" Better Buffer Navigation {{{
" Maps <Tab> to cycle though buffers but only if they're modifiable.
function! BetterBufferNav(bcmd)
    if &modifiable == 1 || &filetype ==? 'help'
        execute a:bcmd
    endif
endfunction
" Maps Tab and Shift Tab to cycle through buffers
nmap <silent> <Tab> :call BetterBufferNav("bn") <Cr>
nmap <silent> <S-Tab> :call BetterBufferNav("bp") <Cr>
" }}}
" Line Return {{{
" Returns you to your position on file reopen and closes all folds.
" On fold open your cursor is on the line you were at on the fold.
augroup line_return
    au!
    autocmd BufReadPost * :call LineReturn()
augroup END
function! LineReturn()
    if line("'\"") > 0 && line("'\"") <= line('$')
        execute 'normal! g`"zvzzzm'
    endif
endfunction
" }}}


set termguicolors
set background=dark
colorscheme base16-oceanicnext
let g:one_allow_italics = 1
let g:airline_theme='base16_oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:highlightedyank_highlight_duration = 200

let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 0
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_list_order = [
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Recent in this dir:'],
  \ 'dir',
  \ ['   Recent:'],
  \ 'files',
  \ ['   Bookmaks:'],
  \ 'bookmarks',
  \ ]
hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240r

" Use region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" toggle spelling
set invspell
nnoremap <leader>s :set invspell<CR>
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

nmap <silent> <C-p> :Files<CR>
nmap <silent> <C-g> :BCommits<CR>

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
nmap <leader>cr <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)
nmap <C-a> <C-o>
nmap <C-d> <Plug>(coc-definition)
