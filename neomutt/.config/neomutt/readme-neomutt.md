# Neomutt Configuration

This directory contains the configuration files for `Neomutt`, a command-line mail user agent, highly customized for an efficient email experience.

## Key Features / Customizations:

*   **Modular Configuration:** The setup is modular, with separate files for accounts, bindings, colors, and composition settings, making it easy to manage.
*   **Vim Keybindings:** Custom keybindings (defined in `bindings.muttrc`) enhance navigation, especially for sidebar control.
*   **Powerline/Nerdfont Theming:** Utilizes Powerline and Nerdfont characters for a visually rich status bar, index, and pager format, providing a modern look.
*   **External Program Integration:** Integrates with `nvim` as the default editor and uses custom scripts (`view_attachment.sh`, `mutt-html`, `view_mail.sh`) for handling various MIME types, allowing for comfortable viewing of images, PDFs, and HTML emails directly within the terminal or external viewers.
*   **Sidebar Navigation:** Features a visible sidebar for easy mailbox navigation, with custom formatting and color highlighting for new mail.
*   **Email Composition:** Configured for efficient email composition, including displaying "From" headers, editable headers, and proper character set handling.
*   **Account Management:** Accounts are managed in separate, private files (not included in this repository for security reasons) and sourced via `accounts.muttrc`.

## Important Files:

*   `muttrc`: Main configuration file, sourcing all other components.
*   `accounts.muttrc`: Sources private account-specific configurations.
*   `bindings.muttrc`: Defines custom keybindings and macros.
*   `colors.muttrc`: Handles the visual styling and theming, including Powerline/Nerdfont integration.
*   `compose.muttrc`: Settings for composing emails.
*   `sidebar.muttrc`: Configures the appearance and behavior of the sidebar.
*   `mailcap`: Defines how Neomutt handles different MIME types and external viewers/scripts.
*   `scripts/`: Contains helper scripts for viewing attachments and HTML emails.

## Shortcuts:

*   `b`: Toggle sidebar visibility (index, pager).
*   `j`: Next item in sidebar (index, pager).
*   `k`: Previous item in sidebar (index, pager).
*   `h`: Open selected folder in sidebar (index, pager).
*   `,i`: Jump to inbox (macro in index view).

## Usage:

To launch Neomutt, simply run `neomutt` in your terminal.
