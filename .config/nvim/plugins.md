# 📦 Neovim Plugins Guide

> Complete configuration of installed plugins and their purpose

---

## 🎨 Theme and Interface

### arcticicestudio/nord-vim
**Nord Color Theme** - Elegant and sober color palette inspired by arctic colors.
- Eye-friendly colors
- Excellent contrast
- Complete syntax support

🔗 [GitHub](https://github.com/arcticicestudio/nord-vim) | ⭐ 2.5k stars

### vim-airline/vim-airline
**Enhanced Status Bar** - Displays useful information at the bottom of the screen.
- File name and path
- Current mode (INSERT, NORMAL, VISUAL)
- Cursor position
- File type
- Active Git branch

🔗 [GitHub](https://github.com/vim-airline/vim-airline) | ⭐ 17.7k stars

### vim-airline/vim-airline-themes
**Airline Themes** - Theme collection to customize the status bar.

🔗 [GitHub](https://github.com/vim-airline/vim-airline-themes) | ⭐ 2k stars

---

## 🎯 Focus and Productivity

### junegunn/goyo.vim
**Zen Mode** - Distraction-free writing in fullscreen.
- Hides all interface elements
- Centers text
- Perfect for documentation writing
- **Shortcut**: `go`

🔗 [GitHub](https://github.com/junegunn/goyo.vim) | ⭐ 4.5k stars

### junegunn/limelight.vim
**Focus Mode** - Highlights the current paragraph.
- Dims everything except current paragraph
- Helps focus on one section
- **Shortcut**: `<leader>l`

🔗 [GitHub](https://github.com/junegunn/limelight.vim) | ⭐ 2.4k stars

### szw/vim-maximizer
**Maximize Panes** - Temporarily enlarges a pane.
- Useful when you have multiple splits
- **Shortcut**: `,z`

🔗 [GitHub](https://github.com/szw/vim-maximizer) | ⭐ 600 stars

### kshenoy/vim-signature
**Visual Marks** - Displays marks in the margin.
- See where your marks are
- Quick navigation

🔗 [GitHub](https://github.com/kshenoy/vim-signature) | ⭐ 2k stars

---

## 📁 Navigation and Files

### nvim-tree/nvim-tree.lua
**File Explorer** - Modern and fast file tree.
- Navigate through folders
- Create/delete/rename files
- Icons for file types
- Opens automatically on startup

🔗 [GitHub](https://github.com/nvim-tree/nvim-tree.lua) | ⭐ 7k stars

### nvim-tree/nvim-web-devicons
**File Icons** - Adds colored icons for each file type.
- Quick visual recognition
- Support for many file types

🔗 [GitHub](https://github.com/nvim-tree/nvim-web-devicons) | ⭐ 2k stars

### junegunn/fzf + fzf.vim
**Fuzzy Search** - Ultra-fast file and content search.
- Search files by name
- Search in content (with ripgrep)
- File history
- Buffer list
- **Shortcuts**: `,f`, `,b`, `ff`, `fa`, `fg`

🔗 [GitHub FZF](https://github.com/junegunn/fzf) | ⭐ 64k stars
🔗 [GitHub FZF.vim](https://github.com/junegunn/fzf.vim) | ⭐ 9.5k stars

### stsewd/fzf-checkout.vim
**Git Branch Management** - Quick branch switching with FZF.
- Lists all branches
- Quick checkout
- **Shortcut**: `gb`

🔗 [GitHub](https://github.com/stsewd/fzf-checkout.vim) | ⭐ 400 stars

### nvim-telescope/telescope.nvim
**Advanced Search** - Modern alternative to FZF with preview.
- File search
- Content search (live grep)
- Command history
- Neovim help
- **Shortcuts**: `<leader>ff`, `<leader>fg`, `<leader>fb`

🔗 [GitHub](https://github.com/nvim-telescope/telescope.nvim) | ⭐ 15k stars

### nvim-telescope/telescope-fzf-native.nvim
**Telescope Acceleration** - Ultra-fast native search algorithm.

🔗 [GitHub](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | ⭐ 1.4k stars

---

## ✍️ Autocompletion and Snippets

### hrsh7th/nvim-cmp
**Completion Engine** - Modern and extensible completion system.
- Smart suggestions while typing
- Multiple source support
- Elegant interface with borders
- Ghost text (preview)
- **Shortcuts**: `<Tab>`, `<S-Tab>`, `<CR>`, `<C-Space>`

🔗 [GitHub](https://github.com/hrsh7th/nvim-cmp) | ⭐ 7.8k stars

### hrsh7th/cmp-buffer
**Buffer Completion** - Suggests words already present in the file.
- Learns from your code
- Minimum 3 characters

🔗 [GitHub](https://github.com/hrsh7th/cmp-buffer) | ⭐ 500 stars

### hrsh7th/cmp-path
**Path Completion** - File path autocompletion.
- Suggests folders and files
- Works with `./`, `../`, `/`

🔗 [GitHub](https://github.com/hrsh7th/cmp-path) | ⭐ 400 stars

### hrsh7th/cmp-cmdline
**Command Line Completion** - Autocompletion for `:` and `/`.
- Vim commands
- Buffer search

🔗 [GitHub](https://github.com/hrsh7th/cmp-cmdline) | ⭐ 500 stars

### L3MON4D3/LuaSnip
**Snippet Engine** - Snippet management (code templates).
- Snippet expansion
- Placeholder navigation
- Custom snippet support

🔗 [GitHub](https://github.com/L3MON4D3/LuaSnip) | ⭐ 3.3k stars

### saadparwaiz1/cmp_luasnip
**LuaSnip Integration** - Connects LuaSnip to nvim-cmp.

🔗 [GitHub](https://github.com/saadparwaiz1/cmp_luasnip) | ⭐ 400 stars

### rafamadriz/friendly-snippets
**Snippet Collection** - Snippet library for all languages.
- Python: `def`, `class`, `if`, `for`, etc.
- JavaScript: `func`, `arrow`, `promise`
- HTML: `html5`, `div`, `script`
- And much more!

🔗 [GitHub](https://github.com/rafamadriz/friendly-snippets) | ⭐ 1.9k stars

### ervandew/supertab (legacy)
**Tab Completion** - Fallback if nvim-cmp is not available.

🔗 [GitHub](https://github.com/ervandew/supertab) | ⭐ 3.1k stars

### honza/vim-snippets (legacy)
**Classic Snippets** - Snippet collection for vim-snippets.

🔗 [GitHub](https://github.com/honza/vim-snippets) | ⭐ 4.9k stars

---

## 🔀 Git

### tpope/vim-fugitive
**Integrated Git** - Git commands directly in Vim.
- `:Git status`, `:Git commit`, `:Git push`
- Conflict resolution
- Blame, diff, log

🔗 [GitHub](https://github.com/tpope/vim-fugitive) | ⭐ 19.8k stars

### airblade/vim-gitgutter
**Git Indicators** - Shows modifications in the margin.
- Added lines (+)
- Modified lines (~)
- Deleted lines (-)

🔗 [GitHub](https://github.com/airblade/vim-gitgutter) | ⭐ 8.3k stars

### lewis6991/gitsigns.nvim
**Modern Git Signs** - Lua version of gitgutter with more features.
- Navigate between hunks
- Stage/unstage hunks
- Preview modifications
- Inline blame
- **Shortcuts**: `]h`, `[h`, `<leader>hs`, `<leader>hp`

🔗 [GitHub](https://github.com/lewis6991/gitsigns.nvim) | ⭐ 5k stars

### lambdalisue/gina.vim
**Git Interface** - Git commands with enhanced interface.
- Interactive status
- Commit with preview
- **Shortcuts**: `gs`, `ga`, `gc`, `gp`

🔗 [GitHub](https://github.com/lambdalisue/gina.vim) | ⭐ 700 stars

### jreybert/vimagit
**Magit for Vim** - Git interface inspired by Magit (Emacs).
- Complete Git interface
- **Shortcut**: `gi`

🔗 [GitHub](https://github.com/jreybert/vimagit) | ⭐ 1.5k stars

### junegunn/gv.vim
**Commit Browser** - Git history visualization.
- Commit graph
- Integrated diff
- **Shortcut**: `gl`

🔗 [GitHub](https://github.com/junegunn/gv.vim) | ⭐ 3.4k stars

### whiteinge/diffconflicts
**Conflict Resolution** - Tool to resolve merge conflicts.
- 3-way merge view
- Easy version choice

🔗 [GitHub](https://github.com/whiteinge/diffconflicts) | ⭐ 400 stars

### shumphrey/fugitive-gitlab.vim
**GitLab Support** - GitLab integration for fugitive.
- Opens MRs in browser
- Custom GitLab domain support

🔗 [GitHub](https://github.com/shumphrey/fugitive-gitlab.vim) | ⭐ 300 stars

### akinsho/git-conflict.nvim
**Modern Conflict Resolution** - Visual Git conflict resolution.
- Conflict highlighting
- Quick version choice
- **Shortcuts**: `<leader>co`, `<leader>ct`, `<leader>cb`, `]x`, `[x`

🔗 [GitHub](https://github.com/akinsho/git-conflict.nvim) | ⭐ 1.2k stars

### NeogitOrg/neogit
**Complete Git Interface** - Magit clone for Neovim.
- Interactive interface
- Visual stage/unstage
- Integrated commit, push, pull
- **Shortcut**: `<leader>gg`

🔗 [GitHub](https://github.com/NeogitOrg/neogit) | ⭐ 3.9k stars

---

## 🎨 Syntax and Coloring

### jiangmiao/auto-pairs
**Auto Close** - Automatically closes parentheses, brackets, etc.
- `(` → `()`
- `{` → `{}`
- `"` → `""`

🔗 [GitHub](https://github.com/jiangmiao/auto-pairs) | ⭐ 4k stars

### alvan/vim-closetag
**HTML Tag Closing** - Automatically closes HTML/XML tags.
- `<div>` → `<div></div>`

🔗 [GitHub](https://github.com/alvan/vim-closetag) | ⭐ 3.4k stars

### Yggdroot/indentLine
**Indentation Guides** - Shows vertical lines for indentation.
- Code structure visualization
- Helps align code

🔗 [GitHub](https://github.com/Yggdroot/indentLine) | ⭐ 4.1k stars

### nvim-treesitter/nvim-treesitter
**Advanced Syntax Highlighting** - Code parser for better coloring.
- Precise and contextual coloring
- Support for many languages
- Smart indentation
- Text object selection
- **Objects**: `af`, `if`, `ac`, `ic`

🔗 [GitHub](https://github.com/nvim-treesitter/nvim-treesitter) | ⭐ 10k stars

---

## 🛠️ Development Tools

### romainl/vim-qf
**Enhanced Quickfix** - Improves the quickfix window.
- Easier navigation
- Result filtering

🔗 [GitHub](https://github.com/romainl/vim-qf) | ⭐ 800 stars

### tpope/vim-commentary
**Comments** - Easy comment/uncomment.
- **Shortcut**: `gcc` (line), `gc` (selection)

🔗 [GitHub](https://github.com/tpope/vim-commentary) | ⭐ 5.8k stars

### dense-analysis/ale
**Linting and Fixing** - Automatic code checking and correction.
- Support for many linters (ruff, eslint, yamllint, etc.)
- Automatic formatting on save
- Real-time error display
- **Shortcuts**: `;an`, `;ap`

🔗 [GitHub](https://github.com/dense-analysis/ale) | ⭐ 13.5k stars

### sbdchd/neoformat
**Code Formatting** - Alternative to ALE for formatting.
- Support for many formatters

🔗 [GitHub](https://github.com/sbdchd/neoformat) | ⭐ 2k stars

### editorconfig/editorconfig-vim
**EditorConfig** - Respects project conventions.
- Reads `.editorconfig` files
- Automatically applies rules

🔗 [GitHub](https://github.com/editorconfig/editorconfig-vim) | ⭐ 3.1k stars

### mbbill/undotree
**Undo Tree** - Visualizes modification history.
- Navigate through history
- Undo branches
- **Shortcut**: `<leader>u`

🔗 [GitHub](https://github.com/mbbill/undotree) | ⭐ 3.7k stars

---

## 📂 Folding (Code Folding)

### tmhedberg/SimpylFold
**Python Folding** - Smart folding for Python.
- Folds functions and classes
- Docstring preview

🔗 [GitHub](https://github.com/tmhedberg/SimpylFold) | ⭐ 1k stars

### pedrohdz/vim-yaml-folds
**YAML Folding** - Folding for YAML files.
- Visible hierarchical structure

🔗 [GitHub](https://github.com/pedrohdz/vim-yaml-folds) | ⭐ 150 stars

### Konfekt/FastFold
**Fast Folding** - Optimizes folding performance.
- Smart updates
- No slowdown

🔗 [GitHub](https://github.com/Konfekt/FastFold) | ⭐ 700 stars

---

## 🏗️ Infrastructure and DevOps

### pearofducks/ansible-vim
**Ansible Support** - Syntax and indentation for Ansible.
- Playbook coloring
- Automatic Ansible file detection
- Module completion

🔗 [GitHub](https://github.com/pearofducks/ansible-vim) | ⭐ 800 stars

### hashivim/vim-terraform
**Terraform Support** - Syntax and tools for Terraform.
- HCL coloring
- Formatting with `terraform fmt`
- Resource folding

🔗 [GitHub](https://github.com/hashivim/vim-terraform) | ⭐ 1k stars

---

## 📝 Markdown and Documentation

### godlygeek/tabular
**Text Alignment** - Aligns text on characters.
- Markdown tables
- Code alignment

🔗 [GitHub](https://github.com/godlygeek/tabular) | ⭐ 1.9k stars

### plasticboy/vim-markdown
**Enhanced Markdown** - Markdown syntax and features.
- Section folding
- Header navigation
- Fenced code block support

🔗 [GitHub](https://github.com/plasticboy/vim-markdown) | ⭐ 4.7k stars

### skanehira/preview-markdown.vim
**Markdown Preview** - Displays rendered Markdown.
- Uses glow for rendering
- **Shortcut**: `,md`

🔗 [GitHub](https://github.com/skanehira/preview-markdown.vim) | ⭐ 200 stars

### vim-pandoc/vim-pandoc + vim-pandoc-syntax
**Pandoc Support** - Pandoc integration for Markdown.
- Format conversion
- Extended syntax

🔗 [GitHub vim-pandoc](https://github.com/vim-pandoc/vim-pandoc) | ⭐ 950 stars
🔗 [GitHub vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax) | ⭐ 400 stars

---

## 📐 LaTeX

### lervag/vimtex
**LaTeX Support** - LaTeX editing and compilation.
- Automatic compilation
- PDF preview
- Document navigation
- Command completion

🔗 [GitHub](https://github.com/lervag/vimtex) | ⭐ 5.4k stars

---

## 🐍 Python

### heavenshell/vim-pydocstring
**Docstring Generation** - Automatically creates docstrings.
- Google, NumPy, Sphinx formats
- **Shortcut**: `<leader>pd`

🔗 [GitHub](https://github.com/heavenshell/vim-pydocstring) | ⭐ 1.1k stars

### Vimjas/vim-python-pep8-indent
**PEP8 Indentation** - PEP8-compliant indentation.
- Handles complex cases
- Line continuation

🔗 [GitHub](https://github.com/Vimjas/vim-python-pep8-indent) | ⭐ 800 stars

### jeetsukumaran/vim-pythonsense
**Python Navigation** - Text objects for Python.
- Navigate by class/function
- Smart selection
- **Shortcuts**: `]]`, `[[`, `]m`, `[m`, `af`, `if`, `ac`, `ic`

🔗 [GitHub](https://github.com/jeetsukumaran/vim-pythonsense) | ⭐ 400 stars

---

## 💻 Terminal

### voldikss/vim-floaterm
**Floating Terminal** - Terminal in a floating window.
- Overlay on editor
- Lazygit and lazydocker integration
- **Shortcuts**: `,t`, `,tg`, `,td`

🔗 [GitHub](https://github.com/voldikss/vim-floaterm) | ⭐ 2.4k stars

### preservim/vimux
**Tmux Integration** - Sends commands to tmux.
- Test execution
- Interactive REPL
- **Shortcuts**: `,p`, `;p`

🔗 [GitHub](https://github.com/preservim/vimux) | ⭐ 2.2k stars

---

## 🔧 Utilities

### nvim-lua/popup.nvim
**Popup API** - Library to create popups.
- Used by other plugins

🔗 [GitHub](https://github.com/nvim-lua/popup.nvim) | ⭐ 350 stars

### nvim-lua/plenary.nvim
**Lua Library** - Utility functions for Lua plugins.
- Required by Telescope and others

🔗 [GitHub](https://github.com/nvim-lua/plenary.nvim) | ⭐ 2.6k stars

### jremmen/vim-ripgrep
**Ripgrep Integration** - Ultra-fast file search.
- Faster than grep
- **Shortcut**: `rg`

🔗 [GitHub](https://github.com/jremmen/vim-ripgrep) | ⭐ 700 stars

### dbeniamine/cheat.sh-vim
**Cheat Sheets** - Access cheat.sh from Vim.
- Quick documentation
- Code examples

🔗 [GitHub](https://github.com/dbeniamine/cheat.sh-vim) | ⭐ 200 stars

### majutsushi/tagbar
**Code Outline** - Shows file structure.
- Classes, functions, variables
- Quick navigation
- **Shortcut**: `<leader>c`

🔗 [GitHub](https://github.com/majutsushi/tagbar) | ⭐ 6.1k stars

---

## 🎮 Training

### ThePrimeagen/vim-be-good
**Training Game** - Mini-games to improve your Vim skills.
- Navigation exercises
- Movement practice
- `:VimBeGood`

🔗 [GitHub](https://github.com/ThePrimeagen/vim-be-good) | ⭐ 3k stars

---

## 📊 Summary by Category

| Category | Number of Plugins |
|----------|-------------------|
| 🎨 Theme and Interface | 3 |
| 🎯 Focus | 4 |
| 📁 Navigation | 7 |
| ✍️ Autocompletion | 9 |
| 🔀 Git | 11 |
| 🎨 Syntax | 4 |
| 🛠️ Development | 6 |
| 📂 Folding | 3 |
| 🏗️ Infrastructure | 2 |
| 📝 Markdown | 4 |
| 📐 LaTeX | 1 |
| 🐍 Python | 3 |
| 💻 Terminal | 2 |
| 🔧 Utilities | 5 |
| 🎮 Training | 1 |

**Total: ~65 plugins**

---

## 🚀 Installation

```bash
# Install all plugins
nvim +PlugInstall +qall

# Update plugins
nvim +PlugUpdate +qall

# Clean unused plugins
nvim +PlugClean +qall

# Update Treesitter
nvim +TSUpdate +qall
```

---

## 💡 Recommended External Tools

These external tools enhance the experience:

```bash
# macOS
brew install ripgrep fd bat glow lazygit lazydocker markdownlint-cli

# Python
pip install ruff pytest isort doq

# Node.js
npm install -g js-beautify @commitlint/cli @commitlint/config-conventional
```

---

## 🏆 Most Popular Plugins

1. **fzf** (64k ⭐) - The most popular fuzzy finder
2. **vim-fugitive** (19.8k ⭐) - The Git plugin reference
3. **vim-airline** (17.7k ⭐) - The most used status bar
4. **telescope.nvim** (15k ⭐) - Modern search tool
5. **ale** (13.5k ⭐) - The linting standard

---

**Version**: Neovim Lua Configuration 2024
**Package Manager**: vim-plug
**Total Stars**: ~200k+ ⭐
