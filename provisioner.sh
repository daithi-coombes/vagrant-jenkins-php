#change  it.packages in sources.list to ie.packages
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install php5-cli curl
sudo apt-get -y install php5-curl php5-xsl

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer self-update

wget http://localhost:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations xunit
java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart

composer global require phpunit/phpunit
composer global require "squizlabs/php_codesniffer=*"
composer global require phploc/phploc:2.1.*@dev
composer global require pdepend/pdepend:@stable
composer global require phpmd/phpmd

export PATH=~/.composer/vendor/bin:$PATH
