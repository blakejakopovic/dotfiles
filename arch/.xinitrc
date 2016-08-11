xrdb -merge ~/.Xresources

# Retina Display
xrandr --dpi 184
xrandr --fbmm 286x179

# Keyboard key repeat delay and rate
xset r rate 200 20

# Natural scrolling
xmodmap -e "pointer = 1 2 3 5 4"

exec i3
