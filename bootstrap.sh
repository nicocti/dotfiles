cp -r .zsh/ ~/.zsh
rsync -a .config/ ~/.config
cp .zshenv ~/.zshenv
cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
source ~/.zshrc