#!/bin/bash


# Update and Upgrade
echo "Updating and Upgrading"
sudo apt-get update && sudo apt-get upgrade -y


# Install vim
echo "Installing Vim"
sudo apt-get install -y vim


# Install tmux
echo "Installing Tmux"
sudo apt-get install -y tmux


# Install git
echo "Installing Git, please congiure git later..."
sudo apt-get install -y git
sudo git config --global user.name 'RD Harjai'
sudo git config --global user.email 'rdharjai@gmail.com'


# Install curl
echo "Installing Curl"
sudo apt-get install -y curl

# Install tree
echo "Installing Tree"
sudo apt-get install -y tree


# Python Packages
sudo apt-get install python3-venv


# Generate SSH Key
SSH_FILE=~/.ssh/id_rsa.pub
if test -f "$SSH_FILE"; then
	echo "SSH key already esists. Skipping this step"
else
	echo "Generating SSH keys"
	ssh-keygen -t rsa -b 4096
fi


# Install Sublime Text 3*
echo "Installing Sublime Text"
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text


# Install Google Chrome 
echo "Installing Google Chrome"
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable -y


# Install VS Code
echo "Installing VS Code"
sudo snap install --classic code
code --force --install-extension ms-python.python
code --force --install-extension Equinusocio.vsc-material-theme 
code --force --install-extension Equinusocio.vsc-material-theme-icons
code --force --install-extension vscode-icons-team.vscode-icons
code --force --install-extension PKief.material-icon-theme
code --force --install-extension gruntfuggly.todo-tree 


# LAST: Install ZSH, and Oh My Zsh
echo "Installing ZSH"
sudo apt-get install -y zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 


sudo usermod -s /usr/bin/zsh $(whoami)
chsh -s $(which zsh) $(whoami)

# ZSH Fonts and Plugins
sudo apt-get install -y powerline fonts-powerline


# Oh My ZSH
rm -rf ~/.oh-my-zsh
rm ~/.zshrc*
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/robbyrussell/agnoster/g' ~/.zshrc

