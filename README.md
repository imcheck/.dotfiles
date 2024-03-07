# .dotfiles
## Prerequisite
1. asdf
2. kube-ps1
3. awscli
4. kubectl
5. istioctl
6. terraform

## Setup
```sh
# Download dot files
git clone git@github.com:imcheck/.dotfiles ~/.dotfiles

# Tmux
ln -s ~/.dotfiles/tmux/.tmux.conf ~

# Vim
ln -s ~/.dotfiles/vim/.vimrc

# ZSH
mkdir -p ~/.zsh
ln -s ~/.dotfiles/zsh/.zshrc ~
ln -s ~/work/.dotfiles/.git.plugin.zsh ~/.zsh
ln -s ~/work/.dotfiles/.git.zsh ~/.zsh
```
