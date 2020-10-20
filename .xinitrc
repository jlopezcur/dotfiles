# Set the right display configuration
xrandr \
  --output eDP1 --primary --mode 3840x2160 --pos 0x0 --rotate normal \
  --output HDMI1 --mode 1920x1080 --pos 3840x0 --scale 2x2 --rotate normal

# Put the sound in the correct state
amixer -c 0 -q set Master 100% unmute

# Merge the Xresources
xrdb -merge ~/.Xresources

# Set keyborard layout to es
setxkbmap -layout es

# Change the cursor pointer
xsetroot -cursor_name left_ptr

# Fix wacom only apply in the laptop monitor
xsetwacom set 11 MapToOutput eDP1
xsetwacom set 12 MapToOutput eDP1
xsetwacom set 23 MapToOutput eDP1

# start xmonad
exec dbus-launch xmonad
