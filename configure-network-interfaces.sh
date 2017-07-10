#!/bin/env bash

# simple test to verify that the system is in the desired state
nmcli connection show enp0s8 &> /dev/null

if [ $? -ne 0 ]; then
    echo 'configuring network interfaces...'

    # TODO: figure out how device names are generated
    # man 5 nm-settings

    # disable nat adapter DNS
    nmcli connection modify enp0s3 \
    ipv4.dns-options '' \
    ipv4.ignore-auto-dns true \
    ipv6.dns-options '' \
    ipv6.ignore-auto-dns true


    # configure the host-only adapter
    nmcli connection add type ethernet con-name enp0s8 ifname enp0s8 -- \
    ipv4.never-default true \
    ipv4.dns '192.168.56.1' \
    ipv6.method ignore

    sleep 1

    nmcli connection reload
    nmcli connection up enp0s3
    nmcli connection up enp0s8
else
    echo 'network interfaces already configured'
fi
