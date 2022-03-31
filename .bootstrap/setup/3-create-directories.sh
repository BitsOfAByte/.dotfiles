#!/bin/bash

echo "    [Setup/Directories] Creating directories"

# Create Development Directories
mkdir -p $HOME/Dev/{langs,tools}
mkdir -p $HOME/Dev/langs/{node,go,python,misc}
mkdir -p $HOME/Dev/tools/

# Go
mkdir -p $HOME/Dev/langs/go/{bin,pkg,src}
