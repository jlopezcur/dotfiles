config.load_autoconfig(True)

c.new_instance_open_target = 'window'
c.downloads.position = 'bottom'
c.spellcheck.languages = ['en-US', 'es-ES']
c.tabs.show = 'never'
# c.qt.force_software_rendering = 'chromium'
c.content.autoplay = False
# c.qt.force_software_rendering = True
# c.backend = 'webkit'

c.url.searchengines = {
  "DEFAULT": "https://www.ecosia.org/search?q={}",
  "wa": "https://wiki.archlinux.org/?search={}",
  "ww": "https://en.wikipedia.org/w/index.php?search={}",
  "yt": "https://www.youtube.com/results?search_query={}",
  "od": "https://odysee.com/$/search?q={}",
  "dles": "https://www.deepl.com/translator#en/es/{}",
  "dlen": "https://www.deepl.com/translator#es/en/{}"
}

c.aliases = {
  "q": "close",
  "qa": "quit",
  "w": "session-save",
  "private": "open -p",
}

config.source('mappings.py')
config.source('theme.py')
config.source('private.py')

c.content.webgl = True
c.content.canvas_reading = False
c.content.javascript.enabled = True
c.content.pdfjs = False

c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/easylist-downloads.adblockplus.org/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/pgl.yoyo.org/as/serverlist",
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts",
    "https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt",
    "https://fanboy.co.nz/fanboy-problematic-sites.txt",
    "https://easylist.to/easylist/easylist.txt",
    "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt"
]
c.content.blocking.enabled = True
