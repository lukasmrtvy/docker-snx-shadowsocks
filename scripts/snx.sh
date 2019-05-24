#!/usr/bin/expect

set timeout 10
log_user 1
send_user "SNX disconnecting... if connected.\n"
spawn snx -d
expect {
        timeout { exit 2 }
        eof {
                sleep 1
                send_user "SNX connecting...\n"
                spawn snx -s $env(SNX_SERVER) -c $env(SNX_CERTPATH)
                expect {
                        "password:" {
                                send "$env(SNX_CERTPASS)\r"
                                expect {
                                        "*accept*" {
                                               send "y\r"
                                               exp_continue
                                        }
                                        "connected." {
                                                send_user "Connected!\n"
                                                exit 0
                                        }
                                        "Connection aborted." {
                                                send_user "Connection aborted\n"
                                                exit 1
                                        }
                                        eof {
                                                send_user "Error\n"
                                                exit 1
                                        }
                                        timeout { 
                                                send_user "Timeout\n"
                                                exit 2
                                        }
                                }
                        }
                        eof {
                                send_user "Error\n"
                                exit 1
                        }
                        timeout { 
                                send_user "Timeout\n"
                                exit 2
                        }

                }
    }
}
expect eof
exit 1
