#!/bin/bash

/usr/bin/expect <<EOF
spawn snx -s ${SNX_SERVER} -c ${SNX_CERTPATH}
expect "*?assword:"
send "${SNX_CERTPASS}\r"
expect "*Do you accept*"
send "y\r"
expect "SNX - connected."
interact
EOF
