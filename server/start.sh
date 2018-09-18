#!/usr/bin/env bash

##
# Ensure /.composer is writable
# 
chmod -R ugo+rw /.composer

##
# Run a command or start supervisord
#
if [ $# -gt 0 ];then
    # If we passed a command, run it
    exec "$@"
else
    # Otherwise start supervisord
    /usr/bin/supervisord
fi