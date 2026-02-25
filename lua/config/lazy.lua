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


-- General Settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = 'unnamedplus' -- allows system clipboard for copy paste

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Window close' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Window split vertical' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Window split horizontal' })

-- Set jk to map to <Esc> in Insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'Exit Insert Mode with jk'})

-- Buffer keybinds
vim.keymap.set('n', '<leader>be', ':e ', { desc = 'Buffer: Open file' })
vim.keymap.set('n', '<leader>bn', ':enew<CR>', { desc = 'Buffer: New empty' })
vim.keymap.set('n', '<leader>bl', ':Telescope buffers<CR>', { desc = 'Buffer: List' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Buffer: Delete' })
vim.keymap.set('n', '<leader>bD', ':bd!<CR>', { desc = 'Buffer: Force delete' })

-- Turns on line numbers
vim.opt.number = true

-- Turns on relative line numbers
vim.opt.relativenumber = true


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})
