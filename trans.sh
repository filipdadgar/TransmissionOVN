#/bin/bash
/usr/bin/docker run \
--cap-add=NET_ADMIN --device=/dev/net/tun -d --name openvpn \
              -v /media/download:/data \
              -v /etc/localtime:/etc/localtime:ro \
              -e "TRANSMISSION_DOWNLOAD_DIR=/data/complete" \
              -e "TRANSMISSION_ALT_SPEED_UP=1" \
              -e "TRANSMISSION_WATCH_DIR_ENABLED=true" \
              -e "TRANSMISSION_SPEED_LIMIT_UP_ENABLED=true" \
              -e "TRANSMISSION_SPEED_LIMIT_UP=0" \
              -e "TRANSMISSION_RATIO_LIMIT_ENABLED=true" \
              -e "TRANSMISSION_RATIO_LIMIT=0" \
              -e "TRANSMISSION_UMASK=0" \
              -e "TRANSMISSION_WATCH_DIR=/data/complete" \
              -e "OPENVPN_PROVIDER=PROVIDER" \
              -e "OPENVPN_CONFIG=PROVDER" \
              -e "OPENVPN_USERNAME=NAME@PROVIDER" \
              -e "OPENVPN_PASSWORD=PASSWORD" \
              -e "OPENVPN_OPTS=--inactive 3600 --ping 10 --ping-exit 60" \
              -e "PGID=1000" \
              -e "PUID=1000" \
              -p 192.168.1.16:9091:9091 \
              -e "LOCAL_NETWORK=192.168.1.0/24" \
              haugene/transmission-openvpn

