-- lua/plugins/claude.lua
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" }, -- Optional, for better terminal handling
    cmd = "ClaudeCode",
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>as", ":ClaudeCodeSend<cr>", mode = "v", desc = "Send Selection to Claude" },
    },
    opts = {
      -- Point this to where your 'claude' binary is installed
      terminal_cmd = "claude", 
    },
  }
}
