#!/bin/bash

if [ -z "$DOTFILES_DIR" ]; then
# go back 2 levels using readlink
   cd "$(dirname "$(readlink -f "$0")")"
   cd ..
   
   source variables.sh

    if [ -z "$DOTFILES_DIR" ]; then
        exit 1
    fi
fi

if [[ $DOT_CRON == 'true' ]]; then 
  cd $DOTFILES_DIR

  if [ $PWD == $HOME ]; then
    echo "Aborting: $PWD == $HOME"
    exit 1
  fi

  git reset --hard 
  git clean --force
  git pull
  chmod -R +x .
fi

# Syntax: linkDotFile /path/to/original.txt /path/to/symlinl.txt
function linkDotfile {
  # File links variables
  sourceFile="$DOTFILES_DIR/configs/$1"
  targetFile=$2
  dateStr=$(date +%Y-%m-%d-%H%M)

  # If trying to link inside protected directory -> Use Sudo
  # Crontab or running as sudo will disallow any sudo links from running
  if [[ $targetFile != $HOME* && $DOT_CRON != 'true' ]]; then

    # If the symlink exists already -> delete it
    if [ -h $targetFile ]; then
      sudo rm $targetFile
    fi

    #  If a file exists in place of the symlink -> Skip it since protected
    if [ -f $targetFile ]; then
      echo "  [Dotfiles] File already exists! Not deleting since in protected directory: $targetFile"
      return
    fi

    # Create the symlink
    sudo mkdir -p $(dirname $targetFile)
    sudo ln -s $sourceFile $targetFile
    echo "  [Dotfiles] Creating Sudo Symlink: $sourceFile -> $targetFile"
  else 
    # If the symlink exists already -> delete it
    if [ -h $targetFile ]; then
      rm $targetFile
    fi

    # If a file is in place of the symlink -> back up and delete
    if [ -f $targetFile ]; then
      echo "  [Dotfiles] Backing up: $targetFile.$dateStr"
      mv ${targetFile}{,.${dateStr}}
    fi

    # Create the symlink
    mkdir -p $(dirname $targetFile)
    ln -s $sourceFile $targetFile
    echo "  [Dotfiles] Creating Symlink: $sourceFile -> $targetFile"
  fi
}

# Firefox 
linkDotfile firefox/policies.json /etc/firefox/policies/policies.json

# Git 
linkDotfile .gitconfig $HOME/.gitconfig

# Neofetch
linkDotfile neofetch/config.conf $HOME/.config/neofetch/config.conf

# Zsh & P10K
linkDotfile .zshrc $HOME/.zshrc
linkDotfile .p10k.zsh $HOME/.p10k.zsh

# VSCodium & VSCode
linkDotfile vscode/settings.json $HOME/.config/VSCodium/User/settings.json
linkDotfile vscode/settings.json $HOME/.config/Code/User/settings.json
bash configs/vscode/extensions.sh
