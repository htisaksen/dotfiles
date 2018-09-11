##.files for Mac config to setup environment
Order of installation
1. brew
2. zsh
3. vim
4. dotfiles

## Initialization
```bash
make initialize
```
### Info
Run to initialize(brew zsh vim dotfiles makes) and install

## Install brew dependencies brew
```bash
make brew
```
### Info

#### Brew Packages (Reads from my_brews.txt)
- ansible
- cassandra
- cowsay
- httpie
- jq
- kubernetes-cli
- kubernetes-helm
- maven
- node
- pcre2
- wget
- htop
- nmap
- links
- tree
- cask

## Setup zsh
```bash
make zsh
```
### Info
Uses robbyrussell/oh-my-zsh. .zshrc has plugins installed. Aliases are sourced here. Add or remove in .aliases
#### plugins in .zshrc
- git
- osx
- docker
- encode64
- httpie
- jsontools
- mvn
- ng
- node
- npm
- pip
- python
- web-searchs
## Setup vim
```bash
make vim
```
### Info
Vim grabs amix/vimrc.git
## Setup dotfiles
```bash
make dotfiles
```
### Info
These dotfiles are made for zsh
