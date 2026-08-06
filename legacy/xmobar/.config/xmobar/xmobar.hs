-- http://projects.haskell.org/xmobar/
-- install xmobar with these flags: --flags="with_alsa" --flags="with_mpd" --flags="with_xft"  OR --flags="all_extensions"
-- you can find weather location codes here: http://weather.noaa.gov/index.html

Config {
  font = "xft:SauceCodePro Nerd Font Mono:size=9:antialias=true:hinting=true",
  additionalFonts = [ "xft:monospace:size=9" ],
  fgColor = "#666666",
  position = Top,
  overrideRedirect = False,
  lowerOnStart = False,
  hideOnStart = False,
  persistent = True,
  alpha = 0,
  commands = [
    Run UnsafeStdinReader,
    Run MultiCpu [
      "-t", "<total>%",
      "-H", "50", "-h", "red"
    ] 10,
    Run MultiCoreTemp [
      "-t", "<avg>°C",
      "-H", "80", "-h", "red",
      "--", "--mintemp", "20", "--maxtemp", "100"
    ] 50,
    Run Memory [
      "-t", "<usedratio>%"
    ] 10,
    Run DiskU [("/", "<used>")] [] 3600,
    Run Alsa "default" "Master" ["-t" , "<volume>%"],
    Run Date "%a, %d %b %Y, %H:%M" "date" 60,
    Run Battery [
      "--template" , "<acstatus>",
      "--Low"      , "10",        -- units: %
      "--High"     , "80",        -- units: %
      "--low"      , "darkred",
      "--normal"   , "darkorange",
      "--high"     , "#666666",
      "--", -- battery specific options
      -- discharging status
      "-o", " <left>% (<timeleft>)",
      -- AC "on" status
      "-O", " <left>% (<timeleft>)",
      -- charged status
      "-i", " 100%"
    ] 50,
    Run Network "tun0" ["-t", " <dev>", "-x", ""] 60
  ],
  sepChar = "%",
  alignSep = "}{",
  template = " %UnsafeStdinReader% }{\
    \  <fc=grey>%multicpu% %multicoretemp%</fc>\
    \ .  <fc=grey>%memory%</fc>\
    \ .  <fc=grey>%disku%</fc>\
    \ . 蓼 <fc=grey>%alsa:default:Master%</fc>\
    \ . <fc=grey>%date%</fc>\
    \ . <fc=grey>%battery%</fc>\
    \ <fc=grey>%tun0%</fc> "
}
