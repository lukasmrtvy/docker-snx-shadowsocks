# docker-snx-shadowsocks

# Info

```
docker run -d 
  --name snx-shadowsocks 
  --restart always 
  -e SNX_CERTPASS=mypass 
  -e SNX_CERTPATH=/VPN/mycert.p12 
  -e SNX_SERVER=myserver 
  --cap-add=NET_ADMIN 
  -v /lib/modules:/lib/modules:ro 
  -v /foo/bar/VPN:/VPN:ro 
  -e CUSTOM_SS_PORT=8888 
  -e CUSTOM_SS_SERVER=0.0.0.0 
  lukasmrtvy/docker-snx-shadowsocks:latest
  ```

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
CUSTOM_SS_PASS: "initialpass"
CUSTOM_SS_OPTS: "--fast-open -u"
```
