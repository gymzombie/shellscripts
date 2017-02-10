#!/bin/bash

for file in $(find /var/www/html/webappdir/) 
      # can also add -type f for files, -type d for dirs, '*.php', etc
  do

    # here is the ownership
    echo chown -R $(stat -c%U:%G $file) $file

    # here is the permissions
    echo chmod $(stat -c%a $file) $file

  done
