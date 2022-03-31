# Get dotfiles dir from shell
export DOTFILES_DIR=$DOTFILES_DIR

# If no $DOTFILES_DIR, set it to a default
if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR="$HOME/.dotfiles"
fi

# Disallow using $HOME as $DOTFILES_DIR
if [[ $DOTFILES_DIR == $HOME ]]; then
    echo "Abort! You will damage your home directory with this task."
    echo "You cannot run this script using DOTFILES_DIR as the home directory."
    exit 1
fi

# Exit if $DOTFILES_DIR doesnt exist
if [[ -z "$DOTFILES_DIR" ]]; then
    exit 1
fi