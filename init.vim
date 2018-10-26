" Fish doesn't play all that well with others
set shell=/bin/bash
let mapleader = "\<Space>"

" =============================================================================
" # PLUGINS
" =============================================================================
" Load vundle
set nocompatible
filetype off
set rtp+=~/dev/others/base16/vim/
call plug#begin('~/.local/share/nvim/plugged')

" Load plugins
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'vim-scripts/localvimrc'
Plug 'Shougo/unite.vim'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
"Plug 'phildawes/racer'
"Plug 'racer-rust/vim-racer'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
Plug 'mattn/webapi-vim'
"Plug 'roxma/nvim-cm-racer'
Plug 'junegunn/vader.vim'
Plug 'reedes/vim-lexical' " lexical/spell
Plug 'jceb/vim-orgmode'

" ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
"Plug 'roxma/nvim-cm-racer'

" Completion plugins
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Completion manager plugins
Plug 'roxma/python-support.nvim'
" for python completions
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
" language specific completions on markdown file
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
" utils, optional
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

" LanguageClient enhancements
" Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

" Syntactic language support
" Plug '~/dev/projects/simio', {'rtp': 'src/vim-syntax/'}
Plug '~/dev/projects/api-soup', {'rtp': 'vim-syntax/'}
Plug 'vim-scripts/gnuplot-syntax-highlighting'
" Plug 'treycordova/rustpeg.vim.git'
" Plug 'vim-scripts/haskell.vim'
Plug 'cespare/vim-toml'
" Plug 'lervag/vim-latex'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'

" JETHRO
"Plug 'jpalardy/spacehi.vim'
"let g:spacehi_tabcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
"let g:spacehi_spacecolor="ctermfg=Black ctermbg=Yellow guifg=Blue guibg=Yellow"
"let g:spacehi_nbspcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
"
Plug 'Yilin-Yang/vim-markbar'
"Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'tpope/vim-speeddating'
Plug 'jiangmiao/auto-pairs'
Plug 'bennyyip/vim-yapf' "forked from rhysd/vim-clang-format
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/coqtop-vim'
" Color 
Plug 'rakr/vim-one'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ambv/black'
Plug 'dpelle/vim-LanguageTool'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" writing
Plug 'rhysd/vim-grammarous'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'

"Plug 'neomake/neomake'

call plug#end()

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()


runtime macros/matchit.vim

if has('nvim')
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
	set inccommand=nosplit
	noremap <C-q> :confirm qall<CR>
end

if !has('gui_running')
	set t_Co=256
endif


" Plugin settings
let g:secure_modelines_allowed_items = [
			\ "textwidth",   "tw",
			\ "softtabstop", "sts",
			\ "tabstop",     "ts",
			\ "shiftwidth",  "sw",
			\ "expandtab",   "et",   "noexpandtab", "noet",
			\ "filetype",    "ft",
			\ "foldmethod",  "fdm",
			\ "readonly",    "ro",   "noreadonly", "noro",
			\ "rightleft",   "rl",   "norightleft", "norl",
			\ "colorcolumn"
			\ ]

" Base16
let base16colorspace=256
let g:base16_shell_path="$HOME/dev/others/base16/shell/scripts/"

" Lightline
" let g:lightline = { 'colorscheme': 'wombat' }
let g:lightline = {
			\ 'component_function': {
			\   'filename': 'LightlineFilename',
			\ },
			\ }
function! LightlineFilename()
	return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Javascript
let javaScript_fold=0

" Linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
" let g:neomake_info_sign = {'text': '⚕', 'texthl': 'NeomakeInfoSign'}

" Latex
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Don't confirm .lvimrc
let g:localvimrc_ask = 0

" language server protocol
let g:LanguageClient_serverCommands = {
			\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
			\ 'javascript': ['javascript-typescript-stdio'],
			\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
			\ 'python': ['pyls'],
			\ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>] :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" racer + rust
" https://github.com/rust-lang/rust.vim/issues/192
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_options = "--emit files"
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
"let g:racer_cmd = "/usr/bin/racer"
"let g:racer_experimental_completer = 1
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" Completion
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" Doxygen
let mysyntaxfile='$HOME/.config/nvim/doxygen_load.vim'

