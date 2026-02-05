# YAPF Configuration

This directory contains the configuration file for `YAPF` (Yet Another Python Formatter). This minimal setup dictates the formatting rules for Python code.

## Key Features / Customizations:

*   **Column Limit:** Python code will be formatted to a maximum line length of 120 characters.

## Important Settings:

*   `column_limit = 120`: Sets the maximum line length.

## Usage:

To format a Python file using this style, navigate to the project's root directory (or a directory containing this `.yapf` style file) and run:

```bash
yapf --style=.config/yapf/style <your_python_file.py>
```

Alternatively, `yapf` can be run with recursive formatting for an entire project:

```bash
yapf -i -r --style=.config/yapf/style .
```

Many editors and IDEs also integrate `yapf` and can be configured to use this style automatically.
```