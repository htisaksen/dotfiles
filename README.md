# .files
Mac config to setup dev environment
### Pre-requesites
1. brew
```
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
2. git + xcode init
## Initialization - to init and install brew zsh and dotfiles
```bash
make all
```
## Install brew - install dependencies from my_brews.txt 
```bash
make brew
```
## Setup zsh - install oh-my-zsh with spaceship theme 
```bash
make zsh
```
## Setup dotfiles - source dotfiles (vimrc,zshrc)
```bash
make dotfiles
```
## Setup all applications - personal and development apps
```bash
make all-apps
```
## Setup personal applications - personal apps
```bash
make apps
```
## Setup personal applications - dev apps
```bash
make dev-apps
```