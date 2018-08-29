#!/bin/bash

if [ -z ${SNX_SERVER+x} ] && [ -z ${SNX_CERTPATH+x} ] && [ -z ${SNX_CERTPASS+x}];then
  echo "Not enough variables, make sure that SNX_SERVER, SNX_CERTPATH and SNX_CERTPASS is set"
  exit 1
else
  exec $@
fi
