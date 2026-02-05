# Taskell Configuration

This directory contains the configuration files for `Taskell`, a command-line Kanban board. This setup is tailored for efficient task management directly from the terminal.

## Key Features / Customizations:

*   **Custom Layout:** Configured with specific padding and column widths for optimal readability.
*   **Status Bar:** A visible status bar provides quick information.
*   **Markdown-driven:** Tasks and lists are managed using a markdown file (`.taskell.md`), with custom markdown indicators for titles, tasks, summaries, and due dates.
*   **Comprehensive Keybindings:** A rich set of keyboard shortcuts for quick navigation, task creation, editing, deletion, and movement.
*   **Custom Theming:** Defines specific colors for list titles, status bar, current tasks, and subtasks, enhancing visual clarity.

## Important Files:

*   `config.ini`: General application settings, layout, and markdown parsing rules.
*   `bindings.ini`: Defines all keyboard shortcuts for Taskell.
*   `theme.ini`: Specifies the color scheme for the UI elements.
*   `template.md`: A template for new Taskell boards.

## Common Shortcuts:

### General
*   `q`: Quit
*   `u`: Undo
*   `r`: Redo
*   `/`: Search
*   `?`: Help
*   `!`: Set Due Date

### Navigation
*   `<Up>`, `<Down>`, `<Left>`, `<Right>`: Move between tasks/lists
*   `b`: Go to bottom
*   `t`: Go to top

### Task Management
*   `a`: New task
*   `o`: New task below current
*   `O`: New task above current
*   `e`, `A`, `i`: Edit task
*   `D`: Delete task
*   `<Enter>`: View task details
*   `@`: Set due date
*   `<Space>`: Mark task as complete (moves to bottom of last list)
*   `m`: Move task to another list (via menu)

### List Management
*   `N`: New list
*   `E`: Edit list title
*   `X`: Delete list
*   `d`: Move list right
*   `s`: Move list left

## Usage:

To launch Taskell, navigate to a directory containing a `.taskell.md` file (or create one using `taskell -t`) and run `taskell` in your terminal.
