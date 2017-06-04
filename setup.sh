#!/bin/bash

echo Install Software

sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get update -y 

# vim-gtk needed for clipboard on ubuntu 
export install="
vim 
vim-gtk 
redshift 
rsibreak 
zsh 
git 
xclip
qpdfview
mpv
tmux
cmake
meld
npm
pandoc
octave
texlive-latex-base texlive-fonts-recommended texlive-latex-recommended 
python-dev python3-dev build-essential cmake 
"

for f in $install
do  
  sudo apt-get install $f -y 
done

echo Install Vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
mkdir -p ~/.vim/templates
mkdir -p ~/.vim/colors

echo Install Antigen
git clone https://github.com/zsh-users/antigen ~/.antigen/antigen 

sh link.sh 
sudo chown -R $USER: ~/.vim/

vim +PlugInstall +qall
cp ~/.vim/plugged/tender.vim/colors/tender.vim ~/.vim/colors/tender.vim 

# tmux 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf

# make zsh default shell
chsh -s $(which zsh) 

cd ~/.vim/plugged/youcompleteme 
./install.py --clang-completer --tern-completer

