-- ============================================================================
-- AI Plugins
-- ============================================================================

return {
  -- ============================================================================
  -- Sidekick - AI Assistant
  -- ============================================================================
  {
    'folke/sidekick.nvim',
    cmd = { 'Sidekick' },
    keys = {
      { '<leader>ai', mode = 'n', desc = 'Toggle AI Assistant' },
      { '<leader>ai', mode = 'v', desc = 'Send to AI Assistant' },
      { '<leader>o',  mode = 'n', desc = 'Toggle OpenCode' },
    },
    config = function()
      local ok, sidekick = pcall(require, 'sidekick')
      if not ok then
        return
      end

      local hostname = vim.fn.hostname()
      local tool = (hostname == "MacBook-Air-de-rin.local") and "gemini" or "claude"

      sidekick.setup({
        nes = { enabled = false },
        cli = {
          watch = false,
          win = { layout = "right" },
          tools = {
            gemini = { cmd = { "gemini" } },
            claude  = { cmd = { "claude.sh" } },
          },
        },
      })

      -- Keymaps
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>ai", ":Sidekick cli toggle name=" .. tool .. "<CR>", opts)
      vim.keymap.set("v", "<leader>ai", ":'<,'>Sidekick cli prompt name=" .. tool .. "<CR>", opts)
      vim.keymap.set("n", "<leader>o", function()
        local Session = require("sidekick.cli.session")
        local State = require("sidekick.cli.state")
        local Config = require("sidekick.config")
        Session.setup()
        local tool_cfg = Config.get_tool("opencode")
        State.attach({ tool = tool_cfg }, { show = true, focus = true })
      end, opts)
    end,
  },
}
