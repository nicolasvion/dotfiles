-- ============================================================================
-- Editor & Navigation Plugins
-- ============================================================================

return {
  -- ============================================================================
  -- File Explorer
  -- ============================================================================
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,  -- Always load to enable auto-open
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle file explorer' },
    },
    config = function()
      local ok, nvimtree = pcall(require, 'nvim-tree')
      if not ok then
        return
      end

      local tree_api_ok, tree_api = pcall(require, 'nvim-tree.api')
      if not tree_api_ok then
        return
      end

      nvimtree.setup({
        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
          custom = { '.git$' },
        },
      })

      -- Auto open nvim-tree if no file specified
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          if vim.fn.argc() == 0 then
            tree_api.tree.open()
          end
       end
      })
    end,
  },

  -- ============================================================================
  -- Flash Navigation
  -- ============================================================================
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          enabled = true,
          jump_labels = true,
        },
        search = {
          enabled = true,
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-f>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- ============================================================================
  -- Fuzzy Finder - FZF
  -- ============================================================================
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },

  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    config = function()
      vim.env.FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -L -g"!{node_modules,vendor,.idea,.datas}/*"'
      vim.env.FZF_DEFAULT_OPTS = "--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
      vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
      vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

      -- Custom commands
      vim.cmd([[
        command! -bang AnsibleFiles call fzf#vim#files('~/work/ansible', {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
        command! -bang WorkFiles call fzf#vim#files('~/work/', {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
        command! -bang GitlabFiles call fzf#vim#files('~/work/gitlab', {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
        command! -bang -nargs=* GGrep
          \ call fzf#vim#grep(
          \   'git grep --line-number '.shellescape(<q-args>), 0,
          \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
      ]])
    end,
  },

  {
    'stsewd/fzf-checkout.vim',
    dependencies = { 'junegunn/fzf' },
    config = function()
      vim.g.fzf_checkout_git_options = '--sort=-committerdate'
    end,
  },

  -- ============================================================================
  -- Telescope
  -- ============================================================================
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
      { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Recent Files' },
      { '<leader>fc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
      { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Grep String' },
    },
    config = function()
      local ok, telescope = pcall(require, 'telescope')
      if not ok then
        return
      end

      local actions_ok, actions = pcall(require, 'telescope.actions')
      if not actions_ok then
        return
      end

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
          },
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "*.pyc",
            "__pycache__",
            ".venv",
            "venv",
            "*.egg-info",
            ".pytest_cache",
            ".mypy_cache",
            ".ruff_cache",
          },
        },
      })

      pcall(telescope.load_extension, 'fzf')
    end,
  },

  -- ============================================================================
  -- Search & Replace
  -- ============================================================================
  {
    'jremmen/vim-ripgrep',
    cmd = 'Rg',
  },

  -- ============================================================================
  -- Utilities
  -- ============================================================================
  {
    'nvim-lua/popup.nvim',
  },

  {
    'nvim-lua/plenary.nvim',
  },

  -- ============================================================================
  -- Code Structure
  -- ============================================================================
  {
    'majutsushi/tagbar',
    cmd = 'TagbarToggle',
  },

  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<leader>u', '<cmd>UndotreeShow<cr>', desc = 'Show Undotree' },
    },
  },
}
