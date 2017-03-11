# Start the X server when login

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# Launch a terminal after starting the server X

exec termite

