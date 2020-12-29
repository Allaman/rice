#!/bin/bash

# This scripts is for bootstraping to use ansible

case $1 in
  bootstrap)
    echo bootstrapping
    pip install ansible --user
    ;;
  configure)
    echo Running Ansible
    ansible-galaxy install -r requirements.yml -f
    ansible-playbook play.ym -K
    ;;
  aur)
    echo Installing AUR packages
    yay -S masterpdfeditor urlview telepresence visual-studio-code-insiders rofi-emoji vidir glow
    ;;
  other)
    ;;
esac
