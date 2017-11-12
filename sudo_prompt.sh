#!/bin/bash 

printf "%s\n" "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
