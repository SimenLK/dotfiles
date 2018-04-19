#!/bin/bash

scrot ~/Documents/if_locked.png
convert ~/Documents/if_locked.png -scale 10% -scale 1000% ~/Documents/if_locked.png
[[ -f $1 ]] && convert ~/Documents/if_locked.png $1 -gravity center -composite -matte ~/Documents/if_locked.png
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -t -i ~/Documents/if_locked.png
rm ~/Documents/if_locked.png
