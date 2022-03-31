#!/bin/bash

if [ -d ~/Dev/tools/android-studio ]; then
    echo "    [Programs/Apps] Already installed: android-studio"
else 
    echo "    [Programs/Apps] Installing: android-studio (This may take a while)"
    sudo apt install adb -y > /dev/null 2>&1
    wget file https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.22/android-studio-2021.1.1.22-linux.tar.gz -O android-studio.tar.gz > /dev/null 2>&1
    tar -C $HOME/Dev/tools -xzf android-studio.tar.gz > /dev/null 2>&1
    rm android-studio.tar.gz > /dev/null 2>&1 
fi
