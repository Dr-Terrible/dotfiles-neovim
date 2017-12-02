" Bootstrap
" Set up a cross-platform nvim environment for Linux, Mac, BSD, and Windows.
" ==============================================================================
runtime! bootstrap/*.vim


" Load all the plugins
" ==============================================================================
runtime! plugins.vim
filetype plugin indent on                "Enable plugins and indents by filetype


" General Configurations
" ==============================================================================

" UI config
set title                                "Change the terminal's title
set number                               "Line numbers are good
set showcmd                              "Show command in bottom bar
set noshowmode                           "Hide showmode because of the powerline
set hidden                               "Hide buffers in background
set showtabline=0
set splitbelow                           "Horizontal split below current
set splitright                           "Vertical split to the right
set winminheight=0                       "Allow splits reduced to a single line
set virtualedit=onemore                  "Allow for cursor beyond last character
set gcr=a:blinkon500-blinkwait500-blinkoff500    "Set cursor blinking rate

" Highlight
set cursorline                           "Highlight current line
highlight clear SignColumn      "SignColumn should match background
highlight clear LineNr          "Current line number row will have same background color in relative mode

" Search config
set incsearch               "Search as characters are entered
set hlsearch                "Highlight matches
set ignorecase              "Ignore case when searching
set smartcase               "Ignore case if search pattern is lower case,
							" case-sensitive otherwise
set gdefault                "Set global flag for search and replace
set magic                   "Use 'magic' patterns (extended regular expressions)

" Diff config
set diffopt=filler           "Add vertical spaces to keep right and left aligned
set diffopt+=iwhite          "Ignore whitespace changes (focus on code changes)

" Set utf-8 encodings
set fileencoding=utf-8
scriptencoding utf-8
set encoding=utf-8

" Common tweaks
set history=1000                     "Store lots of history (default is 20)
set mouse=a                          "Enable mouse usage
set showmatch                        "Highlight matching bracket
set nostartofline                    "Jump to first non-blank character
set timeoutlen=1000                  "Reduce Command time-out for faster escape
"set wrap                             "Enable word wrap
"set linebreak                        "Wrap lines at convenient points
set lazyredraw                       "Do not redraw on registers and macros
set background=dark                  "Set background to dark
set path+=**                         "Allow recursive search
set inccommand=split                 "Show substitute changes immediately in separate split
set fillchars+=vert:\│               "Make vertical split separator full line
set pumheight=30                     "Maximum number of entries in autocomplete popup
set shell=/bin/zsh
set exrc                             "Allow per-directory .exrc files
set secure                           "Forbid autocmd in per-directory .exrc
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility


" Turn Off Swap Files
" ==============================================================================
set noswapfile
set nobackup
set nowb


" Persistent Undo
" Keep undo history across sessions
" ==============================================================================
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
if has("persistent_undo")
	silent !mkdir ~/.config/nvim/undo > /dev/null 2>&1
	set undodir=~/.config/nvim/undo
	set undofile
endif


" Indentation
" ==============================================================================
set shiftwidth=4                        "Number of spaces to use for autoindent
set softtabstop=4                       "Number of spaces in tab when editing
set tabstop=4                           "Number of visual spaces per TAB
"set expandtab                          "Tabs are space
set smartindent
set autoindent
set copyindent                          "Copy indent from the previous line
set nofoldenable
set colorcolumn=80
set linespace=0                         "Set line-spacing to minimum.
set nojoinspaces                        "Prevents inserting two spaces,
										"after punctuation on a join (J)
set list                                "Enable listchars
set listchars=tab:›\ ,                  "Set trails for tabs and spaces
set listchars+=trail:-,
set listchars+=extends:»,
set listchars+=precedes:«,


" Clipboard
" ==============================================================================
if has('clipboard')
	if has('unnamedplus')
		" When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else
		" On Mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif


" Auto commands
" ==============================================================================
augroup vimrc
	autocmd!
augroup END

autocmd vimrc BufWritePre * :call StripTrailingWhitespaces()                    "Auto-remove trailing spaces
autocmd vimrc InsertEnter * :set nocul                                          "Remove cursorline highlight
autocmd vimrc FocusGained,BufEnter * checktime                                  "Refresh file when vim gets focus

" When .nvimrc, .exrc, or init.vim files are edited, either directly
"  or via symlink, automatically reload them.
autocmd! bufwritepost .nvimrc source %
autocmd! bufwritepost _nvimrc source %
autocmd! bufwritepost .exrc source %
autocmd! bufwritepost _exrc source %
autocmd! bufwritepost init.vim source %

" Colors & Themes
" ==============================================================================
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors                                  "Enable true color support
syntax on                                          "Enable syntax highlighting

set background=light
silent! colorscheme PaperColor

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='papercolor'


" Completion
" Stuff to ignore when tab completing
" ==============================================================================
set wildmenu                       "Visual autocomplete for command menu
set wildchar=<TAB>                 "Character for CLI expansion (TAB-completion)
set wildmode=list:full
set wildignore=tags
set wildignore+=*.o,*.obj,*~
set wildignore+=*.git*
set wildignore+=*.gtm*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*/bower_components/**,*/node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.jpg,*.jpeg,*.gif,*.png
set wildignore+=*.otf,*.woff,
set wildignore+=*.orig

" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert


" Scrolling
" ==============================================================================
set scrolloff=8            "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5


" Statusline
" ==============================================================================
if has('statusline')
	set laststatus=2                      "Window will always have a status line

	"hi User1 guifg=#FF0000 guibg=#2C323C
	"set statusline=\ %{toupper(mode())}              "Mode
	"set statusline+=\ \│\ %{fugitive#head()}         "Git branch
	"set statusline+=\ \│\ %4F                        "File path
	"set statusline+=\ %1*%m%*                        "Modified indicator
	"set statusline+=\ %w                             "Preview indicator
	"set statusline+=\ %r                             "Read only indicator
	"set statusline+=\ %q                             "Quickfix list indicator
	"set statusline+=\ %=                             "Start right side layout
	"set statusline+=\ %{&enc}                        "Encoding
	"set statusline+=\ \│\ %y                         "Filetype
	"set statusline+=\ \│\ %p%%                       "Percentage
	"set statusline+=\ \│\ %l/%L                      "Current/Total line number
	"set statusline+=\ \│\ %c                         "Column number
	"set statusline+=\ \│%1*%{ALEGetStatusLine()}%*   "Errors count
endif


" Custom mappings
" ==============================================================================

" Map save to Ctrl+S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>

" Remap annoying combinations
command! W w                                               "Remap :W to :w
command! Q q                                               "Remap :Q to :q
command! Qall qall

" NERDTree mappings
map <C-n> :NERDTreeToggle<CR>

" Hard to type things
iabbrev >> →
iabbrev << ←
iabbrev ^^ ↑
iabbrev VV ↓

" vim-ctrlspace
" Fix for vim-ctrlspace: see https://github.com/vim-ctrlspace/vim-ctrlspace/issues/188
let g:CtrlSpaceDefaultMappingKey = "<C-space> "


" Plugins setups
" ==============================================================================

set updatetime=500                         "Let plugins show effects after 500ms

" delimitMate
let g:delimitMate_expand_cr = 1            "Auto indent on enter

" gitgutter
let g:gitgutter_realtime = 0               "Disable gitgutter in real-time
let g:gitgutter_eager = 0                  "Disable gitgutter to eager load
										   "on tab or buffer switch
set signcolumn=yes                         "Always have the sign column

" NERDTree
let g:NERDTreeChDirMode = 2                "Always change the root directory
let g:NERDTreeMinimalUI = 1                "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1               "Show hidden files in NERDTree

" NeoMake
let g:neomake_open_list = 2                "Open NeoMake list automatically
