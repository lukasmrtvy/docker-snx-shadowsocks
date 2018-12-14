# docker-snx-shadowsocks

# Info

```
docker run -d 
  --name snx-shadowsocks 
  --restart always 
  -p 8888:8888/tcp \
  -p 8888:8888/udp \
  -e SNX_CERTPASS=mypass 
  -e SNX_CERTPATH=/VPN/mycert.p12 
  -e SNX_SERVER=myserver 
  --cap-add=NET_ADMIN 
  -v /lib/modules:/lib/modules:ro 
  -v /foo/bar/VPN:/VPN:ro 
  -e OPTIONS="iptables -t nat -A OUTPUT -p tcp -d Y.Y.Y.Y --dport 443 -j DNAT --to-destination X.X.X.X" \
  -e CUSTOM_SS_PORT=8888 
  -e CUSTOM_SS_SERVER=0.0.0.0 
  lukasmrtvy/docker-snx-shadowsocks:latest
  ```
Note: -t is mandatory 

# Client
`ss-local -s 127.0.0.1 -p 8888 -l 1080 -k initialpass -m  chacha20-ietf-poly1305`

# Browser
`chromium-browser --proxy-server="socks5://127.0.0.1:1080"`

# Mandatory variables and Defaults
```
SNX_CERTPASS=
SNX_CERTPATH=
SNX_SERVER=

CUSTOM_SS_SERVER: "127.0.0.1"
CUSTOM_SS_PORT: "8388"
CUSTOM_SS_METHOD: "chacha20-ietf-poly1305"
CUSTOM_SS_PASS: "<random>"
CUSTOM_SS_OPTS: "--fast-open -u"
```
