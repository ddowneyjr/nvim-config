return {
	{
		"xixiaofinland/sf.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"ibhagwan/fzf-lua",
		},
		ft = { "apex", "sosl", "soql", "javascript", "html", "css", "xml" },
		config = function()
			local sf = require("sf")

			sf.setup({
				fetch_org_list_at_nvim_start = false,
				terminal = "integrated",
				term_config = {
					dimensions = {
						height = 0.4,
						width = 0.8,
					},
				},
			})

			local map = vim.keymap.set

			-- Org Management
			map("n", "<leader>so", function() sf.set_target_org() end, { desc = "SF: Set Target Org" })
			map("n", "<leader>sl", function() sf.fetch_org_list() end, { desc = "SF: Refresh/List Orgs" })

			-- Deploy / Retrieve
			map("n", "<leader>sd", function() sf.save_and_push() end, { desc = "SF: Deploy Current File" })
			map("n", "<leader>sr", function() sf.retrieve() end, { desc = "SF: Retrieve Current File" })

			-- Metadata Browsing
			map("n", "<leader>sm", function() sf.list_md_to_retrieve() end, { desc = "SF: List Metadata to Pull" })

			-- Testing
			map("n", "<leader>ta", function() sf.run_current_test() end, { desc = "SF: Run Current Test" })
			map("n", "<leader>tA", function() sf.run_all_tests_in_this_file() end, { desc = "SF: Run All Tests in File" })
		end,
	},
}
