# Download znap if its not installed
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

# Start Znap
source ~/Git/zsh-snap/znap.zsh  

# `znap source` automatically downloads and starts plugins.
znap source romkatv/powerlevel10k
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
#znap source marlonrichert/zsh-autocomplete

# `znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# Load p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell History
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000
setopt SHARE_HISTORY
