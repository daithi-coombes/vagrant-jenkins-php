#!/bin/bash

sudo sed -i -e 's/\.it\./\.ie\./g' /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install php5-cli curl
sudo apt-get -y install php5-curl php5-xsl

if [ ! -f /usr/local/bin/composer ]; then
	curl -sS https://getcomposer.org/installer | php
	sudo mv composer.phar /usr/local/bin/composer
	composer self-update
fi

export COMPOSER_HOME=/vagrant/.composer
export PATH=$PATH:/vagrant/.composer/vendor/bin

wget http://localhost:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations xunit
java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart

echo "Installing composer packages...."
echo $COMPOSER_HOME
echo $PATH

cd /vagrant
if [ ! -f /usr/local/bin/phpunit ]; then
	composer global require phpunit/phpunit
	sudo ln -s .composer/vendor/bin/phpunit /usr/local/bin/phpunit
fi
if [ ! -f /usr/local/bin/phpcs ]; then
	composer global require "squizlabs/php_codesniffer=*"
	sudo ln -s .composer/vendor/bin/phpcs /usr/local/bin/phpcs
fi
if [ ! -f /usr/local/bin/phploc ]; then
	composer global require phploc/phploc:2.1.*@dev
	sudo ln -s .composer/vendor/bin/phploc /usr/local/bin/phploc
fi
if [ ! -f /usr/local/bin/pdepend ]; then
	composer global require pdepend/pdepend:@stable
	sudo ln -s .composer/vendor/bin/pdepend /usr/local/bin/pdepend
fi
if [ ! -f /usr/local/bin/phpmd ]; then
	composer global require phpmd/phpmd
	sudo ln -s .composer/vendor/bin/phpmd /usr/local/bin/phpmd
fi
sudo chown -R vagrant:vagrant /usr/local/bin/php*
