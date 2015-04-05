# vagrant-jenkins-php beta
Vagrant box for running Jenkins with PHP projects according to [jenkins-php.org](http://jenkins-php.org/)

Initial box:
Vagrant box: https://atlas.hashicorp.com/daithi/boxes/jenkins-php

# Installation

Due to a bug with `Vagrant` [#936](https://github.com/mitchellh/vagrant/issues/936), a chicken and egg situation, an error will be thrown trying to mount the `./project` folder as the user `jenkins` because the jenkins vm isn't loaded yet. So to install:
 1. comment out `project` shared folder in `Vagrantfile`
 2. run `vagrant up`
 3. uncomment the `project` sarend folder in `Vagrantfile`
 4. run `vagrant reload --provision`

Also bash isn't assigned to the vagrant user. So first you will need to login
and run `chsh -s /bin/bash`, enter vagrant for password, then re-provision.

```bash
git clone https://github.com/daithi-coombes/vagrant-jenkins-php
cd vagrant-jenkins-php
vagrant box add jenkins-php-dev http://tools.swergroup.com/downloads/wheezy32.box
vagrant init jenkins-php-dev
# comment project vm share in Vagrantfile
vagrant up

vagrant ssh
\$ chsh -s /bin/bash
# enter vagrant as password
exit

# uncomment project vm share in Vagrantfile
vagrant reload --provision
```

goto [http://localhost:8081](http://localhost:8081) to access the `Jenkins CI`. Also please read the [issues](https://github.com/daithi-coombes/vagrant-jenkins-php/issues) as this project is still in `alpha` - [beta](https://github.com/daithi-coombes/vagrant-jenkins-php/milestones/beta) coming soon.


# Example
For this example take your project root as being `/var/www/html/my-project/public_html` and this repository root as being at `/opt/vagrant-jenkins-php`.

With the above the jenkins vm will automatically look project files in `/opt/vagrant-jenkins-php/my-project`
Then when you
want to build use `rsync` to copy the files to the `project` folder. Vagrant isn't handling linking too well so `ln -s` symlinks aren't being followed by the vm.
To get around this I use my IDE's build functions to copy the project to the relevant folder.

[rsync](http://linux.die.net/man/1/rsync)
```
cd /opt/vagrant-jenkins-php/project
rsync -av /var/www/html/my-project/public_html/* ./ --exclude vendor
```

Other copy commandlines: [Copy folder recursively, excluding some folders](http://stackoverflow.com/questions/2193584/copy-folder-recursively-excluding-some-folders)
