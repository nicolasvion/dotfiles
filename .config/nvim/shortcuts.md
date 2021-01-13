# 🎯 Neovim - Keyboard Shortcuts Guide

> Leader key: `,` (comma)

---

## 📁 Navigation and Files

| Shortcut | Action |
|----------|--------|
| `ff` | Search in work files (WorkFiles) |
| `fa` | Search in Ansible files |
| `fg` | Search in GitLab files |
| `,f` | Quick file search (FZF) |
| `,b` | List open buffers |
| `,m` | List marks |
| `,h` | Recent files history |
| `bn` | Previous buffer |
| `bp` | Next buffer |

### Telescope (if installed)

| Shortcut | Action |
|----------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Search in content (live grep) |
| `<leader>fb` | List buffers |
| `<leader>fh` | Neovim help (help tags) |
| `<leader>fo` | Recent files |
| `<leader>fc` | List commands |
| `<leader>fk` | List keyboard shortcuts |
| `<leader>fs` | Search word under cursor |

---

## 🌳 File Explorer

| Shortcut | Action |
|----------|--------|
| `<leader>e` | Open/close NvimTree |
| In NvimTree: `a` | Create a file |
| In NvimTree: `d` | Delete a file |
| In NvimTree: `r` | Rename a file |
| In NvimTree: `x` | Cut |
| In NvimTree: `c` | Copy |
| In NvimTree: `p` | Paste |

---

## 🔍 Search

| Shortcut | Action |
|----------|--------|
| `rg` | Search with Ripgrep (followed by text) |
| `gG` | Git Grep search |
| `/` | Search in current file |
| `n` | Next result |
| `N` | Previous result |
| `<leader>l` | Clear search highlighting |

---

## ✏️ Editing and Code

### Autocompletion

| Shortcut | Action |
|----------|--------|
| `<Tab>` | Next suggestion |
| `<S-Tab>` | Previous suggestion |
| `<CR>` (Enter) | Accept suggestion |
| `<C-Space>` | Force show suggestions |
| `<C-e>` | Cancel completion |
| `<C-b>` | Scroll documentation up |
| `<C-f>` | Scroll documentation down |

**Completion sources**:
- 📝 Buffer words (already typed)
- 📁 File paths
- ✂️ Snippets (code templates)
- ⌨️ Vim commands (in `:` mode)

### Basic Editing

| Shortcut | Action |
|----------|--------|
| `U` | Redo |
| `u` | Undo |
| `<leader>u` | Open undo tree (Undotree) |
| `gcc` | Comment/uncomment line |
| `gc` + motion | Comment selection |
| `<leader>e` | Visual block mode |

### Code Navigation

| Shortcut | Action |
|----------|--------|
| `<S-w>` | Previous word (back word) |
| `<S-x>` | Jump up (previous block) |
| `x` | Jump down (next block) |
| `]m` | Next function (Treesitter) |
| `[m` | Previous function (Treesitter) |
| `]]` | Next class (Treesitter) |
| `[[` | Previous class (Treesitter) |

### Text Manipulation

| Shortcut | Action |
|----------|--------|
| `,cs` | Delete content between brackets `[]` |
| `,cb` | Delete content between braces `{}` |
| `ci"` | Change content between quotes |
| `ci'` | Change content between apostrophes |
| `ci(` | Change content between parentheses |

---

## 🐛 Linting and Formatting (ALE)

| Shortcut | Action |
|----------|--------|
| `;an` | Next error |
| `;ap` | Previous error |
| `<leader>f` | Format file |
| Auto-save | Automatic formatting with Ruff (Python) |

### Specific Formatting

| Shortcut | Action |
|----------|--------|
| `fj` | Format JSON with jq |
| `fn` | Format JavaScript with js-beautify |

---

## 🪟 Pane Management

| Shortcut | Action |
|----------|--------|
| `pv` | Vertical split |
| `ph` | Horizontal split |
| `pr` | Rotate panes |
| `ps` | Go to bottom pane |
| `pz` | Go to top pane |
| `pd` | Go to right pane |
| `pq` | Go to left pane |
| `,z` | Maximize/restore current pane |

---

## 📑 Tab Management

| Shortcut | Action |
|----------|--------|
| `te` | New tab |
| `tn` | Next tab |
| `tp` | Previous tab |
| `tc` | Close tab |
| `tf` | First tab |
| `tl` | Last tab |
| `tm` | Move tab (followed by number) |

---

## 🔀 Git

### Neogit (Modern Git Interface)

| Shortcut | Action |
|----------|--------|
| `<leader>gg` | Open Neogit (complete interface) |
| `<leader>gC` | Commit with Neogit |
| `<leader>gP` | Push with Neogit |
| `<leader>gL` | Log with Neogit |

**In Neogit**:
- `s` : Stage a file/hunk
- `u` : Unstage
- `c` : Commit
- `p` : Push
- `f` : Fetch
- `l` : Log
- `?` : Complete help

### Basic Git Commands

| Shortcut | Action |
|----------|--------|
| `gi` | Open Magit (Git interface) |
| `gl` | View Git log (GV) |
| `gs` | Git status (Gina status) |
| `gf` | Git pull (Gina pull) |
| `gd` | Git diff (Gina diff) |
| `ga` | Add all files (git add .) |
| `gc` | Git commit |
| `gp` | Git push |
| `gb` | List branches |
| `gG` | Git Grep |

### Git Hunks (Gitsigns)

| Shortcut | Action |
|----------|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | View line blame |

### Git Conflict Resolution

| Shortcut | Action |
|----------|--------|
| `]x` | Next conflict |
| `[x` | Previous conflict |
| `<leader>co` | Keep OUR version (ours) |
| `<leader>ct` | Keep THEIR version (theirs) |
| `<leader>cb` | Keep BOTH versions |
| `<leader>c0` | Delete both versions |

