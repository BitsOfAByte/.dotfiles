#!/bin/bash 

for script in $(find $DOTFILES_DIR/programs -maxdepth 1 -type f -name "*sh" | sort); do
    echo "    [Programs/Apps] Installing App: $script"
    bash $script
done
