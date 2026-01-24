return {
	{
		"xixiaofinland/sf.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"ibhagwan/fzf-lua",
		},
		config = function()
			local sf = require("sf")

			sf.setup({
				fetch_org_list_at_nvim_start = true,
				terminal = "integrated",
				term_config = {
					dimensions = {
						height = 0.4,
						width = 0.8,
					},
				},
			})

			-- KEYBINDINGS
			local map = vim.keymap.set

			-- Org Management
			map("n", "<leader>so", sf.set_target_org, { desc = "SF: Set Target Org" })
			map("n", "<leader>sl", sf.fetch_org_list, { desc = "SF: Refresh/List Orgs" }) -- Changed from org_list

			-- Deploy / Retrieve
			-- Note: In some versions, these are sf.save_and_push and sf.retrieve
			map("n", "<leader>sd", sf.save_and_push, { desc = "SF: Deploy Current File" })
			map("n", "<leader>sr", sf.retrieve, { desc = "SF: Retrieve Current File" })

			-- Metadata Browsing
			map("n", "<leader>st", "<cmd>SF mdtype pull<CR>", { desc = "SF: Pull Metadata Types" })
			map("n", "<leader>sm", sf.list_md_to_retrieve, { desc = "SF: List Metadata to Pull" })

			-- Testing
			-- The specific function for "all tests in file" is often named as follows:
			map("n", "<leader>ta", sf.run_all_tests_in_this_file, { desc = "SF: Run All Tests in File" })
		end,
	},
}
