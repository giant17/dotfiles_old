# c.content.user_stylesheets = [str(config.configdir) + '/themes/solarized-dark-all-sites.css']
c.downloads.location.directory = '/home/gian/downloads'
c.downloads.location.prompt = False
config.bind('yy' , 'yank selection')
c.content.autoplay = False
c.completion.height = "40%"
c.completion.scrollbar.width = 12
c.downloads.position = "bottom"
c.statusbar.widgets = ["keypress", "progress", "url", "scroll"]
c.hints.selectors["code"] = [
    # Selects all code tags whose direct parent is not a pre tag
    ":not(pre) > code",
    "pre"
]
config.bind('yc' ,  'hint code userscript code_select.py')
# config.bind(',n' , 'config-cycle content.user_stylesheets themes/solarized-light-all-sites.css themes/solarized-dark-all-sites.css ""')
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        "g": "https://www.google.it/search?q={}",
         "r": "https://reddit.com/r/{}",
        'stp': 'https://www.startpage.com/do/dsearch?query={}',
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
        }
c.colors.webpage.bg = 'black'
c.completion.cmd_history_max_items = 100

#c.url.home_page = '
# c.url.start_pages = 'file:///home/gian/.config/qutebrowser/blank.html'
# c.url.default_page = 'file:///home/gian/.config/qutebrowser/blank.html'

c.url.start_pages = 'https://startpage.com'
c.url.default_page = 'https://startpage.com'
config.source('qutewal.py')
