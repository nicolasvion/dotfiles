# SSH Configuration

This directory contains the main SSH configuration file (`config`), which acts as an entry point for more modular SSH setups.

## Key Features / Customizations:

*   **Modular Includes:** The main `config` file utilizes `Include` directives to load host-specific configurations from a `config.d` subdirectory. This allows for better organization and separation of different SSH client configurations (e.g., for home, professional, or bastion hosts).
*   **Centralized Management (Entry Point):** While specific host configurations are external (likely for security or environmental reasons), this `config` file serves as the central point for defining which configuration sets are loaded.

## Important Files:

*   `config`: The main SSH configuration file, which includes other configuration files.
*   `config.d/`: (Referenced) This directory is expected to contain individual host configuration files, such as `home`, `pro`, and `bastion_config`, which are sourced by the main `config` file. These files are not directly managed within this dotfiles repository, allowing for sensitive configurations to be kept separate.

## Usage:

SSH connections will automatically use the configurations defined in the included files. To manage specific host settings, you would typically edit the files within `~/.ssh/config.d/`.
```