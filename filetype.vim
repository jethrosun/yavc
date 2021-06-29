" functions
fu Map_ftype(ftypes, cmd)
	for ftype in a:ftypes
		execute 'au Filetype' ftype a:cmd
	endfor
endf

" foldenable
set nofen
set foldmethod=indent

" Fix vim's braindead autocomplete defaults:
set wildmode=list:longest
set wildignorecase
let fen_fts = ['vim']

" classify filetypes
let prose_fts = ['gitcommit', 'mail',  'markdown',  'text']

" tabexpand
let et_fts = ['haskell',  'java',  'yaml', 'ats', 'hy', 'lua', 'scala']
let et_fts += ['clojure', 'ocaml', 'ruby', 'scheme', 'cabal']
let et_fts += ['erlang', 'markdown', 'text', 'mail', 'gitcommit']
let et_fts += ['puppet', 'julia', 'elm', 'rust', 'idris', 'pony']
let et_fts += ['zig', 'json', 'unison']

let noet_fts = ['html', 'xml', 'c']

" tabstop

let ts8_fts = ['c', 'go']

let ts2_fts = ['yaml', 'ats', 'html', 'hy', 'lua', 'clojure', 'scala']
let ts2_fts += ['ocaml', 'ruby', 'scheme', 'cabal', 'erlang', 'xml']
let ts2_fts += ['puppet', 'htmldjango', 'json', 'javascript', 'pony']
let ts2_fts += ['cpp', 'capnp', 'unison']

let ts4_fts = ['idris', 'haskell', 'python', 'java', 'julia', 'rust']
let ts4_fts += ['elm', 'zig'] + prose_fts

