# ~/.dotfiles/linux/.xinitrc

xrdb -merge ~/.Xresources

# Retina Display
xrandr --dpi 184
xrandr --fbmm 286x179

# Keyboard key repeat delay and rate (medium)
#xset r rate 300 20

# Mouse speed (fast)
#xset m 20/10 1

# Natural scrolling
xmodmap -e "pointer = 1 2 3 5 4"

exec i3