#!/bin/sh

# ------------------------------------------------------------------------
# Based on:
# https://www.revsys.com/writings/quicktips/nat.html
#
# Command line script to setup NAT on a dual homed Linux host, with
# notes.
# ------------------------------------------------------------------------

# Enable IP forwarding for ipv4 traffic.  Boot time equivalent is to
# edit /etc/sysctl.conf like so:
# - net.ipv4.ip_forward = 0
# + net.ipv4.ip_forward = 1
echo 1 > /proc/sys/net/ipv4/ip_forward

# Setup firewall rules for NAT. eth0 is outside. eth1 is inside.  Boot
# time equivalent is for these rules to go in a file like
# /etc/iptables.conf then loaded from a boot time script script.
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/sbin/iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

# Additional notes
# Outside interface picks up address from local network DHCP server.
# /etc/network/interfaces.d/eth0
# auto eth0
# iface eth0 inet dhcp
#
# Inside interface has static IP address on RFC 1918 172.17 network.
# Other hosts connecting to this interface should be on the same
# network.
# /etc/network/interfaces.d/eth1
# auto eth1
# iface eth1 inet static
#   address 172.17.1.2
#   netmask 255.255.255.0
