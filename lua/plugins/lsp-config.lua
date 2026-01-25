return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "clangd",
        "jdtls",
        "rust_analyzer",
      },
    },
    dependencies = {
      { "williamboman/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- The new 0.11+ way: Define and then Enable

      -- 1. Lua Setup
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- 2. Customize it (Apex requires the specific path to its .jar)
      -- Cross-platform Java path detection
      local java_path
      local is_windows = vim.uv.os_uname().sysname == "Windows_NT"

      if is_windows then
        -- On Windows, use java from PATH or JAVA_HOME
        local java_home = os.getenv("JAVA_HOME")
        if java_home then
          java_path = java_home .. "\\bin\\java.exe"
        else
          java_path = "java" -- Assumes java is in PATH
        end
      else
        -- On macOS/Linux, use SDKMAN path
        java_path = vim.fn.expand("$HOME") .. "/.sdkman/candidates/java/17.0.10-tem/bin/java"
      end
      vim.lsp.config("apex_ls", {
        cmd = {
          java_path,
          "-jar",
          vim.fn.stdpath("data") .. "/mason/packages/apex-language-server/apex-jorje-lsp.jar",
        },
        -- Use the modern root_dir callback structure
        root_dir = function(bufnr, on_dir)
          on_dir(vim.fs.root(bufnr, { "sfdx-project.json", ".git" }))
        end,
        settings = {
          apex = {
            enable_semantic_errors = false,
            enable_completion_statistics = false,
          },
        },
      })

      -- 3. Enable it
      vim.lsp.enable("apex_ls")

      -- 2. Bulk Enable standard servers (Python, C++, Go, etc.)
      local servers = { "ts_ls", "html", "cssls", "clangd", "jdtls" }

      for _, server in ipairs(servers) do
        -- For basic setups, we just enable them.
        -- If they need default settings, we'd use vim.lsp.config first.
        vim.lsp.enable(server)
      end

      -- 3. The "Fancy Stuff" Keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)      -- Go to definition
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)            -- Hover documentation
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)      -- List references
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)  -- Rename variable
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show error
        end,
      })
    end,
  },
}
