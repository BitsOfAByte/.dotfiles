#!/bin/bash 

for script in $(find $DOTFILES_DIR/programs/sources -maxdepth 1 -type f -name "*sh" | sort); do
    echo "    [Programs/PPAs] Installing PPA: $script"
    bash $script
done

# Fetch new package lists after adding sources
echo "    [Programs/PPAs] Updating sources"
sudo dnf reposync -y > /dev/null 2>&1