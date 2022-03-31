#!/bin/bash 

# Run Scripts in alphabetical order
for script in $(find $DOTFILES_DIR/.bootstrap/programs -maxdepth 1 -type f | sort); do
    echo "  [Programs] Running sub-script: $script"
    bash $script
done

# Cleanup
echo "  [Programs] Performing cleanup"
sudo apt upgrade -y > /dev/null 2>&1
sudo apt autoclean -y > /dev/null 2>&1
sudo apt autoremove -y > /dev/null 2>&1