#!/usr/bin/expect -f
spawn snx -s $env(SNX_SERVER) -c $env(SNX_CERTPATH)
expect "*?assword:"
send "$env(SNX_CERTPASS)\r"
expect {
  {*Do you accept*} {
    send "y\r"
    exp_continue
  }
  eof
}
expect "SNX - connected."
expect eof
