#!/bin/bash

PORTAL_URL=$1

BIN_TARGET=/usr/sbin/pitft-kiosk-start
PROFILE_PATH=/home/pi/.profile

cat << EOS > $BIN_TARGET
#!/bin/sh

xset -dpms
xset s off
matchbox-window-manager &
midori -e Fullscreen -a $PORTAL_URL
EOS

chmod +x /usr/sbin/pitft-kiosk-start

cat << 'EOS' >> $PROFILE_PATH

f [ $TERM = "linux" ]; then
	# pitft := "linux", ssh := "vt100"
EOS

cat << EOS >> $PROFILE_PATH
	xinit $BIN_TARGET
fi
EOS
