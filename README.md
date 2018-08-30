# docker-snx-shadowsocks

# Info

`docker run --network host -e SNX_CERTPASS=mypass -e SNX_CERTPATH=/VPN/mycert.p12 -e SNX_SERVER=myserver --cap-add=NET_ADMIN -v /lib/modules:/lib/modules:ro -it --rm -v /foo/bar/VPN:/VPN:ro -e CUSTOM_SS_PORT=8888 -e CUSTOM_SS_SERVER=0.0.0.0 lukasmrtvy/docker-snx-shadowsocks:latest`

# Client
`ss-local -s 127.0.0.1 -p 8888 -l 1080 -k initialpass -m  chacha20-ietf-poly1305`

# Browser
`chromium-browser --proxy-server="socks5://127.0.0.1:1080"`
