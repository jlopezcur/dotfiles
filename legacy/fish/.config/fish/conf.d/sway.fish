# If running from tty1 start sway
set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  export QT_QPA_PLATFORM=wayland
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  # export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export MOZ_ENABLE_WAYLAND=1
  export MOZ_WEBRENDER=1
  # export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  export FONTCONFIG_PATH=/etc/fonts
  # export PIPEWIRE_DEBUG=4
  exec sway > $HOME/.cache/sway.log 2>&1
end
