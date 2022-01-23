-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jethros/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jethros/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jethros/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jethros/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jethros/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/committia.vim",
    url = "https://github.com/rhysd/committia.vim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim",
    url = "https://github.com/nvim-lua/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  orgmode = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["semantic-highlight.vim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/semantic-highlight.vim",
    url = "https://github.com/jaxbot/semantic-highlight.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/vim-code-dark",
    url = "https://github.com/tomasiser/vim-code-dark"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-fish",
    url = "https://github.com/dag/vim-fish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grammarous"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-markdown-toc"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc",
    url = "https://github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-yaml"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-yaml",
    url = "https://github.com/stephpy/vim-yaml"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/jethros/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-grammarous', 'vim-markdown', 'vim-markdown-toc'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'vimtex', 'vim-grammarous'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'vim-yaml'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex', 'vim-grammarous'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/jethros/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
