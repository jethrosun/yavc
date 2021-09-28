set shell=/bin/bash
let mapleader = "\<Space>"
let maplocalleader = ","

" ===========================================================================
"  PLUGINS
" ===========================================================================
set nocompatible
filetype off
set rtp+=~/dev/others/base16/vim/
call plug#begin('$HOME/.local/share/nvim/plugged')

"█▓▒░ Load plugins

"█▓▒░ VIM enhancements
" --------------------
Plug 'ciaranm/securemodelines'
" Plug 'editorconfig/editorconfig-vim'		" Assume an editor config is enforced
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align', {'for': ['tex', 'latex']}  " Make writing easy with align
" Plug 'sheerun/vim-polyglot'			" I don't need this and it is buggy

"█▓▒░ GUI enhancements
" --------------------
Plug 'machakann/vim-highlightedyank'		" highlight yank
Plug 'Yggdroot/indentLine'
Plug 'jaxbot/semantic-highlight.vim'		" different color for every variable
Plug 'bounceme/poppy.vim'			" rainbow parens
Plug 'ntpeters/vim-better-whitespace'
" Plug 'romainl/vim-cool'				" disables search highlighting when you are done
" Plug 'RRethy/vim-illuminate'			" highlighting other uses of the current word
Plug 'itchyny/lightline.vim'
" Plug 'lilydjwg/colorizer'			" colorize text in the form
" Plug 'mbbill/undotree'
Plug 'rhysd/committia.vim'			" better git commit layout
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

"█▓▒░ Additional func..
" ----------------
Plug 'tpope/vim-dispatch'

"█▓▒░ Fuzzy finder
" ----------------
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"█▓▒░ Semantic language support
" -----------------------------
" Coc for completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jiangmiao/auto-pairs' | Plug 'dense-analysis/ale'			" and ALE for linting
Plug 'Shougo/echodoc.vim'			" Showing function signature and inline doc.

"█▓▒░ VIM editing enhancements
" ----------------------------
Plug 'inside/vim-search-pulse'

"█▓▒░ Syntactic language support
" ------------------------------
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'jceb/vim-orgmode'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'alvan/vim-closetag'

"█▓▒░ Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'arzg/vim-rust-syntax-ext', { 'for': 'rust' } " broken?

"█▓▒░ C++ and Clang
" Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp'] }
" Plug 'drmikehenry/vim-headerguard', {'for': ['cpp', 'hpp'] }
" Plug 'bfrg/vim-cpp-modern', {'for': ['cpp', 'hpp'] }
" Plug 'arakashic/chromatica.nvim', {'for': ['cpp', 'hpp'] }
" Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp', 'hpp'] }

"█▓▒░ LaTeX
" https://www.reddit.com/r/neovim/comments/idthcb/vimtex_vs_texlab/
" Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
Plug 'rhysd/vim-grammarous', { 'for': ['tex', 'latex', 'markdown'] }

Plug 'colepeters/spacemacs-theme.vim'

if !isdirectory(expand("$HOME/dev/others/base16"))
	Plug 'chriskempson/base16-vim'
endif
call plug#end()


"█▓▒░ Make pyenv and neovim work nice together

if has('nvim')
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
	set inccommand=nosplit
	noremap <C-q> :confirm qall<CR>
	set guicursor=
	autocmd OptionSet guicursor noautocmd set guicursor=
end

if !has('gui_running')
	set t_Co=256
endif

"█▓▒░ Plugin settings

" Don't confirm .lvimrc
let g:localvimrc_ask = 0

" ===========================================================================
"   Editor settings
" ===========================================================================
filetype plugin indent on                   " required
set autoindent
set encoding=utf-8                          " Set default encoding to UTF-8
set noshowmode                              " We show the mode with airline or lightline
set hidden                                  " Hides buffers instead of closing them
set nowrap                                  " do not wrap long lines by default
set nojoinspaces                            " Prevents inserting two spaces after punctuation on a join (J)
" I only use VIM from the terminals
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") != -1)
	set termguicolors                         " screen does not (yet) support truecolor
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "tmux-256color") != -1)
	set termguicolors                         " screen does not (yet) support truecolor
