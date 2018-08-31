#!/usr/bin/expect -f
spawn snx -s $env(SNX_SERVER) -c $env(SNX_CERTPATH)
expect "*?assword:"
send "$env(SNX_CERTPASS)\r"
expect "*Do you accept*"
send "y\r"
expect "SNX - connected."
expect eof
