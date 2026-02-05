-- ============================================================================
-- Coding: Completion, Linting, Formatting
-- ============================================================================

return {
  -- ============================================================================
  -- Completion - nvim-cmp
  -- ============================================================================
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp_ok, cmp = pcall(require, 'cmp')
      if not cmp_ok then
        return
      end

      local luasnip_ok, luasnip = pcall(require, 'luasnip')
      if not luasnip_ok then
        return
      end

      -- Load friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'luasnip', priority = 100 },
          { name = 'buffer', priority = 80, keyword_length = 3 },
          { name = 'path', priority = 60 },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              luasnip = '[Snip]',
              buffer = '[Buf]',
              path = '[Path]',
            })[entry.source.name]
            return vim_item
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = true,
        },
      })

      -- Cmdline completion for '/'
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Cmdline completion for ':'
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline', keyword_length = 2 }
        })
      })
    end,
  },

  -- ============================================================================
  -- Legacy Completion (fallback)
  -- ============================================================================
  {
    'ervandew/supertab',
    event = 'InsertEnter',
  },

  {
    'honza/vim-snippets',
  },

  -- ============================================================================
  -- Linting & Formatting - ALE
  -- ============================================================================
  {
    'dense-analysis/ale',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- Ruff configuration
      vim.g.ale_python_ruff_executable = 'ruff'
      vim.g.ale_python_ruff_options = '--line-length 120'
      vim.g.ale_python_ruff_format_options = '--line-length 120'
      vim.g.ale_python_ruff_auto_pipenv = 1
      vim.g.ale_python_ruff_auto_poetry = 1

      -- ALE configuration
      vim.g.ale_completion_enabled = 1
      vim.g.ale_linters = {
        python = {'ruff'},
        yaml = {'yamllint'},
        rust = {'analyzer'},
        markdown = {'markdownlint'},
        gitcommit = {'commitlint'}
      }
      vim.g.ale_linters_ignore = {
        terraform = {'terraform'}
      }
      vim.g.ale_fixers = {
        python = {'ruff', 'ruff_format'},
        javascript = {'prettier', 'eslint'},
        rego = {'opafmt', 'remove_trailing_lines', 'trim_whitespace'},
        rust = {'remove_trailing_lines', 'rustfmt', 'trim_whitespace'},
        terraform = {'remove_trailing_lines', 'terraform'},
        yaml = {'remove_trailing_lines', 'trim_whitespace'},
        markdown = {'prettier', 'remove_trailing_lines', 'trim_whitespace'}
      }
      vim.g.ale_yaml_yamllint_options = '-d "{extends: relaxed, rules: {line-length: disable}}"'
      vim.g.ale_markdown_markdownlint_options = '--config ~/.markdownlint.json'
      vim.g.ale_echo_msg_error_str = 'E'
      vim.g.ale_echo_msg_warning_str = 'W'
      vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
      vim.g.ale_virtualtext_cursor = 1
      vim.g.ale_fix_on_save = 1
    end,
  },

  -- ============================================================================
  -- Additional Formatters
  -- ============================================================================
  {
    'sbdchd/neoformat',
    cmd = 'Neoformat',
  },

  -- ============================================================================
  -- EditorConfig
  -- ============================================================================
  {
    'editorconfig/editorconfig-vim',
  },

  -- ============================================================================
  -- Syntax & Pairs
  -- ============================================================================
  {
    'alvan/vim-closetag',
    ft = { 'html', 'xml', 'javascript', 'javascriptreact', 'typescriptreact' },
  },

  {
    'tpope/vim-commentary',
    event = 'VeryLazy',
  },

  -- ============================================================================
  -- Quickfix
  -- ============================================================================
  {
    'romainl/vim-qf',
  },

  -- ============================================================================
  -- Treesitter (better syntax)
  -- ============================================================================
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
      if not ok then
        return
      end

      treesitter.setup({
        ensure_installed = {
          'python', 'lua', 'vim', 'vimdoc', 'bash', 'json', 'yaml',
          'markdown', 'markdown_inline', 'go', 'rust', 'javascript',
          'typescript', 'html', 'css', 'terraform', 'hcl', 'toml'
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  -- ============================================================================
  -- Folding
  -- ============================================================================
  {
    'tmhedberg/SimpylFold',
    ft = 'python',
  },

  {
    'pedrohdz/vim-yaml-folds',
    ft = 'yaml',
  },

  {
    'Konfekt/FastFold',
  },
}
