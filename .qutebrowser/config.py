# qutebrowser configuration

# always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# the height of the completion, in px or as percentage of the window.
c.completion.height = "20%"

# when to show the autocompletion window.
# valid values:
#   - always: whenever a completion is available.
#   - auto: whenever a completion is requested.
#   - never: never.
c.completion.show = "auto"

# whether quitting the application requires a confirmation.
c.confirm_quit = ["downloads"]

# The proxy to use. In addition to the listed values
c.content.proxy = "none"

# validate ssl handshakes.
c.content.ssl_strict = True

# The directory to save downloads to.
c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = False

# c.editor.command = ["termite", "-e", "vim '{}'"]

c.tabs.last_close = "close"
c.tabs.padding = {
    "left": 5,
    "right": 5,
    "top": 0,
    "bottom": 1,
}

c.url.default_page = "https://www.google.fr"
c.url.searchengines = {"DEFAULT": "https://www.google.fi/search?q={}"}
c.url.start_pages = "https://github.com/nicolasvion/dotfiles"

# theme
config.source('nord-qutebrowser.py')
