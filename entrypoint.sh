#!/bin/bash

export SS_SERVER="${CUSTOM_SS_SERVER:-"127.0.0.1"}"
export SS_PORT="${CUSTOM_SS_PORT:-"8388"}"
export SS_METHOD="${CUSTOM_SS_METHOD:-"chacha20-ietf-poly1305"}"
export SS_PASS="${CUSTOM_SS_PASS:-"initialpass"}"
export SS_OPTS="${CUSTOM_SS_OPTS:-"--fast-open -u"}"

if [ -z "${SNX_SERVER+x}" ] && [ -z "${SNX_CERTPATH+x}" ] && [ -z "${SNX_CERTPASS+x}"  ];then
  echo "Not enough variables, make sure that SNX_SERVER, SNX_CERTPATH and SNX_CERTPASS is set"
  exit 1
else
  if [ -n "${CUSTOM_DNAT_IPTABLE_RULE_DEST+x}" ] && [ -n "${CUSTOM_DNAT_IPTABLE_RULE_PORT+x}" ]; then
    iptables -t nat -A OUTPUT -p tcp -d "${CUSTOM_DNAT_IPTABLE_RULE_DEST}" --dport "${CUSTOM_DNAT_IPTABLE_RULE_PORT}" -j DNAT --to-destination "${SNX_SERVER}"
  fi
  exec $@
fi
