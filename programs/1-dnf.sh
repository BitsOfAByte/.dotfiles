#!/bin/bash

# Quick function to check if a package is installed already
function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "    [Programs/Apps] Installing: ${1}"
    sudo dnf install -y $1 > /dev/null 2>&1
  else
    echo "    [Programs/Apps] Already installed: ${1}"
  fi
}

# Add things to install from dnf here (eg "install git")
# These will be processed after sources from /sources are installed
install firefox 
install codium 
install git
