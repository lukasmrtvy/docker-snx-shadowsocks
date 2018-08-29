# docker-snx-shadowsocks

# Info

`docker run --network host -e SNX_CERTPASS=mypass -e SNX_CERTPATH=/VPN/mycert.p12 -e SNX_SERVER=myserver --cap-add=NET_ADMIN -v /lib/modules:/lib/modules:ro -it --rm -v /foo/bar/VPN:/VPN:ro snx-shadowsocks:latest`
