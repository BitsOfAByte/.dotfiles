#!/bin/bash

echo "    [Setup/Directories] Creating directories"

# Create key directories 

# Create Development Directories
mkdir -p $HOME/Dev/{langs,tools}
mkdir -p $HOME/Dev/langs/{node,go,python,rust,misc}
mkdir -p $HOME/Dev/langs/go/{bin,pkg,src} # For Go

# Make GPG Directory
mkdir -p ~/.gnupg

# Fix its permissions if they're broken.
chown -R $(whoami) ~/.gnupg/
chmod 600 ~/.gnupg/*
chmod 700 ~/.gnupg
