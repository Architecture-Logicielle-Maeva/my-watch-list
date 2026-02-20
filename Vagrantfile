# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Définir l'image de base Debian
  config.vm.box = "debian/bookworm64"

  # Liste des noms de VM
  nodes = ["node1", "node2", "node3"]

  nodes.each_with_index do |name, index|
    config.vm.define name do |node|
      node.vm.hostname = name
      node.vm.network "private_network", ip: "192.168.56.#{10 + index}" # IP fixe pour chaque VM
      node.vm.provider "virtualbox" do |vb|
        vb.name = name
        vb.memory = 1024
        vb.cpus = 1
      end

      # Provisionnement basique pour mettre à jour les paquets
      node.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get upgrade -y
        apt-get install -y ssh
      SHELL
    end
  end

end