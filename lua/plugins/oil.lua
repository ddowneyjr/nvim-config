return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#ebdbb2', bg = 'none' })
      local oil = require("oil")
      oil.setup({
        float = {
          padding = 2,
          border = "rounded",
        },
      })
      vim.keymap.set("n", "-", oil.toggle_float, {})
    end,
  },
}
