#!/usr/bin/expect -f
# wrapper to make passwd(1) be non-interactive
# username is passed as 1st arg, passwd as 2nd



set username [lindex $argv 0]
set password [lindex $argv 1]
set serverid [lindex $argv 2]
set newpassword [lindex $argv 3]

spawn ssh $serverid passwd
expect "assword:"
send "$password\r"
expect "UNIX password:"
send "$password\r"
expect "password:"
send "$newpassword\r"
expect "password:"
send "$newpassword\r"
expect eof
