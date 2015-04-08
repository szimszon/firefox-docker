Firefox
=======

Unofficial build of last Firefox in Ubuntu 14.10 running within a docker container and rendered by the local X Server.
Original work by Chris Daish <chrisdaish@gmail.com> (https://github.com/chrisdaish/docker-firefox - v1.4)

Changelog
---------

```
v2.0
* Firefox upgrade from 37 to 37.0.1

v1.0
* Initial release
```

Launch
------
```
Run the firefox-docker.sh
```

FAQ
---
Note: If you receive the following Gtk error:
```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session
```
xhost +local:docker
```
