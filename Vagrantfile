# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.box = 'bento/centos-7.3'

  config.vm.hostname = 'agent-test'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '2048'
    vb.cpus = 2

    vb.customize ['modifyvm', :id,
        '--nic2', 'hostonly',
        '--hostonlyadapter2', 'vboxnet0',
        '--cableconnected2', 'on',
        '--nictype2', '82540EM'
    ]
  end

end
