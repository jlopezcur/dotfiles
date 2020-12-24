# Set the right display configuration
xrandr \
  --dpi 324 \
  --output eDP1 --mode 3840x2160 --rate 60 --pos 0x0 --primary \
  --output HDMI1 --mode 1920x1080 --rate 60 --pos 3840x0 --scale 2x2 \
  --output VIRTUAL1 --off

# Put the sound in the correct state
amixer -c 0 -q set Master 100% unmute

# Merge the Xresources
xrdb -merge ~/.Xresources

# Change the cursor pointer
xsetroot -cursor_name left_ptr

# Fix wacom only apply in the laptop monitor
xsetwacom set 13 MapToOutput eDP1
xsetwacom set 14 MapToOutput eDP1
xsetwacom set 26 MapToOutput eDP1

# start xmonad
dbus-launch xmonad
