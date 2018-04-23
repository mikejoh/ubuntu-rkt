# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "ubuntu-rkt-demo"
  config.vm.synced_folder "/Users/mikejoh/Vagrant/rkt-demo/shared", "/shared/"
  config.vm.provider "virtualbox" do |v|
    v.name = "ubuntu-rkt-demo"
    v.memory = 1024
    v.cpus = 2
  end
  config.vm.provision :shell, :privileged => false, :path => "bootstrap-rkt.sh"
end

