# btop Configuration

This directory contains the configuration files for `btop`, a resource monitor that shows usage and stats for processor, memory, disks, network, and processes.

## Key Features / Customizations:

*   **Theme:** Uses the "nord" color theme.
*   **Vim Keys:** Vim-like keybindings (`h,j,k,l,g,G`) are enabled for navigation within lists.
*   **Rounded Corners:** Box corners are rounded for a modern look.
*   **Process Tree:** Processes are displayed in a tree structure, making it easier to visualize parent-child relationships.
*   **CPU Graphs:** Displays CPU usage with "total" stats and an inverted lower graph.
*   **Temperatures:** Shows CPU and core temperatures if available.
*   **Clock:** Displays a clock in the top right (`%X` format).
*   **Memory Graphs:** Memory usage is visualized with graphs rather than simple meters.
*   **Disk Information:** Includes detailed disk usage and I/O activity.
*   **Network Graphs:** Auto-rescaling network graphs provide real-time network activity.
*   **Battery Status:** Shows battery percentage and power consumption if a battery is present.

## Important Settings:

*   `color_theme = "nord"`: Specifies the color scheme.
*   `vim_keys = true`: Enables Vim keybindings.
*   `proc_tree = true`: Enables process tree view.
*   `update_ms = 2000`: Update interval set to 2 seconds for better sample times.

## Usage:

To launch `btop`, simply run `btop` in your terminal.
Navigate using arrow keys, or Vim keys (`h,j,k,l,g,G`) if `vim_keys` is enabled.
