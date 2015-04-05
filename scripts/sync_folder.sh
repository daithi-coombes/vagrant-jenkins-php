
# fix vagrant sync_folder bug: https://github.com/mitchellh/vagrant/issues/936
# n.b. Call this script only AFTER jenkins has been installed
sudo mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g jenkins` ./project /vagrant/project
