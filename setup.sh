#!/bin/env bash

echo 'performing setup...'

yum -y update
yum -y install mlocate
yum -y install bind-utils
yum -y install vim
yum -y install strace
yum -y install man-pages
