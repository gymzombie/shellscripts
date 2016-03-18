#!/bin/bash
# Wrapper to call non-interactive password change expect script.
# requires expect to be installed on THIS system, not on the servers.

# Bug: Does not work well for initial connection. When SSH wants to verify authenticity
# of host, script breaks. Same is true if you're connecting via new hostname

servername="10.164.212.165"
username="testme"
oldpassword="testme"
newpassword="password1"


for server in $servername
  do
                        # Todo: Change && to "test for expect script to return successful, else report error"
    ./changepwd.sh $username $oldpassword $server $newpassword && echo "Password on $server changed"
  done

sleep 3

echo "Script completed"
