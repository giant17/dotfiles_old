#****************************************
# ____                                  *
#| __ ) _ __ _____      _____  ___ _ __ *
#|  _ \| '__/ _ \ \ /\ / / __|/ _ \ '__|*
#| |_) | | | (_) \ V  V /\__ \  __/ |   *
#|____/|_|  \___/ \_/\_/ |___/\___|_|   *
#                                       *
#****************************************


#***********/
#* GENERAL */
#***********/

c.content.autoplay = False
# Code clip
c.hints.selectors["code"] = [
    # Selects all code tags whose direct parent is not a pre tag
    ":not(pre) > code",
    "pre"
]
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.completion.cmd_history_max_items = 0

## BINDINGS
# TODO: open editor usescript
# TODO: copy/paste selected text instert text (?)
# TODO: bindings to default
# config.bind('Alt-y' , 'yank selection')
# TODO: scroll history bobkmarks with vim ctrl

yt = 'hint links spawn --userscript yt.sh -v'
config.bind('yc' ,  'hint code userscript code_select.py')
config.bind(',p', 'hint links spawn tsp mpv {hint-url}')
config.bind(',m', 'spawn tsp mpv {url}')
# config.bind(',yt','hint links spawn tsp youtube-dl -o "~/downloads/%(upload_date)s-%(title)s.%(ext)s" --restrict-filenames {hint-url};;spawn tsp notify-send "ciao"')
config.bind(',yt',yt)
config.bind(',ya', 'hint links spawn tsp youtube-dl -x -f bestaudio/best -o "~/dl/%(upload_date)s-%(title)s.%(ext)s" --restrict-filenames {hint-url}')
config.bind(',ymm', 'spawn tsp youtube-dl -o "~/dl/%(upload_date)s-%(title)s.%(ext)s" --restrict-filenames {url}')
config.bind(',yma', 'hint links spawn tsp youtube-dl -x -f bestaudio/best -o "~/ld/%(upload_date)s-%(title)s.%(ext)s" --restrict-filenames {url}')
config.bind(',o', 'spawn --userscript dmenu-open')
# :bind ,O spawn --userscript dmenu-open --tab


## Download directory
c.downloads.location.directory = '/home/gian/dl'
c.downloads.location.prompt = False

 ## SEARCH ENGINES

c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'sp': "https://www.startpage.com/do/dsearch?query={}",
        "g": "https://www.google.it/search?q={}",
         "r": "https://reddit.com/r/{}",
        'pip': 'https://pypi.org/search/?q={}',
        'ddg': 'https://duckduckgo.com/?q={}',
        'scd': 'http://93.174.95.27/scimag/?q={}',
        'tw': 'https://twitter.com/search?q={}',
        'cor': 'https://ilcorsaronero.me/argh.php?search={0}',
        'ru': 'https://rutracker.org/forum/search_cse.php?q={0}',
        'gh': 'https://github.com/search?q={}',
        'sc': 'https://scholar.google.com/scholar?hl=it&as_sdt=0%2C5&q={0}&btnG=',
        'lib': 'http://93.174.95.27/search.php?req={0}',
        'i': 'https://duckduckgo.com/?q={}&iar=images&iax=images&ia=images',
        'red': 'https://reddit.com/r/{}',
        'tpb': 'http://thepiratebay.org/search/{}',
        'ud': 'https://www.urbandictionary.com/define.php?term={}&utm_source=search-action',
        'aw': 'https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}',
        'yt':'https://www.youtube.com/results?search_query={0}',
        'db':'https://packages.debian.org/search?searchon=names&keywords={0}'}

 ## ASPECT

c.downloads.position = "bottom"
c.completion.scrollbar.width = 16
c.completion.height = "40%"
c.statusbar.widgets = ["keypress", "progress", "url", "scroll"]
c.content.user_stylesheets = ['themes/solarized-dark.css']
c.url.default_page = 'about:blank'
c.url.start_pages = 'about:blank'
config.bind(',n' , '"" config-cycle content.user_stylesheets themes/solarized-dark.css')
# TODO: change back to original theme

## FONTS

c.fonts.monospace = '"FantasqueSansMono Nerd Font Mono", monospace'

mono = '12pt monospace'
small_mono = '13pt monospace'
c.fonts.completion.entry = mono
c.fonts.completion.category = 'bold ' + mono
c.fonts.debug_console = mono
c.fonts.downloads = mono
c.fonts.hints = 'bold 11pt monospace'
c.fonts.keyhint = small_mono
c.fonts.messages.error = small_mono
c.fonts.messages.info = small_mono
c.fonts.messages.warning = small_mono
c.fonts.statusbar = mono
c.fonts.tabs = mono

## THEME
base00 = "#002b36"
base01 = "#073642"
base02 = "#586e75"
base03 = "#657b83"
base04 = "#839496"
base05 = "#93a1a1"
base06 = "#eee8d5"
base07 = "#fdf6e3"
base08 = "#dc322f"
base09 = "#cb4b16"
base0A = "#b58900"
base0B = "#859900"
base0C = "#2aa198"
base0D = "#268bd2"
base0E = "#6c71c4"
base0F = "#d33682"

# c.colors.webpage.bg = base00
c.colors.webpage.bg = 'black'
# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base05

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base02

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base00

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = base0A

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base00

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base00

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base00

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base01

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base0A

# Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = base0A

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = base0A

# Foreground color of the matched text in the selected completion item.
# c.colors.completion.item.selected.match.fg = base08

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = base0B

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base05

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base00

# Background color for the download bar.
c.colors.downloads.bar.bg = base00

# Color gradient start for download text.
c.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base0D

# Color gradient end for download text.
c.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = base08

# Font color for hints.
c.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base0A

# Font color for the matched part of hints.
c.colors.hints.match.fg = base05

# Text color for the keyhint widget.
c.colors.keyhint.fg = base05

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base05

# Background color of the keyhint widget.
c.colors.keyhint.bg = base00

# Foreground color of an error message.
c.colors.messages.error.fg = base00

# Background color of an error message.
c.colors.messages.error.bg = base08

# Border color of an error message.
c.colors.messages.error.border = base08

# Foreground color of a warning message.
c.colors.messages.warning.fg = base00

# Background color of a warning message.
c.colors.messages.warning.bg = base0A

# Border color of a warning message.
c.colors.messages.warning.border = base0A

# Foreground color of an info message.
c.colors.messages.info.fg = base05

# Background color of an info message.
c.colors.messages.info.bg = base00

# Border color of an info message.
c.colors.messages.info.border = base00

# Foreground color for prompts.
c.colors.prompts.fg = base05

# Border used around UI elements in prompts.
c.colors.prompts.border = base00

# Background color for prompts.
c.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base0A

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = base0B

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base00

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = base00

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = base0D

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = base00

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base0C

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = base00

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base03

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base05

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base00

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = base05

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base00

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = base00

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base0A

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = base00

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base0D

# Background color of the progress bar.
c.colors.statusbar.progress.bg = base0D

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base05

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = base08

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base0C

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base0B

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = base0A

# Background color of the tab bar.
c.colors.tabs.bar.bg = base00

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = base00

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = base08

c.colors.tabs.odd.fg = base05
c.colors.tabs.odd.bg = base00
c.colors.tabs.even.fg = base05
c.colors.tabs.even.bg = base00

c.colors.tabs.selected.odd.fg = base0A
c.colors.tabs.selected.odd.bg = base00
c.colors.tabs.selected.even.fg = base0A
c.colors.tabs.selected.even.bg = base00
