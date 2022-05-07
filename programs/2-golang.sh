#!/bin/bash

GOVERSION="1.18.1"

# Check if the installed version is equal to the variable
if ! go version | grep -q "go version go$GOVERSION"; then
    echo "    [Programs/Apps] Installing: go $GOVERSION"
    wget https://go.dev/dl/go$GOVERSION.linux-amd64.tar.gz > /dev/null 2>&1
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GOVERSION.linux-amd64.tar.gz 
    rm go$GOVERSION.linux-amd64.tar.gz
else 
    echo "    [Programs/Apps] Already installed: go $GOVERSION"
fi
