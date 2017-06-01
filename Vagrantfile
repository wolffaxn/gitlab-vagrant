# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # CentOS 7
  BOX = "centos/7"

  # create gitlab node
  config.vm.define :gitlab do |gitlab|
    gitlab.vm.box = "#{BOX}"

    # the hostname the machine should have
    gitlab.vm.hostname = "gitlab"

    # time in seconds that Vagrant will wait for the machine to boot
    gitlab.vm.boot_timeout = 300
    # disable automatic box update checking
    gitlab.vm.box_check_update = false

    # NFS requires a host-only network to be created
    gitlab.vm.network :private_network, ip: "10.0.20.10"

    gitlab.vm.synced_folder ".", "/vagrant", type: "nfs"

    gitlab.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--audio", "none"]
      vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
      vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
    end

    gitlab.vm.provision :shell, path: "bootstrap-gitlab.sh"
  end
end
