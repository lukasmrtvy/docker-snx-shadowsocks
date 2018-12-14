#!/bin/bash

export SS_SERVER="${CUSTOM_SS_SERVER:-"0.0.0.0"}"
export SS_PORT="${CUSTOM_SS_PORT:-"8388"}"
export SS_METHOD="${CUSTOM_SS_METHOD:-"chacha20-ietf-poly1305"}"
export SS_PASS="${CUSTOM_SS_PASS:-"$(openssl rand -base64 12)"}"
export SS_OPTS="${CUSTOM_SS_OPTS:-"--fast-open -u"}"

export SD_USER="${SD_USER:-admin}"
export SD_PASS="${SD_PASS:-admin}"

if [ -z "${SNX_SERVER+x}" ] && [ -z "${SNX_CERTPATH+x}" ] && [ -z "${SNX_CERTPASS+x}"  ];then
  echo "Not enough variables, make sure that SNX_SERVER, SNX_CERTPATH and SNX_CERTPASS is set"
  exit 1
else

  # for example: # OPTIONS="iptables -t nat -A OUTPUT -p tcp -d Y.Y.Y.Y --dport 443 -j DNAT --to-destination X.X.X.X"
  export OPTIONS=("${OPTIONS}")

  if [[ "${OPTIONS}" ]];then
    $(eval echo "$OPTIONS")
  fi
  
  if [ -z "${CUSTOM_SS_PASS}" ]; then
     echo "Generated password: ${SS_PASS}"
  fi
  exec $@
fi
