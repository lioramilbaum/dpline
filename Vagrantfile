Vagrant.configure("2") do |config|

  config.vm.define "dev" do |dev|

    dev.vm.box = "fedora/29-cloud-base"
    dev.vm.provision "shell",path: "bootstrap.sh"
    dev.vm.network "forwarded_port", guest: 8080, host: 8080
    dev.vm.network "forwarded_port", guest: 9090, host: 9090
    dev.vm.network "forwarded_port", guest: 15672, host: 15672
    dev.vm.network "forwarded_port", guest: 8500, host: 8500
    dev.vm.network "forwarded_port", guest: 5601, host: 5601
    dev.vm.network "forwarded_port", guest: 9200, host: 9200
    dev.vm.network "forwarded_port", guest: 9300, host: 9300
    dev.vm.provider "virtualbox" do |v|
      v.memory = 8192
      v.cpus = 4
    end

  end

end
