local cmd = vim.cmd
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    -- Installer
    { "folke/lazy.nvim" },
    -- nvim enhancements
    { "tpope/vim-sleuth" }, -- Auto configure indentation
    { "gpanders/editorconfig.nvim" },
    { 'numToStr/Comment.nvim',     config = function() require('Comment').setup() end },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPost" },
        build = ':TSUpdate',
    },
    { 'nvim-telescope/telescope.nvim',           dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    { 'RRethy/nvim-align' },

    -- Theme
    { "tomasiser/vim-code-dark" },
    { "rebelot/kanagawa.nvim" },
    { "sainnhe/gruvbox-material" },

    -- GUI enhancements
    { "jaxbot/semantic-highlight.vim" }, -- different color for every variable
    { "windwp/nvim-autopairs" },
    { "ntpeters/vim-better-whitespace" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "p00f/nvim-ts-rainbow" },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup {}
        end
    },

    -- Software dev tools
    { "tpope/vim-fugitive" },
    -- { "junegunn/gv.vim" },     -- GV, GV!, GV?
    { "rhysd/committia.vim" }, -- better git commit layout
    -- { "tpope/vim-dispatch", opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },

    -- LSP support
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', },
            { 'williamboman/mason-lspconfig.nvim', },
            { 'simrat39/inlay-hints.nvim', },
            { 'jose-elias-alvarez/null-ls.nvim', },
            { 'jayp0521/mason-null-ls.nvim', }
        }
    },

    -- LSP utils
    { "nvim-lua/lsp_extensions.nvim" }, -- info and inlay hints
    { "ray-x/lsp_signature.nvim" },     -- function signatures
    {
        "j-hui/fidget.nvim",            -- lsp status
        config = function() require('fidget').setup {} end
    },
    { "SmiteshP/nvim-navic" },          -- display function name etc

    -- Coq
    {
        "ms-jpq/coq_nvim",
        branch = "coq",
        dependencies = { { "ms-jpq/coq.artifacts", branch = "artifacts" },
            { "ms-jpq/coq.thirdparty", branch = "3p" } }
    },
    { "folke/lua-dev.nvim" },

    -- Language support
    { "stephpy/vim-yaml",                    ft = 'yaml' },
    { "cespare/vim-toml",                    ft = 'toml' },
    { "dag/vim-fish",                        ft = 'fish' },
    { 'nvim-orgmode/orgmode',                config = function() require('orgmode').setup {} end },
    { "plasticboy/vim-markdown",             ft = 'markdown' },
    { "mzlogin/vim-markdown-toc",            ft = 'markdown' },
    { "alvan/vim-closetag" },

    -- Rust
    { "simrat39/rust-tools.nvim" },
    -- C++ and Clang
    { "octol/vim-cpp-enhanced-highlight",    ft = { "c", "cpp" } },
    { "drmikehenry/vim-headerguard",         ft = { "c", "cpp" } },
    { "bfrg/vim-cpp-modern",                 ft = { "c", "cpp" } },
    { "arakashic/chromatica.nvim",           ft = { "c", "cpp" } },
    { "rhysd/vim-clang-format",              ft = { "c", "cpp" } },

    -- SQL
    --  { "tami5/sql.nvim", rocks = { "sqlite", "luv" } }
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion" },
    { "kristijanhusak/vim-dadbod-ui" },

    -- writing
    { "junegunn/goyo.vim" },      -- Goyo, Goyo!
    { "junegunn/limelight.vim" }, -- Limelight, Limelight!
    { "rhysd/vim-grammarous" },

    -- LaTeX
    -- https://www.reddit.com/r/neovim/comments/idthcb/vimtex_vs_texlab/

    -- note taking
    -- https://mischavandenburg.com/zet/neovim-zettelkasten/
    {
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup({
                picker = "telescope",
                lsp = {
                    config = {
                        cmd = { "zk", "lsp" },
                        name = "zk",
                    },
                    auto_attach = {
                        enabled = true,
                        filetypes = { "markdown" },
                    },
                },
            })
        end
    }
})
