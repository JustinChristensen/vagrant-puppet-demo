# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

    config.vm.define 'master' do |c|
        c.vm.box = 'bento/centos-7.3'

        c.vm.hostname = 'master'

        c.vm.network 'private_network', ip: '192.168.56.0', auto_config: false

        c.vm.provider 'virtualbox' do |vb|
            vb.memory = 4096
            vb.cpus = 2
        end

        c.vm.provision :shell, path: 'configure-network-interfaces.sh'
        c.vm.provision :shell, path: 'setup.sh'
        c.vm.provision :shell, path: 'install-puppet-enterprise.sh'
    end

    config.vm.define 'agent' do |c|
        c.vm.box = 'bento/centos-7.3'

        c.vm.hostname = 'agent'

        c.vm.network 'private_network', ip: '192.168.56.0', auto_config: false

        c.vm.provider 'virtualbox' do |vb|
            vb.memory = 2048
            vb.cpus = 1
        end

        c.vm.provision :shell, path: 'configure-network-interfaces.sh'
        c.vm.provision :shell, path: 'setup.sh'
    end

end
