#!/bin/bash

# Custom .bashrc
if [[ -f /vagrant/cnf/.bashrc ]]; then
  echo "Adding custom .bashrc"
  cp /vagrant/cnf/.bashrc /home/vagrant
  chown vagrant:vagrant /home/vagrant/.bashrc
fi

# Custom .vimrc and colors
if [[ -f /vagrant/cnf/.vimrc ]]; then
  echo "Adding custom .vimrc and colors"
  cp /vagrant/cnf/.vimrc /home/vagrant
  if [[ ! -d /home/vagrant/.vim/colors ]]; then
    mkdir -p /home/vagrant/.vim/colors
  fi
  cp /vagrant/cnf/hybrid.vim /home/vagrant/.vim/colors
  chown vagrant:vagrant /home/vagrant/.vimrc
  chown -R vagrant:vagrant /home/vagrant/.vim
fi

# Apply local Drupal settings
if [[ ! -f /vagrant/cnf/settings.php ]]; then
  echo "Applying local Drupal settings"
  cp /vagrant/cnf/local.settings.php /vagrant/cnf/settings.php
fi

# Composer install, run the Drupal install scripts
su vagrant -c 'cd /vagrant && composer install && build/install.sh;'

