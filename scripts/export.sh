echo "********************************************************************************"
echo "[|]                                                                          [|]"
echo "[|]                    Jenkins PHP Exports                                   [|]"
echo "[|]                                                                          [|]"
echo "********************************************************************************"

echo 'Exporting environment variables...'

# set ssh logins to run bash (ie .bashrc)
sudo chsh -s /bin/bash

# Composer
_string='export COMPOSER_HOME=/vagrant/.composer'
_file='/etc/bash.bashrc'
sudo grep -q -F "$_string" $_file || echo "$_string" >> $_file
echo ".... COMPOSER_HOME = /vagrant/.composer"

# PATH
_string='export PATH=/vagrant/.composer/vendor/bin:$PATH'
_file='/etc/bash.bashrc'
sudo grep -q -F "$_string" $_file || echo "$_string" >> $_file
echo ".... PATH = $PATH"
