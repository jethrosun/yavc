local vim = vim
local opt = vim.opt

opt.nu = true
opt.rnu = true

vim.cmd([[
set shell=/bin/bash
set nocompatible
filetype off
filetype plugin indent on
syntax on
set nowrap
set nofoldenable

if !has('gui_running')
set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

]])

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=1000}
augroup END
]]

opt.ruler = true -- Where am I?
opt.hidden = true -- Hides buffers instead of closing them
opt.ignorecase = true -- Search case insensitive...

-- Sane splits
opt.splitright = true -- Split vertical windows right to the current windows
opt.splitbelow = true -- Split horizontal windows below to the current windows

-- I only use VIM from the terminals
-- opt.termguicolors = true -- screen does not (yet) support truecolor

opt.cul = true
opt.mouse = "a" -- Enable mouse usage (all modes) in terminals
opt.signcolumn = "yes" -- Always draw sign column. Prevent buffer moving when adding/deleting sign.
opt.cmdheight = 2
opt.updatetime = 250 -- update interval for gitsigns

-- Time out on key codes but not mappings.
-- Basically this makes terminal Vim work sanely.
opt.timeoutlen = 350 -- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- opt.notimeout = true
-- opt.ttimeout = true
-- opt.ttimeoutlen = 10

opt.background = "dark"
opt.whichwrap:append("<>hl")
opt.pumheight = 20

-- Permanent undo
opt.undofile = true
opt.undodir = vim.fn.getenv("HOME") .. "/.vimdid"

vim.cmd "set wildcharm=<Tab>"

-- Editor settings
-- filetype plugin indent on                   " required
opt.autoindent = true
opt.encoding = "utf-8" -- default encoding to UTF-8
opt.showmode = false -- We show the mode with airline or lightline
opt.wrap = false -- do not wrap long lines by default
opt.joinspaces = false -- Prevents inserting two spaces after punctuation on a join (J)

-- set the width of the tab to 4 wide
-- This gets overridden by vim-sleuth, so that's nice
-- Some other tips from http://stevelosh.com/blog/2010/09/coming-home-to-vim/
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-- Settings needed for .lvimrc
opt.exrc = true
opt.secure = true

opt.swapfile = false -- Don't use swapfile

opt.tags = ".git/tags"

-- Decent wildmenu
opt.wildmenu = true
--opt.wildmode=list:longest
opt.wildmode = "list:full"
--opt.wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor
opt.wildignore = "+= .hg,.git,.svn" --Version control
opt.wildignore = "+=*.aux,*.out,*.toc" --LaTeX intermediate files
opt.wildignore = "+=*.jpg,*.bmp,*.gif,*.png,*.jpeg" --binary images
opt.wildignore = "+=*.o,*.obj,*.exe,*.dll,*.manifest" --compiled object files
opt.wildignore = "+=*.spl" --compiled spelling word lists
opt.wildignore = "+=*.sw?" --Vim swap files
opt.wildignore = "+=*.DS_Store" --OSX bullshit
opt.wildignore = "+=*.luac" --Lua byte code
opt.wildignore = "+=migrations" --Django migrations
opt.wildignore = "+=go/pkg" --Go static files
opt.wildignore = "+=go/bin" --Go bin files
opt.wildignore = "+=go/bin-vagrant" --Go bin-vagrant files
opt.wildignore = "+=*.pyc" --Python byte code
opt.wildignore = "+=*.orig" --Merge resolution files

-- Wrapping options
opt.formatoptions = "tc" -- wrap text and comments using textwidth
opt.formatoptions = opt.formatoptions + "r" -- continue comments when pressing ENTER in I mode
opt.formatoptions = opt.formatoptions + "q" -- enable formatting of comments with gq
opt.formatoptions = opt.formatoptions + "n" -- detect lists for formatting
opt.formatoptions = opt.formatoptions + "b" -- auto-wrap in insert mode, and do not wrap old long lines

-- Proper search
opt.incsearch = true -- Shows the match while typing
opt.ignorecase = true
opt.smartcase = true -- ... but not when search pattern contains upper case characters
opt.gdefault = true -- search/replace "globally" (on a line) by default

-- GUI settings
-- opt.guioptions = opt.guioptions - "T" -- Remove toolbar
-- opt.vb = "t_vb=" -- No more beeps
opt.backspace = "2" --Backspace over newlines
opt.cmdheight = 2
opt.tw = 79
opt.cursorline = true
opt.cursorcolumn = true
opt.ttyfast = true
-- https://github.com/vim/vim/issues/1735#issuecomment-383353563
opt.lazyredraw = true -- don't update the display while executing macros<Paste>
opt.synmaxcol = 500
opt.laststatus = 2 --  always have a statusline
-- vim.wo.relativenumber = true
opt.relativenumber = true -- Relative line numbers
opt.number = true -- Also show current absolute line
opt.diffopt = opt.diffopt + "iwhite" -- No whitespace in vimdiff
-- Make diffing better: https://vimways.org/2018/the-power-of-diff/
opt.diffopt = opt.diffopt + "internal,algorithm:patience"
opt.diffopt = opt.diffopt + "indent-heuristic"
opt.colorcolumn = "80" -- and give me a colored column
opt.showcmd = true -- Show (partial) command in status line.
opt.shortmess = opt.shortmess + "c" -- don't give |ins-completion-menu| messages.

-- Completion
-- Better completion
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
-- opt.completeopt = "menuone,noinsert,noselect"
opt.completeopt = { "menu", "menuone", "noselect" }
vim.cmd "let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']"

-- Make it so there are always ten lines below my cursor
opt.scrolloff = 10

-- Show those damn hidden characters
-- Verbose: opt.listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
opt.listchars = "nbsp:¬,extends:»,precedes:«,trail:•"

-- Make pyenv and neovim work nice together
opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
opt.inccommand = "nosplit"

-- noremap <C-q> :confirm qall<CR>
-- if not vim.fn.has('gui_running') then vim.opt.t_Co = 256 end

-- spell setting
vim.cmd([[
set spelllang=en_us
for d in glob('~/.config/nvim/spell/*.add', 1, 1)
  if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
    exec 'mkspell! ' . fnameescape(d)
  endif
endfor
set spellsuggest=best,9
hi clear SpellBad
" hi SpellBad ctermfg=000 guifg=#000
hi SpellBad cterm=underline gui=undercurl

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

]])

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
