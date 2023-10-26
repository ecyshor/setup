#!/bin/bash
set -e

echo "Installing awesome vim"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cop .vimrc ~/.vim_runtime/my_configs.vim

echo "Setting up the aliases"
cp .bash_aliases ~/.bash_aliases

echo "Install fzf"
sudo apt install fzf
cp .fzf_bash ~/.fzf_bash

echo "Setup bashrc extras"
cat .bashrc_extras >> ~/.bashrc

git config --global user.email "contact@nicu.dev"
git config --global user.name "Nicu Reut"

echo "install ncdu"
sudo apt install ncdu

echo "Install ripgrep"
sudo apt install ripgrep

echo "Install httpie"
sudo apt install httpie

echo "Install docker"
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

## Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
udo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service


sudo apt install python-pygments
sudo apt install net-tools

echo "Install tmux"
sudo apt install tmux
cp .tmux.conf ~/.tmux.conf

echo "Setting up nix"
bash <(curl -sSfL https://nixos.org/nix/install)
cat .nix.conf >> /etc/nix/nix.conf

