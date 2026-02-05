-- ============================================================================
-- Tools & Utilities
-- ============================================================================

return {
  -- ============================================================================
  -- Terminal
  -- ============================================================================
  {
    'voldikss/vim-floaterm',
    cmd = { 'FloatermNew', 'FloatermToggle' },
    config = function()
      vim.g.floaterm_autoclose = 2
    end,
  },

  { 
    'preservim/vimux',
    cmd = { 'VimuxOpenRunner', 'VimuxRunLastCommand' },
  },
}
