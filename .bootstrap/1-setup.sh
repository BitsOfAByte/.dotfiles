#!/bin/bash 

# Prompt for sudo password for any future uses
sudo -v -p "  [Setup] Sudo Password: "

# Update and Upgrade system first
echo "  [Setup] Updating and Upgrading System"
sudo dnf update -y > /dev/null 2>&1
sudo dnf upgrade -y > /dev/null 2>&1

for script in $(find $DOTFILES_DIR/.bootstrap/setup -maxdepth 1 -type f | sort); do
    echo "  [Setup] Running sub-script: $script"
    bash $script
done
