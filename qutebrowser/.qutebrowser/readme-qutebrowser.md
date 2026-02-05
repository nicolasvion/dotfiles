# Qutebrowser Configuration

This directory contains the configuration files for `Qutebrowser`, a keyboard-driven, command-line oriented web browser. This setup provides a customized browsing experience with a focus on efficiency and aesthetics.

## Key Features / Customizations:

*   **Keyboard-centric:** Designed for keyboard navigation, making browsing fast and efficient without relying on a mouse.
*   **Nord Theme:** The browser's interface is extensively themed using the Nord color palette, providing a consistent and aesthetically pleasing dark mode experience across all UI elements (completion, downloads, hints, messages, statusbar, tabs).
*   **Session Management:** Automatically saves and restores browsing sessions, ensuring continuity.
*   **Optimized Completions:** Configured for automatic and efficient command and URL completions.
*   **Streamlined Downloads:** Downloads are automatically saved to the `~/Downloads` directory without prompting, simplifying the download process.
*   **Custom Start Pages & Search:** Configured with specific start pages and a default Google search engine.
*   **Tab Behavior:** Customized tab padding and behavior for closing tabs.

## Important Files:

*   `config.py`: The main configuration file for Qutebrowser, containing general settings, session management, download behavior, URL defaults, and sourcing the theme.
*   `nord-qutebrowser.py`: Defines the Nord color palette and applies it to various Qutebrowser UI components for a consistent dark theme.

## Usage:

To launch Qutebrowser, simply run `qutebrowser` in your terminal or as a desktop application.
```