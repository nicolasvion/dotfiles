# Visual Studio Code Configuration

This directory contains the configuration files and recommended extensions for Visual Studio Code, meticulously set up for a productive and aesthetically pleasing development environment.

## Key Features / Customizations:

*   **Nord Aesthetic:** Utilizes the "Nord" color theme and "Symbols" icon theme for a consistent and visually comfortable dark mode experience.
*   **Python Development Hub:** Optimized for Python development with extensions for static analysis (Pylance), debugging (Debugpy), formatting (Ruff as default formatter), snippets, and Jupyter notebooks.
*   **Go Development Ready:** Includes extensions and settings for efficient Go language development.
*   **Code Quality & Formatting:** Enforces code style with "Ruff" as the default formatter, automatic formatting on save/paste, and trimming trailing whitespace.
*   **Intelligent Editing:** Enhanced IntelliSense, auto-import completions, and diagnostic modes contribute to a smarter coding experience.
*   **Version Control Integration:** Deep integration with Git via extensions like GitLens and Git Graph, providing rich insights and streamlined workflows. Smart commit and commit signing are enabled.
*   **Consistent Indentation:** Enforces 4-space indentation using spaces.
*   **Custom UI Layout:** Activity bar positioned at the bottom and sidebar on the right for a personalized workspace layout.
*   **Terminal Integration:** Integrated terminal uses a custom font family for visual consistency with the editor.
*   **Remote Development:** Configured with Remote SSH extensions for seamless development on remote machines.
*   **Productivity Enhancements:** Includes extensions for better comments, bookmarks, project management, Todo tracking, Markdown preview, and more.
*   **DevOps/IAC Support:** Extensions for Ansible, YAML, and Puppet development.

## Important Files:

*   `settings.json`: Contains all editor-specific settings, including appearance, formatting rules, language configurations, and integration with various tools.
*   `extensions.json`: Lists the recommended/installed VS Code extensions that complement this configuration.

## Common Shortcuts:

VS Code relies heavily on its command palette (`Cmd/Ctrl+Shift+P`) and default keybindings. Custom keybindings would typically be defined in `keybindings.json` (not present in this repo), but the functionality is driven by the configured settings and extensions.

## Usage:

Open this `.dotfiles` directory in VS Code to automatically apply workspace settings and recommend the associated extensions.
