#!/usr/bin/env bash

if [[ -f /vagrant/cnf/.vimrc ]]; then

  cp /vagrant/cnf/.vimrc ~

  if [[ ! -d ~/.vim/colors ]]; then
    mkdir -p ~/.vim/colors
  fi

  cp /vagrant/cnf/hybrid.vim ~/.vim/colors

fi

