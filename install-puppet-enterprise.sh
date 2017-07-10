#!/bin/env bash

pe_installer='puppet-enterprise-2017.2.2-el-7-x86_64'
pe_installer_aws_url="https://s3.amazonaws.com/pe-builds/released/2017.2.2/$pe_installer.tar.gz"
pe_installer_path="/vagrant/$pe_installer.tar.gz"

echo 'installing puppet enterprise...'

if [ ! -f $pe_installer_path ]; then
    curl -s -o $pe_installer_path $pe_installer_aws_url
fi

tar -zxvf $pe_installer_path -C /tmp
# chmod -R g+w /tmp/$pe_installer
chown -R root:root /tmp/$pe_installer
/tmp/$pe_installer/puppet-enterprise-installer -c /vagrant/pe.conf
