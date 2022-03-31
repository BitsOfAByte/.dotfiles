#!/bin/bash

# Install Global Node Packages
function install {
    echo "    [Programs/Apps] Installing Package: $1"
    npm install -g $1 > /dev/null 2>&1
}

install yarn