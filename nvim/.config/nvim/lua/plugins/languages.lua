-- ============================================================================
-- Language Support Plugins
-- ============================================================================

return {
  -- ============================================================================
  -- Python
  -- ============================================================================
  {
    'heavenshell/vim-pydocstring',
    ft = 'python',
    build = 'make install',
    config = function()
      vim.g.pydocstring_formatter = 'google'
      vim.g.pydocstring_doq_path = 'doq'
      vim.g.pydocstring_enable_mapping = 0
    end,
  },

  {
    'Vimjas/vim-python-pep8-indent',
    ft = 'python',
  },

  {
    'jeetsukumaran/vim-pythonsense',
    ft = 'python',
    config = function()
      vim.g.is_pythonsense_suppress_motion_keymaps = 0
      vim.g.is_pythonsense_suppress_object_keymaps = 0
      vim.g.is_pythonsense_alternate_motion_keymaps = 0
    end,
  },

  -- ============================================================================
  -- Infrastructure as Code
  -- ============================================================================
  {
    'pearofducks/ansible-vim',
    ft = 'yaml.ansible',
  },

  {
    'hashivim/vim-terraform',
    ft = 'terraform',
    config = function()
      vim.g.terraform_align = 0
      vim.g.terraform_fold_sections = 1
      vim.g.terraform_fmt_on_save = 0
    end,
  },

  -- ============================================================================
  -- Markdown
  -- ============================================================================
  {
    'godlygeek/tabular',
    cmd = 'Tabularize',
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    'plasticboy/vim-markdown',
    ft = 'markdown',
    dependencies = { 'godlygeek/tabular' },
    config = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_edit_url_in = 'tab'
      vim.g.vim_markdown_fenced_languages = {
        'ini=dosini', 'shell=sh', 'yml=yaml', 'python=python',
        'bash=sh', 'go=go', 'rust=rust', 'javascript=javascript', 'json=json'
      }
      vim.g.vim_markdown_folding_style_pythonic = 1
      vim.g.vim_markdown_follow_anchor = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vmt_auto_update_on_save = 1
    end,
  },

  {
    'skanehira/preview-markdown.vim',
    cmd = 'PreviewMarkdown',
    config = function()
      vim.g.preview_markdown_parser = 'glow'
      vim.g.preview_markdown_vertical = 1
    end,
  },

  {
    'vim-pandoc/vim-pandoc',
    ft = 'markdown',
  },

  {
    'vim-pandoc/vim-pandoc-syntax',
    ft = 'markdown',
  },

  -- ============================================================================
  -- LaTeX
  -- ============================================================================
  {
    'lervag/vimtex',
    ft = 'tex',
    config = function()
      vim.g.tex_flavor = 'latex'
    end,
  },
}
