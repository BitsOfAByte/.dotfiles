#!/bin/bash

# Visual Studio Codium Packages
extensions=(

# Themes and Icons
vscode-icons-team.vscode-icons
enkia.tokyo-night

# Tools
GitHub.vscode-pull-request-github
eamodio.gitlens
yzhang.markdown-all-in-one
wayou.vscode-todo-highlight
vivaxy.vscode-conventional-commits

# Frameworks
Dart-Code.flutter

# Linting
dbaeumer.vscode-eslint
esbenp.prettier-vscode

# Languages
ms-python.
Dart-Code.dart-code
golang.go
)

for i in ${extensions[@]}; do
  echo "  [Dotfiles] Installing VSCode/Codium Extension: $i"

 # Sync Extensions for VSCodium if installed  (usr/bin/codium)
 if [ -f /usr/bin/codium ]; then
  codium --install-extension $i > /dev/null 2>&1
 fi

 # Sync Extensions for VSCode if installed  (usr/bin/code)
 if [ -f /usr/bin/code ]; then
  code --install-extension $i > /dev/null 2>&1
 fi

done
