local g = vim.g

-- vim.cmd "colorscheme gruvbox-material"
vim.cmd "colorscheme kanagawa"
-- vim.cmd "colorscheme codedark"

-- Ignore for indent levels
g.indent_blankline_filetype_exclude = { "help", "packer", "dashboard", "nvim-tree" }

-- Ignore for indent levels
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }

-- Configs for LSPs
g.lsp_config = { lua = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } } }

-- better whitespace
-- red #FF0000, coral #FF7F50, tomato #FF6347, orangered #FF4500, orange #FFA500, darkorange #FF8C00
g.better_whitespace_guicolor = '#FF4500'
g.better_whitespace_enabled = 1
g.strip_whitespace_on_save = 0

-- Don't confirm .lvimrc
g.localvimrc_ask = 0

-- █▓▒░ Language setting
--
-- Rust
-- https://github.com/rust-lang/rust.vim/issues/192
g.rustfmt_autosave = 1 -- Format on save
g.rustfmt_emit_files = 1
g.rustfmt_fail_silently = 0
-- g.rust_keep_autopairs_default = 1
g.rust_clip_command = 'xclip -selection clipboard'

-- Markdown
g.vim_markdown_conceal = 0
-- g.vim_markdown_folding_disabled = 1
g.vim_markdown_new_list_item_indent = 0
g.vim_markdown_auto_insert_bullets = 0
g.vim_markdown_frontmatter = 1
g.vim_markdown_math = 1

-- Base markdown settings (tpope)
g.markdown_folding = 0

vim.wo.foldcolumn = '1'
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true

-- Python
-- https://quinoa42.github.io/en/oceanus/neovim-python/
if vim.fn.isdirectory('./../../pyenv') then
    local pyenv_root = os.getenv('PYENV_ROOT')
    -- g.python_host_prog = pyenv_root .. '/versions/neovim2/bin/python'
    g.python3_host_prog = pyenv_root .. '/versions/neovim3/bin/python'
end

-- vimtex
g.tex_flavor = 'latex'
g.vimtex_view_method = 'zathura'
g.vimtex_quickfix_mode = 0
vim.cmd "set conceallevel=1"
g.tex_conceal = 'abdmg'
