# -*- mode: ruby -*-
# vi: set ft=ruby :

# Boostrap Script
$script = <<SCRIPT

# uncomment to change deb repo from .it to .ie, .us, .uk etc
# sudo sed -i -e 's/\.it\./\.ie\./g' /etc/apt/sources.list

# Update & Install
echo 'Updating and installing ubuntu packages...'
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y curl nano git ant

# Install Jenkins
echo 'Installing jenkins...'
source /vagrant/scripts/jenkins.sh

# Install PHP
echo 'Installing PHP...'
source /vagrant/scripts/php.sh

echo 'Installing composer...'
source /vagrant/scripts/composer.sh

echo 'Environment variables...'
source /vagrant/scripts/export.sh

#echo 'Fix vagrant sync_folder bug: https://github.com/mitchellh/vagrant/issues/936'
#source /vagrant/scripts/sync_folder.sh

SCRIPT

Vagrant.configure(2) do |config|

  config.vm.box = "jenkins-php-dev"
  config.vm.network "forwarded_port", guest: 8080, host: 8081
  config.vm.synced_folder "./project", "/vagrant/project",
    owner: "jenkins", group: "jenkins"
  config.vm.provision :shell, :inline => $script
end