augroup filetypedetect
	call Map_ftype(fen_fts, 'setlocal foldmethod=marker fen')
	call Map_ftype(et_fts, 'setlocal et')
	call Map_ftype(noet_fts, 'setlocal noet')

	call Map_ftype(ts2_fts, 'setlocal ts=2 sw=2')
	call Map_ftype(ts4_fts, 'setlocal ts=4 sw=4')
	call Map_ftype(ts8_fts, 'setlocal ts=8 sw=8')

	au FileType c set cscopetag

	au FileType yaml filetype plugin indent off
	" repls {{{
	au FileType lisp nnoremap M :!clisp -repl %<cr><cr>
	au FileType python nnoremap M :!python -i %<cr><cr>
	au FileType scheme nnoremap M :!rlwrap guile -l %<cr><cr>
	" }}}
	" prose {{{
	" We want word wrapping for 'prose'. We also want spell check.
	au BufRead,BufNewFile /*.md setlocal ft=markdown
	call Map_ftype(prose_fts, 'setlocal tw=72 fo=aw2tq spell')
	au FileType help setlocal nospell
	" }}}
	" filetypes {{{
	au BufRead,BufNewFile *.pyi setlocal ft=python
	au BufRead,BufNewFile *.hamlet setlocal ft=haskell
	au BufRead,BufNewFile *.bkp setlocal ft=haskell
	au BufRead,BufNewFile *.hsig setlocal ft=haskell
	au BufRead,BufNewFile /tmp/alot.* setlocal ft=mail
	au BufRead,BufNewFile *.mail setlocal ft=mail
	au BufRead,BufNewFile *.pl setlocal ft=prolog
	au BufRead,BufNewFile *.h setlocal ft=c
	au BufRead,BufNewFile jbuild setlocal ft=scheme
	au BufRead,BufNewFile dune setlocal ft=scheme
	" }}}
	au FileType python match BadWhitespace /\s\+$/

	" The usual 80ish characters tends to be too short for go programs.
	au FileType go setlocal tw=100


	" Git commit message
	au Filetype gitcommit setlocal spell tw=72 colorcolumn=73

	" nftables
	autocmd BufRead,BufNewFile *.nft setfiletype nftables

	" Rust language server
	"autocmd FileType rust let b:ale_linters = ['rustup', 'run', 'nightly', 'rls']
	" Follow Rust code style rules
	" au Filetype rust source $HOME/.config/nvim/scripts/spacetab.vim
	" au Filetype rust set colorcolumn=100
	" au FileType rust let b:dispatch = 'cargo check'
	"au filetype rust let b:AutoPairs = {'`': '`', '"': '"', '{': '}', '(': ')', '[': ']', '|':'|', '<':'>'}
	"au Filetype rust let b:ale_linters = ['rustup', 'run', 'nightly', 'rls']

	" Shorter columns in text
	au Filetype text setlocal  tw=72 colorcolumn=73
	au Filetype markdown setlocal  tw=72 colorcolumn=73

	" proselint!!!
	" au Filetype tex let b:ale_linters = ['proselint', 'languagetool', 'lacheck', 'chktex']
	" au Filetype text let b:ale_linters = ['proselint', 'languagetool']
	" au Filetype markdown let b:ale_linters = ['proselint', 'languagetool']

	" LaTeX and TeX
	autocmd BufRead *.tex set filetype=tex
	au Filetype tex setlocal tabstop=2 shiftwidth=2 tw=80 colorcolumn=81 et
	au Filetype tex let g:tex_flavor = 'latex'
	"autocmd Filetype tex setlocal syntax=context
	" LaTeX indent
	au FileType tex let g:tex_indent_items=0
	au FileType tex let g:tex_indent_and=0
	au FileType tex let g:tex_indent_brace=0
	au Filetype tex setl updatetime=1
	autocmd BufNewFile,BufRead *.tex set syntax=context

	" fish
	au FileType fish compiler fish
	au FileType fish setlocal textwidth=79
	"au FileType fish setlocal nofoldenable
	au FileType fish setlocal indentexpr=fish#Indent()
	au FileType fish setlocal indentkeys+==end,=else,=case

	" lisp
	au BufNewFile,BufRead *.lsp,*.lisp,*.el,*.cl,*.jl,*.L,.emacs,.spacemacs setf lisp

	" other file types
	au BufNewFile,BufRead .chunkwmrc,.skhdrc set filetype=sh
	autocmd BufRead *.jemdoc set filetype=jemdoc

	" Auto-make less files on save
	autocmd BufWritePost *.less if filereadable("Makefile") | make | endif

	" Help filetype detection
	autocmd BufRead *.plot set filetype=gnuplot
	autocmd BufRead *.md set filetype=markdown
	autocmd BufRead *.lds set filetype=ld
	autocmd BufRead *.xlsx.axlsx set filetype=ruby
	autocmd BufRead *.trm set filetype=c
	autocmd BufRead *.org set filetype=org
	autocmd BufRead *.java set filetype=java
	" autocmd BufRead *.js set filetype=js
	autocmd BufRead *.html set filetype=html

	" html, js, d3
	autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2

	" Script plugins
	au Filetype html,xml,xsl,php source $HOME/.config/nvim/scripts/closetag.vim

	" Spell checking for things I need
	au Filetype tex setlocal spell
	au Filetype rust setlocal spell

	" additional
	au filetype ruby let b:AutoPairs = {'`': '`', '"': '"', '{': '}', '''': '''', '(': ')', '[': ']', '|':'|'}
	"autocmd FileType vim setlocal foldmethod=expr
	au FileType markdown setlocal nofoldenable
	au FileType javascript setlocal nofoldenable

	autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
	" indent line setup
	au Filetype tex let b:indentLine_enabled = 0
	au Filetype markdown let b:indentLine_enabled = 0
	au Filetype text let b:indentLine_enabled = 0
	au Filetype org let b:indentLine_enabled = 0
	au Filetype java let java_ignore_javadoc = 1

	" clang format
	au FileType c,cpp ClangFormatAutoEnable

	" Prevent accidental writes to buffers that shouldn't be edited
	autocmd BufRead *.orig set readonly
	autocmd BufRead *.pacnew set readonly

	autocmd BufRead *.out set wrap

	" Jump to last edit position on opening file
	if has("autocmd")
		" https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
		au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	endif

	" Jump to last edit position on opening file
	" https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
	au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

	" NerdTree behavior
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

	" magic color setting
	" autocmd BufEnter * set background=dark
	" autocmd BufEnter * colorscheme base16-gruvbox-dark-hard
	" autocmd BufEnter * let g:airline_theme='base16'
	" autocmd BufEnter *.tex set background=light
	" autocmd BufEnter *.tex colorscheme forest-night
	" autocmd BufEnter *.sty colorscheme forest-night
	" autocmd BufEnter *.tex let b:airline_theme='papercolor'
augroup END
