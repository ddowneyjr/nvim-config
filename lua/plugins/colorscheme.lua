return {

  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function()
      vim.opt.termguicolors = true
      vim.cmd([[colorscheme gruvbox]])

      -- making nvim transparent
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
