return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended version
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        -- Server configuration
        server = {
          on_attach = function(client, bufnr)
            -- You can add Rust-specific keymaps here if you want
            -- Otherwise, it inherits the global LspAttach from above
          end,
          default_settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = "clippy", -- Enable clippy for better error finding
              },
            },
          },
        },
      }
    end
  },
}
