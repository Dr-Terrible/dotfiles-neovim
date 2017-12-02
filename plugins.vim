" Check whether vim-plug is installed and download it if necessary
" ==============================================================================
let plugpath = expand( xdg_config . '/autoload/plug.vim' )

" Download vim-plug
if !filereadable(plugpath)
    if !executable('curl')
    	echo "curl is not installed. Please install it.\n"
        exit
    endif

	echo "Downloading vim-plug ...\n"
    let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    call system('curl -fLo ' . plugpath . ' --create-dirs ' . plugurl)
    if v:shell_error
        echo "Error downloading vim-plug. Please install it manually.\n"
        exit
    endif

    echo "vim-plug successfully installed into: " . plugpath . "\n"
endif

" Initialize vim-plug
execute 'source '.plugpath
call plug#begin('~/.config/nvim/bundle')


" Load plugins
" =============================================================================

" Workspace
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'vim-ctrlspace/vim-ctrlspace'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()