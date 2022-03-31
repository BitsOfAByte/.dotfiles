#!/bin/bash 

# If zsh is not the default shell, change it
if ! [[ $SHELL =~ "zsh" ]]; then   
    echo "    [Setup/Shell] Changing default shell to zsh"
    chsh -s /bin/zsh
else 
    echo "    [Setup/Shell] Default shell is already zsh"
fi