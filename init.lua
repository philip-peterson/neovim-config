vim.cmd("set expandtab")
vim.cmd("set ts=2")
vim.cmd("set sts=2")
vim.cmd("set sw=2")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugins = {
	--{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }
  {"iagorrr/noctishc.nvim"}
}

-- Setup lazy.nvim
require("lazy").setup({
  spec = plugins,

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },

  -- ui config
	ui = {
		border = "double",
		size = {
			width = 0.8,
			height = 0.8,
		},
	},

  -- automatically check for plugin updates
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},

})
