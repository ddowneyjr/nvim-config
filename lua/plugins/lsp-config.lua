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
				"basedpyright",
				"clangd",
				"jdtls",
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

			-- 2. Apex Setup (SDKMAN Fix)
			-- ADDED THE MISSING SLASH HERE:
			local java_path = vim.fn.expand("$HOME") .. "/.sdkman/candidates/java/17.0.10-tem/bin/java"

			vim.lsp.config("apex_ls", {
				cmd = {
					java_path,
					"-jar",
					vim.fn.stdpath("data") .. "/mason/packages/apex-language-server/apex-jorje-lsp.jar",
				},
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
			vim.lsp.enable("apex_ls")

			-- 3. Bulk Enable standard servers
			local servers = { "ts_ls", "html", "cssls", "basedpyright", "clangd", "jdtls" }
			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end

			-- 4. Keybindings
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				end,
			})
		end,
	},
}
