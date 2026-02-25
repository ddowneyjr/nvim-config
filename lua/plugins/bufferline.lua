return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufReadPre",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "slant",
			show_buffer_close_icons = true,
			show_close_icon = false,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
	keys = {
		{ "<leader>b[", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer: Previous" },
		{ "<leader>b]", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer: Next" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer: Previous" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer: Next" },
		{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Buffer: Pick" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Buffer: Close others" },
	},
}
