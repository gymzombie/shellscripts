#!/bin/bash

# Need to create a script that does nightly (weekly?) upgrades, patches, reviews, and emails 
# Sysadmin to keep the status awared. FreeBSD does a good job of this, and wanted to bring some equivalent
# to my Linux Boxes

# Make sure cron sends results to admin...

apt-get upgrade
apt-get dist-upgrade
apt-get update

updatedb

df -h




# (This is not it, just a note):
# apt-get upgrade | tee upgrade-$( date +%F ).log
