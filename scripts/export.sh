echo "********************************************************************************"
echo "[|]                                                                          [|]"
echo "[|]                    Jenkins PHP Exports                                   [|]"
echo "[|]                                                                          [|]"
echo "********************************************************************************"

echo 'Exporting environment variables...'

# set ssh logins to run bash (ie .bashrc)
chsh -s /bin/bash

# Composer
_string='export COMPOSER_HOME=/vagrant/.composer'
_file='/home/vagrant/.bashrc'
sudo grep -q -F "$_string" $_file || echo "$_string" >> $_file
echo ".... COMPOSER_HOME = $COMPOSER_HOME"

# PATH
_string='export PATH=/vagrant/.composer/vendor/bin:$PATH'
_file='/home/vagrant/.bashrc'
sudo grep -q -F "$_string" $_file || echo "$_string" >> $_file
echo ".... PATH = $PATH"
