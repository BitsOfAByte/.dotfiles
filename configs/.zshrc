# Set the dotfiles directory
export DOTFILES_DIR="$HOME/.dotfiles"

# Load zsh configuration from configs/zsh/
for zsh_file ($DOTFILES_DIR/configs/zsh/*.zsh) source $zsh_file

# Load zsh private configuration (Can override remote)
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

