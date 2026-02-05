# vifm Configuration

This directory contains the configuration files for `vifm`, a curses-based file manager with a VI-like interface. This setup provides a powerful and efficient way to navigate and manage files directly from the terminal.

## Key Features / Customizations:

*   **Vim-like Experience:** Designed for users familiar with Vim, offering similar keybindings and a modal editing approach for file management.
*   **Default Colorscheme:** Uses the `Default` colorscheme, with customized colors for various UI elements like current line, directories, links, executables, and status lines.
*   **Custom Statusline:** A detailed statusline provides useful information about the current directory and selected files.
*   **Flexible File Viewing:** Mappings to switch between brief and detailed file information views.
*   **Hidden Files Toggle:** Easily show or hide hidden files with a single keybinding.
*   **Integrated Shell:** Quickly launch a shell in the current directory.
*   **Filetype Associations:** Configured to open various file types (PDFs, videos, images) with appropriate macOS applications (`Preview.app`, `VLC.app`) and provides commands for archiving/extracting common archive formats. HTML files are viewed with `w3m`.
*   **Quick Actions:** Keybindings for quick exit, configuration reload, new file creation, and sorting.

## Important Files:

*   `vifmrc`: The main configuration file for `vifm`, containing settings and keybindings.
*   `colors/Default.vifm`: Defines the color scheme for the `vifm` interface.

## Common Shortcuts:

*   `q`: Quick exit.
*   `<f5>`: Reload `vifm` configuration.
*   `,i`: Toggle visibility of hidden files.
*   `,n`: Create a new file.
*   `s`: Start a shell in the current directory.
*   `S`: Display sorting dialog.
*   `w`: Toggle visibility of the preview window.
*   `B`: Switch to brief file information view.
*   `D`: Switch to detailed file information view.

## Usage:

To launch `vifm`, simply run `vifm` in your terminal.
