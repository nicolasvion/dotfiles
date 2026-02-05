# Ranger Configuration

This directory contains the configuration file for `Ranger`, a console file manager. This setup provides a minimalistic and focused file browsing experience.

## Key Features / Customizations:

*   **Hidden Files:** Hidden files are shown by default.
*   **VCS Awareness:** Ranger is aware of version control systems.
*   **Mouse Support:** Mouse interactions are enabled.
*   **Minimalist View:** Configured to display only a single column, which is a significant deviation from Ranger's default multi-column navigation, suggesting a streamlined workflow for specific use cases.
*   **Previews Disabled:** File, directory, and image previews are all disabled to maintain a very lean interface.

## Important Settings:

*   `set show_hidden true`: Ensures hidden files are visible.
*   `set mouse_enabled true`: Enables mouse interaction.
*   `set column_ratios 0`: Configures Ranger to show only one column.

## Usage:

To launch Ranger, simply run `ranger` in your terminal.
