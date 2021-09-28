""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Keyboard shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ; as :
nnoremap ; :

inoremap jj <Esc>
inoremap jk <Esc>
nnoremap Y y$
nnoremap gUiw mzgUiw`z
nnoremap guiw mzguiw`z

" Ctrl+c and Ctrl+j as Esc
" inoremap <C-j> <Esc>
" vnoremap <C-j> <Esc>
" inoremap <C-c> <Esc>
" vnoremap <C-c> <Esc>

" Ctrl+j and Ctrl+k as Esc
" Ctrl-j is a little awkward unfortunately:
" https://github.com/neovim/neovim/issues/5916
" So we also map Ctrl+k
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

map q <Nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" nnoremap <Tab> :bn<CR>
" nnoremap <S-Tab> :bp<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>q shows stats
nnoremap <leader>Q g<c-g>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" Keymap for replacing up to next _ or -
noremap <leader>m ct_   " choosing over lsp ctx menu
"noremap <leader>n ct-

" M to make
" noremap M :!make -k -j4<cr>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Quick-save
nmap <leader>w :StripWhitespace<CR>:w<CR>
nmap <leader>wq :wq<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>qq :q!<Esc>:q!<CR>
command! W w
command! Wq wq
command! WQ wq

" detele things shortcut
nnoremap <C-i> C
"inoremap <C-i> C
"vnoremap <C-i> C
" nnoremap <leader>i C
"inoremap <leader>i C
"vnoremap <leader>i C

" F3 to insert a logical clock
nmap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
inoremap <special> <F3> <c-r>=strftime('%c')<CR>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Replaced gundo with UndoTree, pure vimscript instead of dependencies
nnoremap <leader>u :UndotreeToggle<CR>

