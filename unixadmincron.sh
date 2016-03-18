#!/bin/bash

# Need to create a script that does nightly (weekly?) upgrades, patches, reviews, and emails 
# Sysadmin to keep the status awared. 

apt-get upgrade
apt-get dist-upgrade
apt-get update

updatedb




# (This is not it, just a note):
# apt-get upgrade | tee upgrade-$( date +%F ).log
