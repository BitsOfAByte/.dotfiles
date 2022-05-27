#!/bin/bash

echo "[BitsOfAByte]            
name=BitsOfAByte Packages         
baseurl=https://packages.bitsofabyte.dev/yum/
enabled=1
gpgcheck=0" | sudo tee -a /etc/yum.repos.d/bitsofabyte.repo