" vim-dispatch
nnoremap <leader>d :Dispatch<CR>
" special case for netbricks
autocmd BufRead,BufNewFile $HOME/dev/netbricks/** let b:dispatch = './build.sh'
autocmd BufRead,BufNewFile $HOME/dev/projects/netbricks/** let b:dispatch = './build.sh'
autocmd BufRead,BufNewFile $HOME/dev/achtung/nfv/** let b:dispatch = 'make clean; make'
autocmd BufRead,BufNewFile $HOME/writings/blogs/** let b:dispatch = 'zola build'

" manage quick fix
function! GetBufferList()
	redir =>buflist
	silent! ls!
	redir END
	return buflist
endfunction

function! ToggleList(bufname, pfx)
	let buflist = GetBufferList()
	for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
		if bufwinnr(bufnum) != -1
			exec(a:pfx.'close')
			return
		endif
	endfor
	if a:pfx == 'l' && len(getloclist(0)) == 0
		echohl ErrorMsg
		echo "Location List is Empty."
		return
	endif
	let winnr = winnr()
	exec(a:pfx.'open')
	if winnr() != winnr
		wincmd p
	endif
endfunction

" auto set quickfix height
au FileType qf call AdjustWindowHeight(3, 8)
function! AdjustWindowHeight(minheight, maxheight)
	exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>\ :call ToggleList("Quickfix List", 'c')<CR>


" Jump to start and end of line using the home row key
"map H ^
"map L $
map <C-h> <ESC>^
imap <C-h> <ESC>I
map <C-l> <ESC>$
imap <C-l> <ESC>A
nnoremap <C-h> ^
nnoremap <C-l> $

" map wincmd
"
" The right windcmd
nmap <silent>J :wincmd j<CR>
nmap <silent>K :wincmd k<CR>
nmap <silent>H :wincmd h<CR>
nmap <silent>L :wincmd l<CR>

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" resize current split by +/- 5
nnoremap <silent> + :exe "vertical resize +5"<CR>
nnoremap <silent> - :exe "vertical resize -5"<CR>
nnoremap <silent> <leader>] :exe "resize +5"<CR>
nnoremap <silent> <leader>[ :exe "resize -5"<CR>

" provide hjkl movements in Insert mode via the <Alt> modifier key
"
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" Neat X clipboard integration linux
"
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
if has('unix')
	if has('mac')       " osx
		" Paste clipboard content to current line
		vnoremap <silent>Y :w !pbcopy<CR><CR>
		" noremap <leader>c :w !pbcopy<CR>
		" noremap <leader>y :w !pbcopy<CR>
		" noremap <leader>p :r !pbpaste<CR>
		nnoremap <silent>P :r !pbpaste<CR>
	else                " linux, bsd, etc
		" noremap <leader>c :w !xsel -ib<cr><cr>
		" noremap <leader>y :w !xsel -ib<cr><cr>
		vnoremap <silent>Y :w !xsel -ib<cr><cr>
		" noremap <leader>p :read !xsel --clipboard --output<cr>
		noremap <silent>P :read !xsel --clipboard --output<cr>
	endif
endif
" copy
vnoremap <C-c> "*y

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

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" highlighted yank
if !exists('##textyankpost')
	map y <plug>(highlightedyank)
endif

" fzf
" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let g:fzf_layout = { 'down': '~35%' }
" Keybindings
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <leader>c :Commits<CR>
" Open hotkeys
nnoremap <leader>p :Files<CR>
nmap F :Files<CR>
nnoremap <leader>; :Buffers<CR>
" nnoremap <leader>f :GFiles<CR>
" nnoremap <leader>g :GFiles?<CR>
" <leader>s for Rg search
noremap <leader>s :Ag<CR>
noremap <leader>s :Rg<CR>

" fzf helper methods {{{
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif

command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0)

function! s:list_cmd()
	let base = fnamemodify(expand('%'), ':h:.:S')
	return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
			\                               'options': '--tiebreak=index'}, <bang>0)
" }}}

" Mac setting, not important {{{
"
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
" }}}
" Delete trailing white space on save, useful for Python and CoffeeScript ;) {{{
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
" }}}

" C++ reference look up  {{{
" https://stackoverflow.com/questions/2272759/looking-up-c-documentation-inside-of-vim?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
" }}}
" fugitive {{{
"
nnoremap <silent> gd :GDiff<CR>
nnoremap <silent> dg :diffget<CR>
" }}}

" vim-illuminate
hi link illuminatedWord Visual
" Time in milliseconds (default 250)
let g:Illuminate_delay = 1500
"let g:Illuminate_ftHighlightGroups = {
"      \ 'vim': ['vimVar', 'vimString', 'vimLineComment',
"      \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
"      \ }

" vim-search-pulse
" let g:vim_search_pulse_duration = 250

" poppy
au! cursormoved * call PoppyInit()

" notational-fzf-vim
if !empty(glob("~/notes"))
	let g:nv_search_paths = ['~/notes']
	nnoremap NN :NV<CR>
endif

" NnoreF and Preview are only for macOS
if has("mac") || has("macunix")
	" Preview
	let g:livepreview_previewer = 'open -a Preview'
endif

" A second kind of re-wrap {{{
" Reformat lines (getting the spacing correct)
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
autocmd Filetype markdown nmap Q :call TeX_fmt()<CR>zz
autocmd Filetype tex nmap Q :call TeX_fmt()<CR>zz
autocmd Filetype org nmap Q :call TeX_fmt()<CR>zz
autocmd Filetype jemdoc nmap Q :call TeX_fmt()<CR>zz
autocmd Filetype text nmap Q :call TeX_fmt()<CR>zz

" vim-grammarous
let g:grammarous#disabled_rules = {
			\ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
			\ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
			\ }

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
	nmap <buffer><C-i> <Plug>(grammarous-move-to-info-window)
	nmap <buffer><C-j> <Plug>(grammarous-move-to-next-error)
	nmap <buffer><C-k> <Plug>(grammarous-move-to-previous-error)
	nmap <buffer><leader>f <Plug>(grammarous-fixit)
	nmap <buffer><C-f> <Plug>(grammarous-fixit)
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
	nunmap <buffer><C-j>
	nunmap <buffer><C-k>
	nunmap <buffer><leader>f
endfunction

nnoremap <leader>L :GrammarousCheck --lang=en-US --preview<CR>
nnoremap <leader>G :GrammarousCheck --lang=en-US --preview<CR>


" NERDCommenter
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
			\ 'c': { 'left': '/**','right': '*/' },
			\ 'cpp': {'left': '//'},
			\ 'python': {'left': '#'},
			\ 'rust': {'left': '//'},
			\ }

" Undo tree
nnoremap <leader>u :UndotreeToggle<cr>

" Better commit window
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
	" Additional settings
	setlocal spell

	" If no commit message, start with insert mode
	if a:info.vcs ==# 'git' && getline(1) ==# ''
		startinsert
	endif

	" Scroll the diff window from insert mode
	" Map <C-n> and <C-p>
	imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
	imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" Nerd Tree
let g:NERDTreeWinPos = "right"
map <leader>n :NERDTreeToggle<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
