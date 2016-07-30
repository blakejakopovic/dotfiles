xrdb -merge ~/.Xresources

xrandr --dpi 184
xrandr --fbmm 286x179

# Natural scrolling
xmodmap -e "pointer = 1 2 3 5 4"

exec i3
