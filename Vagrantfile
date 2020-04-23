# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_ALL"] = "en_US.UTF-8"

# Number of student VMs
N = 0

# Check for required plugin(s)
['vagrant-vbguest'].each do |plugin|
  unless Vagrant.has_plugin?(plugin)
    raise "#{plugin} plugin not found. Please install it via 'vagrant plugin install #{plugin}'"
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.7"

  config.vm.box_check_update = false

  config.vbguest.auto_update = false

  config.vm.synced_folder '.', '/vagrant', disabled: true
  #config.vm.synced_folder ".", "/vagrant", type: "rsync",
  #  rsync__exclude: ".git/"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "4"
  end

  # Added this due to selinux problems having them in /vagrant
  #config.vm.synced_folder '.', '/tmp/vagrant',
  #  mount_options: ["dmode=775,fmode=775"]

  #config.ssh.username = "admin"
  #config.ssh.username = "guest"
  #config.ssh.username = "auditadm"
  #config.ssh.username = "dbadm"
  #config.ssh.username = "logadm"
  #config.ssh.username = "secadm"
  #config.ssh.username = "sysadm"
  #config.ssh.username = "webadm"

  (1..N).each do |i|
    n = "%02d" % i
    config.vm.define "student#{n}" do |node|
      config.vm.hostname = "student#{n}"
      node.vm.provision "shell",
        inline: "echo hello from node student#{n}"
    end
  end

  config.vm.define "tutor" do |node|
    node.vm.hostname = "tutor"
    node.vm.provision "shell",
      inline: "echo hello from node tutor"
  end

  #config.vm.provision "shell", inline: <<-SHELL
  #  sudo yum -y update
  #SHELL

  # Use :ansible or :ansible_local to select the provisioner of your choice
  # https://www.vagrantup.com/docs/provisioning/ansible_common.html

  config.vm.provision "virtualbox", type: "ansible" do |ansible|
    ansible.playbook = "provisioning/virtualbox.yml"
    ansible.config_file = "provisioning/ansible.cfg"
  end

  config.vm.provision "selinux", type: "ansible" do |ansible|
    ansible.playbook = "provisioning/selinux.yml"
    ansible.config_file = "provisioning/ansible.cfg"
  end

  config.vm.provision "vagrant", type: "ansible" do |ansible|
    ansible.playbook = "provisioning/vagrant.yml"
    ansible.config_file = "provisioning/ansible.cfg"
  end

  config.vm.provision "wsl", type: "ansible" do |ansible|
    ansible.playbook = "provisioning/wsl.yml"
    ansible.config_file = "provisioning/ansible.cfg"
  end

  config.vm.provision "wildfly", type: "ansible_local" do |ansible|
    ansible.playbook = "provisioning/wildfly.yml"
    ansible.galaxy_role_file = "provisioning/requirements.yml"
    ansible.galaxy_roles_path = "/etc/ansible/roles"
    ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
  end

end