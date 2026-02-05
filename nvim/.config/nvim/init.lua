-- ============================================================================
-- Neovim Configuration - Entry Point
-- ============================================================================

-- Leader key must be set before lazy.nvim
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Load configuration modules
require("config.options")     -- General Neovim options
require("config.lazy")        -- Plugin manager setup
require("config.autocmds")    -- Autocommands
require("config.keymaps")     -- Keymaps

-- ============================================================================
-- End of Configuration
-- ============================================================================
