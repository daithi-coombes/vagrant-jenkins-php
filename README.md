# vagrant-jenkins-php
Vagrant box for running Jenkins with PHP projects according to [jenkins-php.org](http://jenkins-php.org/)

Vagrant box: https://atlas.hashicorp.com/daithi/boxes/jenkins-php

# Installation
```bash
git clone https://github.com/daithi-coombes/vagrant-jenkins-php
cd vagrant-jenkins-php
vagrant up
```

# Example
Say your project is at `/var/www/html/my-project/public_html`. Then when you
want to build use `rsync` to copy the files to the `project` folder like so:
```
mdkir -p /path/to/vagrant-jenkins-php/project/my-project/
rsync -av /var/www/nitevibe.loc/public_html/* ./ --exclude vendor
```

Login to the jenkins vm at: http://localhost:8081 and setup your jenkins job.
