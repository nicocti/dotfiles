#!/bin/bash
sudo apt update
sudo apt upgrade
mkdir ~/tools
mkdir ~/data
mkdir ~/projects

# Install zsh:
sudo apt install curl zsh zsh-syntax-highlighting zsh-autosuggestions git snap apt-transport-https micro make \
build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev ca-certificates \
xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev golang-go xclip htop tree software-properties-common

# Snap packages:
sudo snap install spotify

# Install VS code:
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update; sudo apt install code

# Python stuff
python3 -m pip install 'python-language-server[all]' jupyter

# Venv:
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install 3.8
mkvenv data
pip install ipykernel
ipython kernel install --user --name=data

# Node / NPM:
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# JDK:
sudo apt install openjdk-8-jdk
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.zshenv
echo 'export JVM_HOME=$JAVA_HOME' >> ~/.zshenv
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshenv

# Docker:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && sudo apt install docker-ce

# Kubectl:
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-$(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install kubectl

#############
# MINICONDA #
#############

cd ~/tools && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh
echo ‘export PATH=$PATH:/home/nicocti/miniconda3/bin’ >> ~/.zshrc
~/miniconda3/bin/python3.7 -m ipykernel install --user --name conda --display-name "Conda (default)"
