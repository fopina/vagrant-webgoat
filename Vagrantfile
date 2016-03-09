# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.box_check_update = false
  config.vbguest.auto_update = false if Vagrant.has_plugin? "vagrant-vbguest"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision "fix-no-tty", type: "shell", privileged: false, inline: <<-SHELL
    sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile
  SHELL

  config.vm.provider "virtualbox" do |vb|
    vb.name = "webgoat"
    vb.linked_clone = true
  end

  config.vm.provision "install", type: "shell", path: "scripts/install_webgoat.sh"
  config.vm.provision "setup", type: "shell", privileged: false, path: "scripts/setup_webgoat.sh"

  config.vm.post_up_message = "
  WebGoat is now running!
  Open http://localhost:8080/WebGoat/ in your browser.
  "
end
