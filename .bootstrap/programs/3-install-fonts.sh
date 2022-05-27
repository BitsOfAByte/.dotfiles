#!/bin/bash

# Syntax: downloadFont URL NAME
function downloadFont {
    fontURL=$1
    fontName=$2
    fontDir=$HOME/.local/share/fonts

    echo "      [Programs/Fonts] Installing: $fontName"
    wget -q $fontURL -O "$fontDir/$fontName"
}

downloadFont https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf "MesloLGS NF Regular.ttf"
downloadFont https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf  "MesloLGS NF Bold.ttf"
downloadFont https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf "MesloLGS NF Italic.ttf"
downloadFont https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf "MesloLGS NF Bold Italic.ttf"


echo "      [Programs/Fonts] Installing: Firacode"
sudo dnf install fonts-firacode > /dev/null 2>&1