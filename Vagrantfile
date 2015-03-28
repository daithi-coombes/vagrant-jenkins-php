# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "daithi/jenkins-php"

  config.vm.network "forwarded_port", guest: 8080, host: 8081

  config.vm.provider  "virtualbox"

end
