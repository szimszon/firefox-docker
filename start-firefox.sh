#!/bin/bash
groupmod -g $gid firefox
usermod -u $uid -g $gid firefox

if [ -d /home/firefox/.mozilla ]; then
  chown -R firefox:firefox /home/firefox/.mozilla
fi
pactl load-module module-native-protocol-tcp auth-ip-acl="172.17.42.1"

exec su -ls "/bin/bash" -c "export PULSE_SERVER=172.17.42.1:4713;/usr/bin/firefox -profile /home/firefox/.mozilla/firefox" firefox
#exec su -ls "/bin/bash" -c "/usr/bin/firefox -profile /home/firefox/.mozilla/firefox" firefox
