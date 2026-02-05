-- ============================================================================
-- Lazy.nvim Plugin Manager Configuration
-- ============================================================================

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
local plugins = {}

-- Load all plugin specs
local plugin_files = {
  "plugins.ui",
  "plugins.editor",
  "plugins.coding",
  "plugins.git",
  "plugins.languages",
  "plugins.tools",
  "plugins.obsidian",
  "plugins.ai",
}

for _, plugin_file in ipairs(plugin_files) do
  local ok, specs = pcall(require, plugin_file)
  if ok and type(specs) == "table" then
    for _, spec in ipairs(specs) do
      table.insert(plugins, spec)
    end
  end
end

require("lazy").setup(plugins, {
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "nord" }
  },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
  },
})

-- ============================================================================
-- End of Lazy Configuration
-- ============================================================================
