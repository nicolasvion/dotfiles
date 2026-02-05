# macOS Defaults Scripts

This directory contains a collection of scripts to customize macOS settings using the `defaults` command. Each script is designed to alter specific system or application preferences, allowing for a highly personalized macOS environment.

## Key Features / Customizations:

*   **Granular Control:** Each script targets a specific macOS default setting, providing fine-grained control over various aspects of the operating system and installed applications.
*   **Automation:** These scripts allow for automated setup of preferred macOS behaviors, which is ideal for new machine setups or maintaining a consistent environment.
*   **Categorized Settings:** The scripts are organized by the application or system area they affect (e.g., Activity Monitor, Dock, Finder, Safari), making it easy to find and apply specific customizations.
*   **Common Customizations:** Includes popular tweaks such as enabling hidden files in Finder, adjusting Dock behavior, enhancing keyboard responsiveness, and optimizing various application settings.

## Categories of Customizations:

### Activity Monitor
*   Configures Activity Monitor to open its main window upon launch and sort processes by CPU usage.

### App Store
*   Enables WebKit Web Inspector and debug menu in the App Store.

### Bluetooth
*   Increases audio quality for Bluetooth devices.

### Chrome
*   Disables print preview and swipe navigation, expands print dialog by default.

### Disk Utility
*   Enables the debug menu for advanced options.

### Dock
*   Comprehensive customizations including auto-hiding, disabling animations, enabling magnification, hiding recent apps, showing only active apps, removing autohide delay, and setting icon sizes.

### Finder
*   Prevents `.DS_Store` file creation on network/USB volumes, disables extension change warnings, disables window animations, enables "Quit Finder", sets List View as default, saves to disk by default, shows all hidden files, shows file extensions, and makes the path bar visible.

### Global
*   Enables text selection in Quick Look, expands print and save panels by default.

### Keyboard
*   Disables press-and-hold for special characters, enables faster key repeat, and full keyboard navigation.

### Login Window
*   Shows the host name on the login window.

### Mail
*   Copies email addresses instead of names from the Mail app.

### Menu Bar
*   Enables auto-hiding for the menu bar.

### Messages
*   Disables smart quotes.

### Mission Control
*   Disables "Displays have separate Spaces" and groups windows by application.

### Photos
*   Prevents the Photos app from opening automatically.

### Safari
*   Disables autocorrect and preloading Top Hits, enables Develop menu and Web Inspector, sets homepage to blank, and shows full URL.

### Screen Capture
*   Disables shadow effect for screenshots and saves them to the Desktop.

### Screen Saver
*   Requires a password immediately after the screen saver begins.

### Software Update
*   Sets Software Update to check daily.

### Terminal
*   Configures Terminal to use UTF-8 encoding only.

### TextEdit
*   Sets new documents to plain text and uses UTF-8 by default.

### Time Machine
*   Disables local snapshots and prevents offering new disks for backup.

### Trackpad
*   Enables tap-to-click.

## Important Files:

*   Individual `.sh` scripts: Each file in this directory is a shell script containing `defaults` commands for a specific macOS setting.
*   `README.md`: This file, summarizing the purpose of each script.
*   `apply-changes`: A script to restart Finder or apply other changes that might require a system restart for preferences to take effect.

## Usage:

To apply a specific setting, execute the corresponding script from your terminal:

```bash
./macos-defaults/dock-autohide
```

To apply all changes that might require a Finder restart, run:

```bash
./macos-defaults/apply-changes
```
