# Node
export NODE_PATH='npm root -g'

# GoLang
export GOPATH=$HOME/Dev/langs/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Flutter
export FLUTTERPATH=$HOME/Dev/tools/flutter
export PATH=$PATH:$FLUTTERPATH/bin
export CHROME_EXECUTABLE=/var/lib/flatpak/exports/bin/com.github.Eloston.UngoogledChromium

# Editor 
export EDITOR='codium --wait'
