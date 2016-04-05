#!/bin/bash

set -e

path=$(dirname "$0")
base=$(cd $path/.. && pwd)
drush="drush $drush_flags -y -r $base/www"

chmod -R +w $base/www/sites/default
chmod -R +w $base/cnf

echo "Symlink settings.php into Drupal directory"
ln -sf $base/cnf/settings.php $base/www/sites/default/
echo "Installing Drupal"
$drush si --site-name=cray --account-pass=admin

