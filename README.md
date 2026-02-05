# My Awesome Dotfiles ✨

This repository serves as a centralized management system for my personal dotfiles and macOS configurations. It uses **GNU Stow** to manage symlinks, allowing for a clean and organized home directory while keeping all configurations version-controlled. It includes configuration files for various applications (like Neovim, Tmux, Neomutt, Zsh, etc.) and scripts to customize macOS default settings.

The goal is to provide a consistent and reproducible development environment across different machines. 💻🚀

## Table of Contents 📖

*   [btop Configuration 📈](#btop-configuration-)
*   [Neomutt Configuration 📧](#neomutt-configuration-)
*   [Neovim Configuration ✍️](#neovim-configuration-)
*   [Ranger Configuration 📁](#ranger-configuration-)
*   [Taskell Configuration 📝](#taskell-configuration-)
*   [vifm Configuration 📂](#vifm-configuration-)
*   [YAPF Configuration 🐍](#yapf-configuration-)
*   [SSH Configuration 🔒](#ssh-configuration-)
*   [Qutebrowser Configuration 🌐](#qutebrowser-configuration-)
*   [Percol Configuration 🔍](#percol-configuration-)
*   [Visual Studio Code Configuration 💻](#visual-studio-code-configuration-)
*   [macOS Defaults Scripts 🍏](#macos-defaults-scripts-)

---

## Installation & Setup with GNU Stow 🛠️

This repository is designed to be managed with [GNU Stow](https://www.gnu.org/software/stow/). Stow creates symbolic links from the package directories in this repository to your home directory (`~`), allowing you to keep your dotfiles organized and version-controlled.

### 1. Install Stow 📦

If you don't have Stow installed, you can typically install it using your system's package manager:

*   **macOS (Homebrew):** 🍎
    ```bash
    brew install stow
    ```
*   **Debian/Ubuntu:** 🐧
    ```bash
    sudo apt-get install stow
    ```
*   **Arch Linux:** 🚀
    ```bash
    sudo pacman -S stow
    ```

### 2. Clone the Repository ⬇️

Clone this repository into your home directory, or a preferred location (e.g., `~/dotfiles`). For this example, we'll assume `~/dotfiles`.

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Stow Packages 🔗

Navigate into the `~/dotfiles` directory and use `stow` to create symlinks for each application's configuration.

```bash
cd ~/dotfiles
```

To link all packages:

```bash
stow --adopt --ignore macos-defaults */
```

To link specific packages (e.g., `zsh` and `nvim`):

```bash
stow zsh nvim
```

To unlink a package:

```bash
stow -D zsh
```

**Note on Conflicts:** ⚠️ If you already have existing configuration files in your home directory (e.g., `~/.zshrc`), `stow` will detect conflicts and refuse to link. You should move or delete your existing files before stowing.

### 4. Special Cases 🌟

*   **`macos-defaults/`**: This directory contains shell scripts to set macOS defaults. These are *not* managed by `stow` as they are meant to be executed directly, not symlinked. You can run them manually as needed (e.g., `./macos-defaults/dock-autohide`).

---

<!-- START_CONFIG_READMES -->

# btop Configuration 📈

This directory contains the configuration files for `btop`, a resource monitor that shows usage and stats for processor, memory, disks, network, and processes.

## Key Features / Customizations: ✨

*   **Theme:** Uses the "nord" color theme. 🎨
*   **Vim Keys:** Vim-like keybindings (`h,j,k,l,g,G`) are enabled for navigation within lists. ⌨️
*   **Rounded Corners:** Box corners are rounded for a modern look. aesthetic
*   **Process Tree:** Processes are displayed in a tree structure, making it easier to visualize parent-child relationships. 🌳
*   **CPU Graphs:** Displays CPU usage with "total" stats and an inverted lower graph. 📊
*   **Temperatures:** Shows CPU and core temperatures if available. 🌡️
*   **Clock:** Displays a clock in the top right (`%X` format). ⏰
*   **Memory Graphs:** Memory usage is visualized with graphs rather than simple meters. 🧠
*   **Disk Information:** Includes detailed disk usage and I/O activity. 💾
*   **Network Graphs:** Auto-rescaling network graphs provide real-time network activity. 📡
*   **Battery Status:** Shows battery percentage and power consumption if a battery is present. 🔋

## Important Settings: ⚙️

*   `color_theme = "nord"`: Specifies the color scheme.
*   `vim_keys = true`: Enables Vim keybindings.
*   `proc_tree = true`: Enables process tree view.
*   `update_ms = 2000`: Update interval set to 2 seconds for better sample times.

## Usage: ▶️

To launch `btop`, simply run `btop` in your terminal.
Navigate using arrow keys, or Vim keys (`h,j,k,l,g,G`) if `vim_keys` is enabled.

# Neomutt Configuration 📧

This directory contains the configuration files for `Neomutt`, a command-line mail user agent, highly customized for an efficient email experience.

## Key Features / Customizations: ✨

*   **Modular Configuration:** The setup is modular, with separate files for accounts, bindings, colors, and composition settings, making it easy to manage. 🧩
*   **Vim Keybindings:** Custom keybindings (defined in `bindings.muttrc`) enhance navigation, especially for sidebar control. ⌨️
*   **Powerline/Nerdfont Theming:** Utilizes Powerline and Nerdfont characters for a visually rich status bar, index, and pager format, providing a modern look. 🌈
*   **External Program Integration:** Integrates with `nvim` as the default editor and uses custom scripts (`view_attachment.sh`, `mutt-html`, `view_mail.sh`) for handling various MIME types, allowing for comfortable viewing of images, PDFs, and HTML emails directly within the terminal or external viewers. 🔗
*   **Sidebar Navigation:** Features a visible sidebar for easy mailbox navigation, with custom formatting and color highlighting for new mail. ➡️
*   **Email Composition:** Configured for efficient email composition, including displaying "From" headers, editable headers, and proper character set handling. 📝
*   **Account Management:** Accounts are managed in separate, private files (not included in this repository for security reasons) and sourced via `accounts.muttrc`. 👤

## Important Files: 📄

*   `muttrc`: Main configuration file, sourcing all other components.
*   `accounts.muttrc`: Sources private account-specific configurations.
*   `bindings.muttrc`: Defines custom keybindings and macros.
*   `colors.muttrc`: Handles the visual styling and theming, including Powerline/Nerdfont integration.
*   `compose.muttrc`: Settings for composing emails.
*   `sidebar.muttrc`: Configures the appearance and behavior of the sidebar.
*   `mailcap`: Defines how Neomutt handles different MIME types and external viewers/scripts.
*   `scripts/`: Contains helper scripts for viewing attachments and HTML emails.

## Shortcuts: ⚡

*   `b`: Toggle sidebar visibility (index, pager).
*   `j`: Next item in sidebar (index, pager).
*   `k`: Previous item in sidebar (index, pager).
*   `h`: Open selected folder in sidebar (index, pager).
*   `,i`: Jump to inbox (macro in index view).

## Usage: ▶️

To launch Neomutt, simply run `neomutt` in your terminal.

# Neovim Configuration ✍️

This directory contains the highly customized Neovim configuration, designed for an efficient and powerful editing experience, especially for development. It leverages `lazy.nvim` for plugin management and organizes settings modularly.

## Key Features / Customizations: ✨

*   **Modular Setup:** Configuration is split into logical modules for options, plugin management, autocommands, and keymaps, making it easy to understand and maintain. 🧩
*   **Plugin Powerhouse:** Utilizes `lazy.nvim` to manage a wide array of plugins enhancing UI, editing, coding, Git integration, language support (Python, Go, Rust, Ruby), and developer tools. Includes plugins for AI, Obsidian integration, and more. 🚀
*   **Extensive Keybindings:** A comprehensive set of custom keybindings for: ⌨️
    *   **Navigation:** Efficient cursor movement, pane and tab management, buffer navigation. 🧭
    *   **File Operations:** Quick file search, Git integration (`Magit`-like experience), Ripgrep. 📁
    *   **Coding Assistance:** Language-specific mappings (e.g., Python for running, testing, debugging), formatting. 💡
    *   **Plugin Control:** Toggling Tagbar, Undotree, Limelight, Goyo. 🔌
    *   **Terminal Integration:** Floaterm for embedded terminals (including `lazygit` and `lazydocker`), Vimux for running commands. 🖥️
*   **Smart Autocommands:** Automated actions for filetype-specific settings (e.g., indentation for Go, Python, Shell scripts), trailing whitespace removal on save, jumping to last edit position, and auto-loading skeleton files for new buffers. 🧠
*   **Rich UI & Experience:** 🎨
    *   **Line Numbers:** Absolute and relative line numbers for navigation. #️⃣
    *   **Color Scheme:** Uses the `nord` colorscheme for a comfortable visual experience. ❄️
    *   **Indentation:** Consistent indentation settings across various languages (e.g., 2 spaces for most, 4 for Python, 8 for Go). 📏
    *   **Search:** Smart case-insensitive search with highlighting. 🔍
    *   **Clipboard:** Seamless integration with system clipboard. 📋
    *   **Undo History:** Persistent undo history across sessions. ↩️
*   **Language-Specific Enhancements:** Tailored options and keybindings for Python, Go, Rust, Ruby, and Rails development, including specific linters, formatters, and highlighting rules. 🐍🐹🦀💎

## Important Files: 📄

*   `init.lua`: The main entry point for the Neovim configuration.
*   `lua/config/options.lua`: General Neovim settings and UI customizations.
*   `lua/config/lazy.lua`: `lazy.nvim` plugin manager setup and plugin loading.
*   `lua/config/autocmds.lua`: Defines automatic commands for various events and file types.
*   `lua/config/keymaps.lua`: Contains all custom keybindings.
*   `lua/plugins/*.lua`: Individual files defining groups of plugins (UI, editor, coding, etc.).
*   `skeletons/`: Directory for file templates that are automatically loaded for new files.
*   `undodir/`: Stores persistent undo history.

## Common Shortcuts: ⚡

Many shortcuts use the `<leader>` key (set to `,`).

*   **General:**
    *   `<leader>l`: Clear search highlighting. 🧹
*   **Configuration:**
    *   `<leader>r`: Reload Neovim configuration. 🔄
    *   `;r`: Edit `init.lua`. ✏️
*   **Pane Management:** 🪟
    *   `pv`: Create vertical split.
    *   `ph`: Create horizontal split.
    *   `,z`: Toggle maximize current pane.
*   **Tab Management:** 📑
    *   `te`: New tab.
    *   `tn`: Next tab.
    *   `tp`: Previous tab.
*   **File & Buffer Navigation:** 🧭
    *   `,f`: Fuzzy find files (general).
    *   `rg`: Ripgrep search.
    *   `,b`: Show buffers.
*   **Plugin Specific:** 🔌
    *   `<leader>c`: Toggle Tagbar.
    *   `<leader>u`: Show Undotree.
    *   `go`: Toggle Goyo mode.
*   **Git:** 🐙
    *   `gi`: Open Magit interface.
    *   `gs`: Git status.
    *   `gc`: Git commit.
*   **Terminal:** 🖥️
    *   `,t`: New Floaterm terminal.
    *   `,tg`: New Floaterm with `lazygit`.
    *   `,td`: New Floaterm with `lazydocker`.
*   **Python:** 🐍
    *   `<F5>` (buffer local): Run current Python file.
    *   `<F6>` (buffer local): Run `pytest` for current file.
    *   `<leader>pb`: Insert `pdb.set_trace()` breakpoint.

## Usage: ▶️

To launch Neovim, simply run `nvim` in your terminal.

# Ranger Configuration 📁

This directory contains the configuration file for `Ranger`, a console file manager. This setup provides a minimalistic and focused file browsing experience.

## Key Features / Customizations: ✨

*   **Hidden Files:** Hidden files are shown by default. 👻
*   **VCS Awareness:** Ranger is aware of version control systems. 🐙
*   **Mouse Support:** Mouse interactions are enabled. 🖱️
*   **Minimalist View:** Configured to display only a single column, which is a significant deviation from Ranger's default multi-column navigation, suggesting a streamlined workflow for specific use cases. 🖼️
*   **Previews Disabled:** File, directory, and image previews are all disabled to maintain a very lean interface. 🚫

## Important Settings: ⚙️

*   `set show_hidden true`: Ensures hidden files are visible.
*   `set mouse_enabled true`: Enables mouse interaction.
*   `set column_ratios 0`: Configures Ranger to show only one column.

## Usage: ▶️

To launch Ranger, simply run `ranger` in your terminal.

# Taskell Configuration 📝

This directory contains the configuration files for `Taskell`, a command-line Kanban board. This setup is tailored for efficient task management directly from the terminal.

## Key Features / Customizations: ✨

*   **Custom Layout:** Configured with specific padding and column widths for optimal readability. 📏
*   **Status Bar:** A visible status bar provides quick information. 📊
*   **Markdown-driven:** Tasks and lists are managed using a markdown file (`.taskell.md`), with custom markdown indicators for titles, tasks, summaries, and due dates. ✍️
*   **Comprehensive Keybindings:** A rich set of keyboard shortcuts for quick navigation, task creation, editing, deletion, and movement. ⌨️
*   **Custom Theming:** Defines specific colors for list titles, status bar, current tasks, and subtasks, enhancing visual clarity. 🌈

## Important Files: 📄

*   `config.ini`: General application settings, layout, and markdown parsing rules.
*   `bindings.ini`: Defines all keyboard shortcuts for Taskell.
*   `theme.ini`: Specifies the color scheme for the UI elements.
*   `template.md`: A template for new Taskell boards.

## Common Shortcuts: ⚡

### General
*   `q`: Quit 🚪
*   `u`: Undo ↩️
*   `r`: Redo ↪️
*   `/`: Search 🔍
*   `?`: Help ❓
*   `!`: Set Due Date 📅

### Navigation 🧭
*   `<Up>`, `<Down>`, `<Left>`, `<Right>`: Move between tasks/lists
*   `b`: Go to bottom ⬇️
*   `t`: Go to top ⬆️

### Task Management ✅
*   `a`: New task ➕
*   `o`: New task below current ⬇️
*   `O`: New task above current ⬆️
*   `e`, `A`, `i`: Edit task ✏️
*   `D`: Delete task 🗑️
*   `<Enter>`: View task details ℹ️
*   `@`: Set due date 📅
*   `<Space>`: Mark task as complete (moves to bottom of last list) ☑️
*   `m`: Move task to another list (via menu) ➡️

### List Management 📋
*   `N`: New list ➕
*   `E`: Edit list title ✏️
*   `X`: Delete list 🗑️
*   `d`: Move list right ➡️
*   `s`: Move list left ⬅️

## Usage: ▶️

To launch Taskell, navigate to a directory containing a `.taskell.md` file (or create one using `taskell -t`) and run `taskell` in your terminal.

# vifm Configuration 📂

This directory contains the configuration files for `vifm`, a curses-based file manager with a VI-like interface. This setup provides a powerful and efficient way to navigate and manage files directly from the terminal.

## Key Features / Customizations: ✨

*   **Vim-like Experience:** Designed for users familiar with Vim, offering similar keybindings and a modal editing approach for file management. ⌨️
*   **Default Colorscheme:** Uses the `Default` colorscheme, with customized colors for various UI elements like current line, directories, links, executables, and status lines. 🌈
*   **Custom Statusline:** A detailed statusline provides useful information about the current directory and selected files. 📊
*   **Flexible File Viewing:** Mappings to switch between brief and detailed file information views. 🖼️
*   **Hidden Files Toggle:** Easily show or hide hidden files with a single keybinding. 👻
*   **Integrated Shell:** Quickly launch a shell in the current directory. 🐚
*   **Filetype Associations:** Configured to open various file types (PDFs, videos, images) with appropriate macOS applications (`Preview.app`, `VLC.app`) and provides commands for archiving/extracting common archive formats. HTML files are viewed with `w3m`. 🔗
*   **Quick Actions:** Keybindings for quick exit, configuration reload, new file creation, and sorting. ⚡

## Important Files: 📄

*   `vifmrc`: The main configuration file for `vifm`, containing settings and keybindings.
*   `colors/Default.vifm`: Defines the color scheme for the `vifm` interface.

## Common Shortcuts: ⚡

*   `q`: Quick exit. 🚪
*   `<f5>`: Reload `vifm` configuration. 🔄
*   `,i`: Toggle visibility of hidden files. 👻
*   `,n`: Create a new file. ➕
*   `s`: Start a shell in the current directory. 🐚
*   `S`: Display sorting dialog. ⬆️⬇️
*   `w`: Toggle visibility of the preview window. 🖼️
*   `B`: Switch to brief file information view.
*   `D`: Switch to detailed file information view.

## Usage: ▶️

To launch `vifm`, simply run `vifm` in your terminal.

# YAPF Configuration 🐍

This directory contains the configuration file for `YAPF` (Yet Another Python Formatter). This minimal setup dictates the formatting rules for Python code.

## Key Features / Customizations: ✨

*   **Column Limit:** Python code will be formatted to a maximum line length of 120 characters. 📏

## Important Settings: ⚙️

*   `column_limit = 120`: Sets the maximum line length.

## Usage: ▶️

To format a Python file using this style, navigate to the project's root directory (or a directory containing this `.yapf` style file) and run:

```bash
yapf --style=.config/yapf/style <your_python_file.py>
```

Alternatively, `yapf` can be run with recursive formatting for an entire project:

```bash
yapf -i -r --style=.config/yapf/style .
```

Many editors and IDEs also integrate `yapf` and can be configured to use this style automatically.

# SSH Configuration 🔒

This directory contains the main SSH configuration file (`config`), which acts as an entry point for more modular SSH setups.

## Key Features / Customizations: ✨

*   **Modular Includes:** The main `config` file utilizes `Include` directives to load host-specific configurations from a `config.d` subdirectory. This allows for better organization and separation of different SSH client configurations (e.g., for home, professional, or bastion hosts). 🧩
*   **Centralized Management (Entry Point):** While specific host configurations are external (likely for security or environmental reasons), this `config` file serves as the central point for defining which configuration sets are loaded. 📍

## Important Files: 📄

*   `config`: The main SSH configuration file, which includes other configuration files.
*   `config.d/`: (Referenced) This directory is expected to contain individual host configuration files, such as `home`, `pro`, and `bastion_config`, which are sourced by the main `config` file. These files are not directly managed within this dotfiles repository, allowing for sensitive configurations to be kept separate.

## Usage: ▶️

SSH connections will automatically use the configurations defined in the included files. To manage specific host settings, you would typically edit the files within `~/.ssh/config.d/`.

# Qutebrowser Configuration 🌐

This directory contains the configuration files for `Qutebrowser`, a keyboard-driven, command-line oriented web browser. This setup provides a customized browsing experience with a focus on efficiency and aesthetics.

## Key Features / Customizations: ✨

*   **Keyboard-centric:** Designed for keyboard navigation, making browsing fast and efficient without relying on a mouse. ⌨️
*   **Nord Theme:** The browser's interface is extensively themed using the Nord color palette, providing a consistent and aesthetically pleasing dark mode experience across all UI elements (completion, downloads, hints, messages, statusbar, tabs). ❄️
*   **Session Management:** Automatically saves and restores browsing sessions, ensuring continuity. 🔄
*   **Optimized Completions:** Configured for automatic and efficient command and URL completions. 💡
*   **Streamlined Downloads:** Downloads are automatically saved to the `~/Downloads` directory without prompting, simplifying the download process. ⬇️
*   **Custom Start Pages & Search:** Configured with specific start pages and a default Google search engine. 🔍
*   **Tab Behavior:** Customized tab padding and behavior for closing tabs. 📑

<h2>Important Files: 📄</h2>

*   `config.py`: The main configuration file for Qutebrowser, containing general settings, session management, download behavior, URL defaults, and sourcing the theme.
*   `nord-qutebrowser.py`: Defines the Nord color palette and applies it to various Qutebrowser UI components for a consistent dark theme.

## Usage: ▶️

To launch Qutebrowser, simply run `qutebrowser` in your terminal or as a desktop application.

# Percol Configuration 🔍

This directory contains the configuration file for `Percol`, a general-purpose interactive filter. This setup customizes the visual appearance of `percol` to enhance usability.

## Key Features / Customizations: ✨

*   **Custom Prompt:** Defines a clear prompt for interactive filtering. 💬
*   **Rich Right Prompt:** Displays useful information such as selected status, file details, and match counts. 📊
*   **Color-Coded Feedback:** Provides visual cues through color-coding for: 🌈
    *   Marked lines (red background). 🔴
    *   Query text (yellow). 🟡
    *   Selected lines (blue). 🔵

## Important Files: 📄

*   `rc.py`: The Python configuration file for `percol` that customizes its UI elements.

## Usage: ▶️

`percol` is typically used to filter input from other commands. For example:

```bash
ls -F | percol
```

This will pipe the output of `ls -F` into `percol`, allowing you to interactively filter and select files.

# Visual Studio Code Configuration 💻

This directory contains the configuration files and recommended extensions for Visual Studio Code, meticulously set up for a productive and aesthetically pleasing development environment.

## Key Features / Customizations: ✨

*   **Nord Aesthetic:** Utilizes the "Nord" color theme and "Symbols" icon theme for a consistent and visually comfortable dark mode experience. ❄️
*   **Python Development Hub:** Optimized for Python development with extensions for static analysis (Pylance), debugging (Debugpy), formatting (Ruff as default formatter), snippets, and Jupyter notebooks. 🐍
*   **Go Development Ready:** Includes extensions and settings for efficient Go language development. 🐹
*   **Code Quality & Formatting:** Enforces code style with "Ruff" as the default formatter, automatic formatting on save/paste, and trimming trailing whitespace. ✅
*   **Intelligent Editing:** Enhanced IntelliSense, auto-import completions, and diagnostic modes contribute to a smarter coding experience. 🧠
*   **Version Control Integration:** Deep integration with Git via extensions like GitLens and Git Graph, providing rich insights and streamlined workflows. Smart commit and commit signing are enabled. 🐙
*   **Consistent Indentation:** Enforces 4-space indentation using spaces. 📏
*   **Custom UI Layout:** Activity bar positioned at the bottom and sidebar on the right for a personalized workspace layout. 🖼️
*   **Terminal Integration:** Integrated terminal uses a custom font family for visual consistency with the editor. 🖥️
*   **Remote Development:** Configured with Remote SSH extensions for seamless development on remote machines. ☁️
*   **Productivity Enhancements:** Includes extensions for better comments, bookmarks, project management, Todo tracking, Markdown preview, and more. 🚀
*   **DevOps/IAC Support:** Extensions for Ansible, YAML, and Puppet development. ⚙️

## Important Files: 📄

*   `settings.json`: Contains all editor-specific settings, including appearance, formatting rules, language configurations, and integration with various tools.
*   `extensions.json`: Lists the recommended/installed VS Code extensions that complement this configuration.

## Common Shortcuts: ⚡

VS Code relies heavily on its command palette (`Cmd/Ctrl+Shift+P`) and default keybindings. Custom keybindings would typically be defined in `keybindings.json` (not present in this repo), but the functionality is driven by the configured settings and extensions.

## Usage: ▶️

Open this `.dotfiles` directory in VS Code to automatically apply workspace settings and recommend the associated extensions.

# macOS Defaults Scripts 🍏

This directory contains a collection of scripts to customize macOS settings using the `defaults` command. Each script is designed to alter specific system or application preferences, allowing for a highly personalized macOS environment.

## Key Features / Customizations: ✨

*   **Granular Control:** Each script targets a specific macOS default setting, providing fine-grained control over various aspects of the operating system and installed applications. 🎯
*   **Automation:** These scripts allow for automated setup of preferred macOS behaviors, which is ideal for new machine setups or maintaining a consistent environment. 🤖
*   **Categorized Settings:** The scripts are organized by the application or system area they affect (e.g., Activity Monitor, Dock, Finder, Safari), making it easy to find and apply specific customizations. 🗂️
*   **Common Customizations:** Includes popular tweaks such as enabling hidden files in Finder, adjusting Dock behavior, enhancing keyboard responsiveness, and optimizing various application settings. ⚙️

## Categories of Customizations: 📋

### Activity Monitor 📊
*   Configures Activity Monitor to open its main window upon launch and sort processes by CPU usage.

### App Store 🛍️
*   Enables WebKit Web Inspector and debug menu in the App Store.

### Bluetooth 📡
*   Increases audio quality for Bluetooth devices.

### Chrome 🌐
*   Disables print preview and swipe navigation, expands print dialog by default.

### Disk Utility 💽
*   Enables the debug menu for advanced options.

### Dock ⚓
*   Comprehensive customizations including auto-hiding, disabling animations, enabling magnification, hiding recent apps, showing only active apps, removing autohide delay, and setting icon sizes.

### Finder 🔍
*   Prevents `.DS_Store` file creation on network/USB volumes, disables extension change warnings, disables window animations, enables "Quit Finder", sets List View as default, saves to disk by default, shows all hidden files, shows file extensions, and makes the path bar visible.

### Global 🌍
*   Enables text selection in Quick Look, expands print and save panels by default.

### Keyboard ⌨️
*   Disables press-and-hold for special characters, enables faster key repeat, and full keyboard navigation.

### Login Window 🚪
*   Shows the host name on the login window.

### Mail 📧
*   Copies email addresses instead of names from the Mail app.

### Menu Bar 🖥️
*   Enables auto-hiding for the menu bar.

### Messages 💬
*   Disables smart quotes.

### Mission Control 🚀
*   Disables "Displays have separate Spaces" and groups windows by application.

### Photos 📸
*   Prevents the Photos app from opening automatically.

### Safari 🦁
*   Disables autocorrect and preloading Top Hits, enables Develop menu and Web Inspector, sets homepage to blank, and shows full URL.

### Screen Capture 🖥️
*   Disables shadow effect for screenshots and saves them to the Desktop.

### Screen Saver 🖼️
*   Requires a password immediately after the screen saver begins.

### Software Update 🔄
*   Sets Software Update to check daily.

### Terminal 💻
*   Configures Terminal to use UTF-8 encoding only.

### TextEdit ✍️
*   Sets new documents to plain text and uses UTF-8 by default.

### Time Machine ⏰
*   Disables local snapshots and prevents offering new disks for backup.

### Trackpad 👆
*   Enables tap-to-click.

## Important Files: 📄

*   Individual `.sh` scripts: Each file in this directory is a shell script containing `defaults` commands for a specific macOS setting.
*   `README.md`: This file, summarizing the purpose of each script.
*   `apply-changes`: A script to restart Finder or apply other changes that might require a system restart for preferences to take effect.

## Usage: ▶️

To apply a specific setting, execute the corresponding script from your terminal:

```bash
./macos-defaults/dock-autohide
```

To apply all changes that might require a Finder restart, run:

```bash
./macos-defaults/apply-changes
```
<!-- END_CONFIG_READMES -->