---

## 💻 Terminal

| Shortcut | Action |
|----------|--------|
| `,t` | Open floating terminal |
| `,tg` | Open Lazygit |
| `,td` | Open Lazydocker |
| `,p` | Open Vimux runner |
| `;p` | Rerun last Vimux command |

---

## 📝 Markdown

| Shortcut | Action |
|----------|--------|
| `,md` | Preview Markdown (with glow) |

---

## 🎨 Interface and Display

| Shortcut | Action |
|----------|--------|
| `<leader>c` | Toggle Tagbar (code outline) |
| `<leader>l` | Toggle Limelight (focus mode) |
| `go` | Toggle Goyo (zen mode) |
| `;m` | Toggle mouse mode |
| `<C-p>` | Toggle paste mode |

---

## ⚙️ Configuration

| Shortcut | Action |
|----------|--------|
| `<leader>r` | Reload configuration |
| `;r` | Edit configuration file |
| `,?` | Show this shortcuts guide |
| `:e ~/.config/nvim/plugins.md` | View plugins list |
| `:e ~/.config/nvim/LINTING.md` | View linting guide |

---

## 🔧 Utilities

| Shortcut | Action |
|----------|--------|
| `K` | Show documentation (hover) |
| `gd` | Go to definition |
| `gr` | View references |
| `:PlugInstall` | Install plugins |
| `:PlugUpdate` | Update plugins |
| `:PlugClean` | Clean plugins |
| `:TSUpdate` | Update Treesitter parsers |

---

## 🎯 Selection and Text Objects (Treesitter)

| Shortcut | Action |
|----------|--------|
| `af` | Select a function (outer) |
| `if` | Select a function (inner) |
| `ac` | Select a class (outer) |
| `ic` | Select a class (inner) |
| `ab` | Select a block (outer) |
| `ib` | Select a block (inner) |

---

## 🐍 Python Specific

### Execution and Tests

| Shortcut | Action |
|----------|--------|
| `<F5>` | Run current Python file |
| `<F6>` | Run pytest on current file |
| `<leader>pr` | Run Python file |
| `<leader>pi` | Run in interactive mode |
| `<leader>pt` | Run pytest on file |
| `<leader>pa` | Run all pytest tests |
| `<leader>pc` | Check Python syntax |

### Debugging

| Shortcut | Action |
|----------|--------|
| `<leader>pb` | Insert breakpoint (next line) |
| `<leader>pB` | Insert breakpoint (previous line) |

### Documentation and Formatting

| Shortcut | Action |
|----------|--------|
| `<leader>pd` | Generate docstring (Google style) |
| `<leader>ps` | Sort imports with isort |
| Auto-save | Automatic formatting with Ruff |
| Auto-save | Linting with Ruff |

### Python Navigation (pythonsense)

| Shortcut | Action |
|----------|--------|
| `]]` | Next class |
| `[[` | Previous class |
| `]m` | Next method |
| `[m` | Previous method |
| `af` | Select a function |
| `if` | Select function content |
| `ac` | Select a class |
| `ic` | Select class content |

### Information

| Shortcut | Action |
|----------|--------|
| `<leader>pv` | Show Python version and path |
| Tagbar | Opens automatically for .py files |

### Automatic Features

- ✅ **PEP8 Indentation**: Smart PEP8-compliant indentation
- ✅ **Advanced Highlighting**: F-strings, operators, class vars coloring
- ✅ **Folding**: Code folding by indentation (level 99 by default)
- ✅ **Textwidth**: 120 characters limit
- ✅ **Auto-format**: Ruff formats on every save

---

## 📚 Help and Documentation

| Shortcut | Action |
|----------|--------|
| `:help <topic>` | Neovim help |
| `<leader>fh` | Search in help (Telescope) |
| `K` | Documentation for symbol under cursor |

---

## 💡 Tips

- **Leader key**: The leader key is `,` (comma)
- **Visual mode**: `v` to select, then apply a command
- **Block mode**: `<leader>e` then `I` to insert on multiple lines
- **Incremental search**: Type `/` then your search
- **Autocompletion**: Starts automatically after 3 characters
- **Snippets**: Type `def` then `<Tab>` for a complete Python function
- **Ghost text**: Grayed preview of completion (press `<Tab>` to accept)
- **Save**: `:w` or `:w!` to force
- **Quit**: `:q` or `:q!` to force
- **Quick help**: `,?` for this guide, `:e ~/.config/nvim/plugins.md` for plugins

---

## 🚀 Recommended Workflows

### Git Workflow (Neogit)
1. `<leader>gg` - Open Neogit
2. `s` - Stage modified files
3. `c` - Commit (write message)
4. `p` - Push

### Git Workflow (Classic)
1. `gs` - View status
2. `ga` - Add files
3. `gc` - Commit
4. `gp` - Push

### Conflict Resolution Workflow
1. Open conflicted file
2. `]x` - Go to first conflict
3. `<leader>co` or `<leader>ct` - Choose a version
4. `]x` - Next conflict
5. Repeat until complete resolution

### Search Workflow
1. `,f` - Search for a file
2. `<leader>fg` - Search in content
3. `rg <term>` - Advanced search with Ripgrep

### Code Workflow
1. Edit code
2. Auto-save formats with Ruff (Python)
3. `;an` / `;ap` - Navigate through errors
4. `<leader>u` - View history if needed

### Python Workflow
1. `<F5>` - Quickly test the script
2. `<leader>pd` - Add docstrings
3. `<leader>pb` - Add breakpoint if needed
4. `<F6>` - Run tests
5. `<leader>ps` - Sort imports before commit

---

**Version**: Neovim Lua Configuration 2024
**Author**: Custom Configuration
