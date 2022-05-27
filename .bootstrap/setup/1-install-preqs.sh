function install {
  which $1 &> /dev/null
  if [ $? -ne 0 ]; then
    echo "    [Setup/Prereqs] Installing requirement: ${1}"
    sudo dnf install -y $1 > /dev/null 2>&1
  else
    echo "    [Setup/Preqs] Requirement met: ${1}"
  fi
}

# Dotfile Required Packages 
install neofetch 
install git
install curl
install wget
install zsh
install find
install cron
install cronie
