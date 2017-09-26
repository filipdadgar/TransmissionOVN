#/bin/bash
/usr/bin/docker run \
--cap-add=NET_ADMIN --device=/dev/net/tun -d --name openvpn \
              -v /media/download:/data \
              -v /media/download:/data/watch \
              -v /media/download/complete:/data/completed \
              -v /etc/localtime:/etc/localtime:ro \
              -v /media/download/transconfig:/config \
              -e "OPENVPN_PROVIDER=TYPME" \
              -e "OPENVPN_CONFIG=Netherlands" \
              -e "OPENVPN_USERNAME=TYPEME" \
              -e "OPENVPN_PASSWORD=TYPEME" \
              -e PGID=1000 -e PUID=1000 \
              -p 192.168.1.16:9091:9091 \
              -e LOCAL_NETWORK=192.168.1.0/24 \
              haugene/transmission-openvpn
