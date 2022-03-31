#!/bin/bash

if [ "$(id -u)" = "0" ]; then
  echo "This script should not be run as root"
  exit 1
fi

source variables.sh

echo "
⠀⠀⠀⠀⠀⠀⠀⢀⡈⢤⡊⢄⠈⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⠈⢤⣚⣭⣾⣿⣿⣯⣞⢭⡊⢀⠈⠀⠀⠀
⠀⠀⣘⣭⣮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣞⢍⠌⠀
⠀⠏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣰⠀
⠀⠭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣲⠀
⠀⢏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣸⠀ BitsOfAByte .dotfiles Bootstrapper
⠀⠏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣰⠀
⠀⠡⢵⡻⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢷⡛⠓⠀
⠀⠀⠀⠐⠁⡒⢵⡻⣷⣿⣿⡿⢷⡛⠥⠒⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠐⠡⡒⠥⠒⠁⠀⠀⠀⠀⠀⠀⠀
"

# Warn if no force flag
if [[ $1 != "--force" && $1 != "-f" ]]; then 
    echo "
--------WARNING---------
Running this script will overwrite configurations and install software
Are you sure you would like to run it? (y/N)
"
    read -r response
fi

# Run script if warning acknowledged or force flag applied
if [[ $response =~ ^([yY][eE][sS]|[yY]) || $1 == "--force" || $1 == "-f" ]]; then

    # Ensure script is in directory
    cd $DOTFILES_DIR

    # Pull remote to local
    echo "[Bootstrap] Matching with remote repository"
    git reset --hard > /dev/null 2>&1
    git clean --force
    git pull > /dev/null 2>&1
    chmod -R +x . > /dev/null 2>&1
    echo "[Bootstrap] Files matched"

    # Run Scripts
    for script in $(find $DOTFILES_DIR/.bootstrap -maxdepth 1 -type f | sort); do
        echo "-----------------------------"
        echo "[Bootstrap] Running: $script"
        bash $script
    done

    # Done
    echo "-------------------------"
    echo "[Bootstrap] Changes applied successfully, restart your system or shell to ensure they have been applied successfully."
fi 