" Golang
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/dev/r/bin")

" Don't gofmt Biscuit (yet)
autocmd BufRead,BufNewFile /home/jon/dev/others/biscuit/** let [g:go_fmt_command, g:go_fmt_autosave]=["", 0]

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=3
set noshowmode
set hidden
set nowrap
set nojoinspaces
if (match($TERM, "-256color") != -1) && (match($TERM, "tmux-256color") == -1)
	" screen does not (yet) support truecolor
	set termguicolors
endif

" Settings needed for .lvimrc
set exrc
set secure

set tags=.git/tags

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set noexpandtab

" Get syntax
syntax on

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" =============================================================================
" # GUI settings
" =============================================================================
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set foldmethod=marker " Only fold on marks
set ruler " Where am I?
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=200
set laststatus=2
set relativenumber                 " Relative line numbers
autocmd InsertEnter * :set number  " Now it is hybrid!
autocmd InsertLeave * :set nonumber 
set diffopt+=iwhite " No whitespace in vimdiff
set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set completeopt-=preview
set shortmess+=c " don't give |ins-completion-menu| messages.

" Colors
set background=dark
colorscheme base16-atelier-dune
hi Normal ctermbg=NONE

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set nolist
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" =============================================================================
" # Keyboard shortcuts
" =============================================================================
" ; as :
nnoremap ; :

" Ctrl+c and Ctrl+j as Esc
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Suspend with Ctrl+f
inoremap <C-f> :sus<cr>
vnoremap <C-f> :sus<cr>
nnoremap <C-f> :sus<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
"noremap <leader>p :read !xsel --clipboard --output<cr>
"noremap <leader>c :w !xsel -ib<cr><cr>

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0)

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" Jump to next/previous error
nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>
nmap <silent> L <Plug>(ale_lint)
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <C-l> :copen<cr>
nnoremap <C-g> :cclose<cr>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>= reformats current tange
autocmd FileType rust nnoremap <leader>= :'<,'>RustFmtRange<cr>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" Keymap for replacing up to next _ or -
noremap <leader>m ct_
noremap <leader>n ct-

" M to make
noremap M :!make -k -j4<cr>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>


" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
	" https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
	au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Auto-make less files on save
autocmd BufWritePost *.less if filereadable("Makefile") | make | endif

" Follow Rust code style rules
au Filetype rust source $HOME/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

" Script plugins
autocmd Filetype html,xml,xsl,php source $HOME/.config/nvim/scripts/closetag.vim


" =============================================================================
" # Personal
" =============================================================================

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

nmap <leader>w :w<CR>
nmap <leader>wq :wq<CR>
"nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>qq :q!<Esc>:q!<CR>
command! W w
command! Wq wq
command! WQ wq

" map wincmd {{
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" using ctrl hj"
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>h :wincmd h<CR>
"nmap <leader>l :wincmd l<CR>
" The right windcmd
nmap <silent>J :wincmd j<CR>
nmap <silent>K :wincmd k<CR>
nmap <silent>H :wincmd h<CR>
nmap <silent>L :wincmd l<CR>

" yapf -- google
"map <C-Y> :call yapf#YAPF()<cr>
"imap <C-Y> <c-o>:call yapf#YAPF()<cr>

" map to <Leader>cf in python code
autocmd FileType python nnoremap <buffer><Leader>cf :<C-u>Yapf<CR>
autocmd FileType python vnoremap <buffer><Leader>cf :Yapf<CR>
" if you install vim-operator-user
autocmd FileType python map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :YapfAutoToggle<CR>

" indent line
let g:indent_guides_enable_on_vim_startup = 1

augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,json AutoFormatBuffer js-beautify
	"autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Rewrap is similar to the gqq command with textwidth, but it also uses a hanging
"   indent and can be used on multiple lines of text.  And note that textwidth needs
"   to be set beforehand.
" Probably generally best to use with the F3 hotkey defined below.  Can use
"   count to determine how many rows below to include.  Cannot use directions.
" Very, very useful for docblocks and if not using a version of Vim with the
"   breakindent patch
"
" From https://github.com/anorman728/vimprojects/blob/master/Rewrap.vim
function! RewrapFunc() range
	let lines = a:lastline-a:firstline+1
	if lines!=1
		let joinlines = lines-1
		exe ":normal ".lines."J"
	endif
	exe ":normal gqq"
	while line('.')!=a:firstline
		exe ":normal I  "
		exe ":normal k"
	endwhile
endfunction
command! -range RewrapCmd <line1>,<line2>call RewrapFunc()
" FIXME: not good
"nmap Q :RewrapCmd<CR>


" A second kind of re-wrap
" Reformat lines (getting the spacing correct) {{{
"
" https://tex.stackexchange.com/questions/1548/intelligent-paragraph-reflowing-in-vim
fun! TeX_fmt()
	if (getline(".") != "")
		let save_cursor = getpos(".")
		let op_wrapscan = &wrapscan
		set nowrapscan
		let par_begin = '^\(%D\)\=\s*\($\||\\begin\|\\end\|\\[\|\\]\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
		let par_end   = '^\(%D\)\=\s*\($\||\\begin\|\\end\|\\[\|\\]\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
		try
			exe '?'.par_begin.'?+'
		catch /E384/
			1
		endtry
		norm V
		try
			exe '/'.par_end.'/-'
		catch /E385/
			$
		endtry
		norm gq
		let &wrapscan = op_wrapscan
		call setpos('.', save_cursor) 
	endif
endfun
" }}}
nmap Q :call TeX_fmt()<CR>

" ncm2 {{{
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
			\ 'name' : 'css',
			\ 'priority': 9, 
			\ 'subscope_enable': 1,
			\ 'scope': ['css','scss'],
			\ 'mark': 'css',
			\ 'word_pattern': '[\w\-]+',
			\ 'complete_pattern': ':\s*',
			\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
			\ })
" }}}

" C++ reference look up  {{{
" https://stackoverflow.com/questions/2272759/looking-up-c-documentation-inside-of-vim?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
" }}}

" vim makebar
map <Leader>mm <Plug>ToggleMarkbar
" the following are unneeded if ToggleMarkbar is mapped
map <Leader>mo <Plug>OpenMarkbar
map <Leader>mc <Plug>CloseMarkbar

" vim spell
for d in glob('~/.config/nvim/spell/*.add', 1, 1)
	if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
		exec 'mkspell! ' . fnameescape(d)
	endif
endfor

" vim lexical
augroup lexical
	autocmd!
	autocmd FileType markdown,mkd call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/mthesaur.txt',]
let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]

" =============================================================================
"    Personal config
" =============================================================================
set shortmess=at

set cursorline
set cursorcolumn
"hi CursorLine   cterm=NONE ctermbg=232 guibg=#050505
"hi CursorColumn cterm=NONE ctermbg=232 guibg=#050505
hi Folded ctermbg=234 ctermfg=red

" vim-grammarous
nmap <Leader>L <Plug>(grammarous-move-to-info-window)<CR>
nmap <leader>l :GrammarousCheck --lang=en-US --preview<CR>
"nnoremap <buffer> ]g <Plug>(grammarous-move-to-next-error)
"nnoremap <buffer> [g <Plug>(grammarous-move-to-previous-error)

" Grammarous
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-P> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
    nunmap <buffer><C-f>
	endfunction


" LaTeX
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

" black for python
let g:black_linelength = 80
autocmd BufWritePre *.py execute ':Black' 

" # Footer

" Google codefmt
augroup autoformat_settings
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType rust AutoFormatBuffer rustfmt
	" ===================
  autocmd FileType bzl AutoFormatBuffer buildifier
  "autocmd FileType dart AutoFormatBuffer dartfmt
  "autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]

set cmdheight=2
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Language Tool
let g:languagetool_jar='$HOME/dev/others/LanguageTool-4.2/languagetool-commandline.jar'

" polyglot
let g:polyglot_disabled = ['latex']

" nvim
if has('nvim')
	runtime! plugin/python_setup.vim
endif
