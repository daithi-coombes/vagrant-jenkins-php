
if [ ! -f /usr/local/bin/composer ]; then
	curl -sS https://getcomposer.org/installer | php
	sudo mv composer.phar /usr/local/bin/composer
	composer self-update
fi

echo 'Installing composer packages...'
cd /vagrant/.composer
composer install

cd /vagrant/.composer/vendor
if [ ! -f /usr/bin/phploc ]; then
	sudo ln -s /vagrant/.composer/vendor/phploc/phploc/phploc /usr/bin/phploc
fi

if [ ! -f /usr/bin/pdepend ]; then
	sudo ln -s /vagrant/.composer/vendor/pdepend/pdepend/src/bin/pdepend /usr/bin/pdepend
fi

if [ ! -f /usr/bin/phpcbf ]; then
	sudo ln -s /vagrant/.composer/vendor/squizlabs/php_codesniffer/scripts/phpcbf /usr/bin/phpcbf
fi

if [ ! -f /usr/bin/phpcpd ]; then
	sudo ln -s /vagrant/.composer/vendor/sebastian/phpcpd/phpcpd /usr/bin/phpcpd
fi

if [ ! -f /usr/bin/phpcs ]; then
	sudo ln -s /vagrant/.composer/vendor/squizlabs/php_codesniffer/scripts/phpcs /usr/bin/phpcs
fi

if [ ! -f /usr/bin/phpdox ]; then
	sudo ln -s /vagrant/.composer/vendor/theseer/phpdox/phpdox /usr/bin/phpdox
fi

if [ ! -f /usr/bin/phpmd ]; then
	sudo ln -s /vagrant/.composer/vendor/phpmd/phpmd/src/bin/phpmd /usr/bin/phpmd
fi

if [ ! -f /usr/bin/phpunit ]; then
	sudo ln -s /vagrant/.composer/vendor/phpunit/phpunit/phpunit /usr/bin/phpunit
fi
