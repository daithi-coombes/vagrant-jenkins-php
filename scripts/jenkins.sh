# install jenkins
if [ ! -f /etc/init.d/jenkins ]; then

    echo '.... adding jenkins apt-key'
	wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    echo '.... adding jenkins deb to /etc/apt/sources.list.d/jenkins.list'
    _string='deb http://pkg.jenkins-ci.org/debian binary/'
    sudo touch /etc/apt/sources.list.d/jenkins.list
    _file='/etc/apt/sources.list.d/jenkins.list'
    sudo grep -q -F "$_string" $_file || echo "$_string" >> $_file
	sudo apt-get update
	sudo apt-get -y install jenkins
    echo '.... starting jenkins'
	sudo service jenkins start
fi

# install plugins
if [ ! -f /home/vagrant/jenkins-cli.jar ]; then
    echo '.... installing jenkins plugins'
	until [ `curl --silent --show-error --connect-timeout 1 -I http://localhost:8080` !="" ];
	do
		wget http://localhost:8080/jnlpJars/jenkins-cli.jar
		java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations xunit
		java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart
	done
fi

# create default job
if [ ! -f /var/lib/jenkins/jobs/default/config.xml ]; then
    echo '.... building jenkins default job'
    sudo mkdir -p /var/lib/jenkins/jobs/default
    sudo cp /vagrant/config.xml /var/lib/jenkins/jobs/default/config.xml
    sudo chown -R jenkins:jenkins /var/lib/jenkins/jobs/default
    cd ~
    java -jar jenkins-cli.jar -s http://localhost:8080 reload-configuration
fi
