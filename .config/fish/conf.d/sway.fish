# If running from tty1 start sway
set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  export QT_QPA_PLATFORM=wayland
  export MOZ_ENABLE_WAYLAND=1
  export MOZ_WEBRENDER=1
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  # export PIPEWIRE_DEBUG=4
  exec sway
end
