domain = 'example.com'

Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define "master", primary: true do |master|
master.vm.synced_folder "base/", "/srv", owner: "root", group: "root"
   master.vm.box = "bento/centos-6.7"
master.vm.hostname = "master.#{domain}"
master.hostmanager.aliases = %W(salt salt.#{domain})
  master.vm.network "private_network", ip: "172.16.42.10"
master.vm.provision :salt do |salt|
salt.seed_master = {
"master.#{domain}" => "keys/master.#{domain}.pub",
"minion1.#{domain}" => "keys/minion1.#{domain}.pub",
"minion2.#{domain}" => "keys/minion2.#{domain}.pub",
}
      salt.install_master = true
      salt.run_highstate = true
      salt.master_key = "keys/master.pem"
salt.master_pub = "keys/master.pub"
      salt.minion_id =  "master.#{domain}.pub"
salt.minion_key = "keys/master.#{domain}.pem"
salt.minion_pub = "keys/master.#{domain}.pub"
end
end

  config.vm.define "minion1" do |minion1|
    minion1.vm.box = "bento/centos-6.7"
  minion1.vm.network "private_network", ip: "172.16.42.11"
minion1.vm.hostname = "minion1.#{domain}"
minion1.vm.provision :salt do |salt|
salt.minion_key = "keys/minion1.#{domain}.pem"
salt.minion_pub = "keys/minion1.#{domain}.pub"
      salt.install_master = false
      salt.run_highstate = true
end
  end

  config.vm.define "minion2" do |minion2|
    minion2.vm.box = "bento/centos-6.7"
  minion2.vm.network "private_network", ip: "172.16.42.12"
minion2.vm.hostname = "minion2.#{domain}"
minion2.vm.provision :salt do |salt|
salt.minion_key = "keys/minion2.#{domain}.pem"
salt.minion_pub = "keys/minion2.#{domain}.pub"
      salt.install_master = false
      salt.run_highstate = true
end
  end

end
