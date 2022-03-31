#!/bin/bash

# if nvm is installed, skip step 
if [ -d ~/.nvm ]; then
  echo "    [Programs/Apps] Already installed: nvm"
else
    # Download file
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh > /dev/null 2>&1

    # Ensure its loaded for the script
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

    # Install NodeJS
    nvm install v16.11.1 > /dev/null 2>&1
    echo "    [Programs/Apps] Installed Node Version Manager & NodeJS v16.11.1"
fi