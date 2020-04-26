" Coc setting
"
" Coc util extensions
call coc#add_extension('coc-snippets')
call coc#add_extension('coc-pairs')
call coc#add_extension('coc-lists')
call coc#add_extension('coc-git')
call coc#add_extension('coc-tabnine')
" call coc#add_extension('coc-yank')
" call coc#add_extension('coc-highlight')
" call coc#add_extension('coc-smartf')
" call coc#add_extension('coc-vimtex')

" Coc syntax extensions
call coc#add_extension('coc-python')
call coc#add_extension('coc-rust-analyzer')
" call coc#add_extension('coc-rls')
call coc#add_extension('coc-clangd')
call coc#add_extension('coc-texlab')
" call coc#add_extension('coc-gocode')
" call coc#add_extension('coc-vimlsp')
" call coc#add_extension('coc-java')

" Coc web dev extensions
call coc#add_extension('coc-tsserver')
call coc#add_extension('coc-tslint-plugin')
call coc#add_extension('coc-stylelint')
" call coc#add_extension('coc-eslint')
call coc#add_extension('coc-json')
call coc#add_extension('coc-css')
call coc#add_extension('coc-html')
call coc#add_extension('coc-prettier')

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Float color highlight
"hi CocErrorFloat guifg=#af0000
hi CocErrorFloat guifg=#ff5874
hi CocErrorSign guifg=#ff5874
hi CocWarningFloat guifg=#ddaa00
hi CocWarningSign guifg=#ddaa00
hi CocInfoSign guifg=#ffaf00
hi CocInfoFloat guifg=#ffaf00
hi CocHintFloat guifg=#2ed1cd

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" And to work as expected in coc-pairs.
" https://github.com/neoclide/coc-pairs/issues/13
"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" NOTE: the diagnostic is now in the ALE
" Use `C-k` and `C-j` to navigate diagnostics
nmap <silent> <C-k>  <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j>  <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>.  <Plug>(coc-definition)
nmap <silent> <leader>y  <Plug>(coc-type-definition)
nmap <silent> <leader>i  <Plug>(coc-implementation)
nmap <silent> <leader>r  <Plug>(coc-references)
nmap <silent> <leader>l <Plug>(coc-diagnostic-info)
nmap <silent> <leader>o  <C-O>
nmap <silent> <C-g> :close<cr>

" Use K to show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <silent> <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <silent> <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>x  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>]  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
"nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>

nnoremap <silent> <leader>oj  :<C-u>CocNext<CR>
nnoremap <silent> <leader>ok  :<C-u>CocPrev<CR>

" Use <C-e> for trigger snippet expand.
imap <C-e> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Additional filetype for coc pairs
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType tex let b:coc_pairs_disabled = ["`", "'","<"]
" autocmd FileType tex setlocal spell spelllang=en_us
autocmd FileType html let b:coc_pairs_disabled = ['<']
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
autocmd FileType markdown let b:coc_pairs = [["$", "$"]]