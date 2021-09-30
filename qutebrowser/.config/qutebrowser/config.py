config.load_autoconfig(True)

c.new_instance_open_target = 'window'
c.downloads.position = 'bottom'
c.spellcheck.languages = ['en-US', 'es-ES']
c.tabs.show = 'never'
c.qt.force_software_rendering = 'chromium'

c.url.searchengines = {
  "DEFAULT": "https://www.ecosia.org/search?q={}",
  "wa": "https://wiki.archlinux.org/?search={}",
  "ww": "https://en.wikipedia.org/w/index.php?search={}",
  "yt": "https://www.youtube.com/results?search_query={}",
  "od": "https://odysee.com/$/search?q={}"
}
c.url.start_pages = ["https://github.com/jlopezcur"]
c.url.default_page = "https://github.com/jlopezcur"

c.aliases = {
  "q": "close",
  "qa": "quit",
  "w": "session-save",
  "private": "open -p",
}

config.source('mappings.py')
config.source('theme.py')

