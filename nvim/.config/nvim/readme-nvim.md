# Neovim Configuration

This directory contains the highly customized Neovim configuration, designed for an efficient and powerful editing experience, especially for development. It leverages `lazy.nvim` for plugin management and organizes settings modularly.

## Key Features / Customizations:

*   **Modular Setup:** Configuration is split into logical modules for options, plugin management, autocommands, and keymaps, making it easy to understand and maintain.
*   **Plugin Powerhouse:** Utilizes `lazy.nvim` to manage a wide array of plugins enhancing UI, editing, coding, Git integration, language support (Python, Go, Rust, Ruby), and developer tools. Includes plugins for AI, Obsidian integration, and more.
*   **Extensive Keybindings:** A comprehensive set of custom keybindings for:
    *   **Navigation:** Efficient cursor movement, pane and tab management, buffer navigation.
    *   **File Operations:** Quick file search, Git integration (`Magit`-like experience), Ripgrep.
    *   **Coding Assistance:** Language-specific mappings (e.g., Python for running, testing, debugging), formatting.
    *   **Plugin Control:** Toggling Tagbar, Undotree, Limelight, Goyo.
    *   **Terminal Integration:** Floaterm for embedded terminals (including `lazygit` and `lazydocker`), Vimux for running commands.
*   **Smart Autocommands:** Automated actions for filetype-specific settings (e.g., indentation for Go, Python, Shell scripts), trailing whitespace removal on save, jumping to last edit position, and auto-loading skeleton files for new buffers.
*   **Rich UI & Experience:**
    *   **Line Numbers:** Absolute and relative line numbers for navigation.
    *   **Color Scheme:** Uses the `nord` colorscheme for a comfortable visual experience.
    *   **Indentation:** Consistent indentation settings across various languages (e.g., 2 spaces for most, 4 for Python, 8 for Go).
    *   **Search:** Smart case-insensitive search with highlighting.
    *   **Clipboard:** Seamless integration with system clipboard.
    *   **Undo History:** Persistent undo history across sessions.
*   **Language-Specific Enhancements:** Tailored options and keybindings for Python, Go, Rust, Ruby, and Rails development, including specific linters, formatters, and highlighting rules.

## Important Files:

*   `init.lua`: The main entry point for the Neovim configuration.
*   `lua/config/options.lua`: General Neovim settings and UI customizations.
*   `lua/config/lazy.lua`: `lazy.nvim` plugin manager setup and plugin loading.
*   `lua/config/autocmds.lua`: Defines automatic commands for various events and file types.
*   `lua/config/keymaps.lua`: Contains all custom keybindings.
*   `lua/plugins/*.lua`: Individual files defining groups of plugins (UI, editor, coding, etc.).
*   `skeletons/`: Directory for file templates that are automatically loaded for new files.
*   `undodir/`: Stores persistent undo history.

## Common Shortcuts:

Many shortcuts use the `<leader>` key (set to `,`).

*   **General:**
    *   `<leader>l`: Clear search highlighting.
*   **Configuration:**
    *   `<leader>r`: Reload Neovim configuration.
    *   `;r`: Edit `init.lua`.
*   **Pane Management:**
    *   `pv`: Create vertical split.
    *   `ph`: Create horizontal split.
    *   `,z`: Toggle maximize current pane.
*   **Tab Management:**
    *   `te`: New tab.
    *   `tn`: Next tab.
    *   `tp`: Previous tab.
*   **File & Buffer Navigation:**
    *   `,f`: Fuzzy find files (general).
    *   `rg`: Ripgrep search.
    *   `,b`: Show buffers.
*   **Plugin Specific:**
    *   `<leader>c`: Toggle Tagbar.
    *   `<leader>u`: Show Undotree.
    *   `go`: Toggle Goyo mode.
*   **Git:**
    *   `gi`: Open Magit interface.
    *   `gs`: Git status.
    *   `gc`: Git commit.
*   **Terminal:**
    *   `,t`: New Floaterm terminal.
    *   `,tg`: New Floaterm with `lazygit`.
    *   `,td`: New Floaterm with `lazydocker`.
*   **Python:**
    *   `<F5>` (buffer local): Run current Python file.
    *   `<F6>` (buffer local): Run `pytest` for current file.
    *   `<leader>pb`: Insert `pdb.set_trace()` breakpoint.

## Usage:

To launch Neovim, simply run `nvim` in your terminal.
