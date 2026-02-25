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
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "<leader>rr", ":RustLsp runnables<CR>", vim.tbl_extend("force", opts, { desc = "Rust: Runnables" }))
            vim.keymap.set("n", "<leader>rd", ":RustLsp debuggables<CR>", vim.tbl_extend("force", opts, { desc = "Rust: Debuggables" }))
            vim.keymap.set("n", "<leader>rt", ":RustLsp testables<CR>", vim.tbl_extend("force", opts, { desc = "Rust: Testables" }))
            vim.keymap.set("n", "<leader>rm", ":RustLsp expandMacro<CR>", vim.tbl_extend("force", opts, { desc = "Rust: Expand Macro" }))
            vim.keymap.set("n", "<leader>re", ":RustLsp explainError<CR>", vim.tbl_extend("force", opts, { desc = "Rust: Explain Error" }))
            vim.keymap.set("n", "<leader>rc", ":RustLsp openCargo<CR>", vim.tbl_extend("force", opts, { desc = "Rust: Open Cargo.toml" }))
            vim.keymap.set("n", "<leader>rp", ":RustLsp parentModule<CR>", vim.tbl_extend("force", opts, { desc = "Rust: Parent Module" }))
          end,
          default_settings = {
            ['rust-analyzer'] = {
              checkOnSave = true,
              check = {
                command = "clippy",
              },
            },
          },
        },
      }
    end
  },
}
