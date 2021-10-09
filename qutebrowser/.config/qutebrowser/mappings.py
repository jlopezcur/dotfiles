# Bind for open a link into mpv
config.bind(',om', 'hint links spawn mpv {hint-url}')

# Bind for download a youtube video with youtube-dl
config.bind(',dv', 'hint links spawn alacritty --class downloader -e yt-dlp -o ~/Downloads/%(title)s.%(ext)s {hint-url}')

# Bind for download a youtube audio with youtube-dl
config.bind(',ds', 'hint links spawn alacritty --class downloader -e yt-dlp -i --extract-audio --audio-format mp3 --audio-quality 0 -o ~/music/%(title)s.%(ext)s {hint-url}')

config.bind(',xb', 'config-cycle statusbar.show always never')
config.bind(',xt', 'config-cycle tabs.show always never')
config.bind(',xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')

config.bind(',gh', 'open https://github.com/jlopezcur')
