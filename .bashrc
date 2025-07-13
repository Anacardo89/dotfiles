#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# .bashrc sources scripts from ~/.bashrc.d in order.
#   00_ - base system settings (Debian)
#   10_ - custom prompt
#   20_ - defines Go variables
#   30_ - SSH agent setup
for f in $HOME/.bashrc.d/*.sh; do
    # echo "Sourcing $f"
    [ -r "$f" ] && source "$f"
done

load_ssh_agent