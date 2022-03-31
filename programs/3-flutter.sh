#!/bin/bash

FLUTTERVERSION="stable"
FLUTTER_DIR="$HOME/Dev/tools/flutter"

if [ -d $FLUTTER_DIR/bin ]; then
  echo "    [Programs/Apps] Already installed: flutter"
else
    # Install flutter pre-reqs
    echo "    [Programs/Apps] Pre-install: flutter"
    sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev > /dev/null 2>&1
    
    # Install flutter
    echo "    [Programs/Apps] Installing: flutter $FLUTTERVERSION (This may take a while)"
    # Get from branch
    git clone https://github.com/flutter/flutter.git $FLUTTER_DIR -b $FLUTTERVERSION > /dev/null 2>&1
    
    # Temporarily add it to path for the rest of the script
    export PATH="$PATH:$FLUTTER_DIR/bin"

    # Install Extra Dependancies
    flutter > /dev/null 2>&1
    flutter doctor > /dev/null 2>&1

    # Configuration
    echo "    [Programs/Apps] Configuring: flutter"
    flutter config --no-analytics > /dev/null 2>&1
    flutter config --enable-linux-desktop > /dev/null 2>&1
    flutter config --android-studio-dir $HOME/Dev/tools/android-studio > /dev/null 2>&1

    echo "    [Programs/Apps] Configuring: dart"
    dart --disable-analytics > /dev/null 2>&1
fi 