endif
if (match($TERM, "xterm") != -1)
	set termguicolors                         " for the vagrant linux box
endif

set printfont=:h14
set printencoding=utf-8
set printoptions=paper:letter

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line

" Settings needed for .lvimrc
set exrc
set secure

set noswapfile                              " Don't use swapfile

set tags=.git/tags

" Sane splits
set splitright                              " Split vertical windows right to the current windows
set splitbelow                              " Split horizontal windows below to the current windows

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
"set wildmode=list:longest
set wildmode=list:full
"set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

"Some tips from http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" Use wide tabs
" set shiftwidth=4                            " 1 tab == 8 spaces
" set softtabstop=4                           " when hitting <BS>, pretend like a tab is removed, even if spaces
" set tabstop=4                               " a tab is eight spaces
" set noexpandtab                             " Don't use spaces instead of tabs
" set expandtab                               " Use spaces instead of tabs
" set smarttab                                " Be smart when using tabs ;)
" set shiftwidth=4                            " 1 tab == 4 spaces
" set tabstop=2                               " a tab is four spaces
" set softtabstop=2                           " when hitting <BS>, pretend like a tab is removed, even if spaces

" Get syntax
syntax on

" Wrapping options
set formatoptions=tc                        " wrap text and comments using textwidth
set formatoptions+=r                        " continue comments when pressing ENTER in I mode
set formatoptions+=q                        " enable formatting of comments with gq
set formatoptions+=n                        " detect lists for formatting
set formatoptions+=b                        " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch                               " Shows the match while typing
set ignorecase                              " Search case insensitive...
set smartcase                               " ... but not when search pattern contains upper case characters
set gdefault                                " search/replace "globally" (on a line) by default

" ==========================================================================
"    GUI settings
" ==========================================================================
set guioptions-=T                           " Remove toolbar
set vb t_vb=                                " No more beeps
set backspace=2                             " Backspace over newlines
set cmdheight=2
set tw=79
set cursorline
set cursorcolumn
"set nofoldenable
set foldmethod=marker                       " Only fold on marks
set ruler                                   " Where am I?
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw                              " don't update the display while executing macros<Paste>
set synmaxcol=500
set laststatus=2                            " always have a statusline
set relativenumber                          " Relative line numbers
set number                                  " Also show current absolute line
set diffopt+=iwhite	                        " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
if has("patch-8.1.0360")
	set diffopt+=internal,algorithm:patience
	set diffopt+=indent-heuristic
endif
set colorcolumn=80                          " and give me a colored column
set showcmd                                 " Show (partial) command in status line.
set mouse=a                                 " Enable mouse usage (all modes) in terminals
set shortmess+=c                            " don't give |ins-completion-menu| messages.

" Make it so there are always ten lines below my cursor
set scrolloff=10

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" better whitespace
" red #FF0000, coral #FF7F50, tomato #FF6347, orangered #FF4500, orange
" #FFA500, darkorange #FF8C00
"let g:better_whitespace_ctermcolor='<desired_color>'
let g:better_whitespace_guicolor='#FF4500'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=0

set background=dark
hi Comment cterm=italic gui=italic
" extra setup that I might not need?
" hi Normal ctermbg=NONE
" hi Normal guibg=NONE

" Colors: Spacemacs
colorscheme spacemacs-theme

" Colors: Base16
let base16colorspace=256
let g:base16_shell_path="$HOME/dev/others/base16/shell/scripts/"
" colorscheme base16-atelier-dune
" colorscheme base16-gruvbox-dark-hard
" call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")
" call Base16hi("CocHintSign", g:base16_gui03, "", g:base16_cterm03, "", "", "")

" the configuration options should be placed before `colorscheme forest-night`
" let g:forest_night_enable_italic = 1
" let g:forest_night_disable_italic_comment = 1
" colorscheme forest-night

" Editing setup
source $HOME/.config/nvim/lib/editing.vim

" Syntax support
source $HOME/.config/nvim/lib/syntax.vim

" ===========================================================================
"   Personal programming setup
" ===========================================================================
source $HOME/.config/nvim/lib/lightline.vim
source $HOME/.config/nvim/lib/coc.vim

" echodoc
let g:echodoc_enable_at_startup = 1
