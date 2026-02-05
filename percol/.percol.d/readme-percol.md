# Percol Configuration

This directory contains the configuration file for `Percol`, a general-purpose interactive filter. This setup customizes the visual appearance of `percol` to enhance usability.

## Key Features / Customizations:

*   **Custom Prompt:** Defines a clear prompt for interactive filtering.
*   **Rich Right Prompt:** Displays useful information such as selected status, file details, and match counts.
*   **Color-Coded Feedback:** Provides visual cues through color-coding for:
    *   Marked lines (red background).
    *   Query text (yellow).
    *   Selected lines (blue).

## Important Files:

*   `rc.py`: The Python configuration file for `percol` that customizes its UI elements.

## Usage:

`percol` is typically used to filter input from other commands. For example:

```bash
ls -F | percol
```

This will pipe the output of `ls -F` into `percol`, allowing you to interactively filter and select files.
```