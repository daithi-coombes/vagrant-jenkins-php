# vagrant-jenkins-php
Vagrant box for running Jenkins with PHP projects according to [jenkins-php.org](http://jenkins-php.org/)

<b>nb</b> project is in `alpha` but `beta` is coming shortly. Make sure you read the [issues](https://github.com/daithi-coombes/vagrant-jenkins-php/issues)

Vagrant box: https://atlas.hashicorp.com/daithi/boxes/jenkins-php

# Installation
```bash
git clone https://github.com/daithi-coombes/vagrant-jenkins-php
cd vagrant-jenkins-php
vagrant up
```
goto [http://localhost:8081](http://localhost:8081) to access the `Jenkins CI`. Also please read the [issues](https://github.com/daithi-coombes/vagrant-jenkins-php/issues) as this project is still in `alpha` - beta coming soon.

# Example
For this example take your project root as being `/var/www/html/my-project/public_html` and this repository root as being at `/opt/vagrant-jenkins-php`.

With the above the jenkins vm will automatically look project files in `/opt/vagrant-jenkins-php/my-project`
Then when you
want to build use `rsync` to copy the files to the `project` folder like so:
```
mdkir -p /path/to/vagrant-jenkins-php/project/my-project/
rsync -av /var/www/nitevibe.loc/public_html/* ./ --exclude vendor
```

Login to the jenkins vm at: http://localhost:8081 and setup your jenkins job.
