#!/bin/bash 

# Run Scripts in alphabetical order
for script in $(find $DOTFILES_DIR/.bootstrap/programs -maxdepth 1 -type f | sort); do
    echo "  [Programs] Running sub-script: $script"
    bash $script
done

# Cleanup
echo "  [Programs] Performing cleanup"
sudo dnf update -y > /dev/null 2>&1