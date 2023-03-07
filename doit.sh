#!/bin/bash
#

#rm -rf /var/lib/libvirt/images/templates/CentOS-7-x86_64-Minimal/
#rm -rf /var/lib/libvirt/images/templates/CentOS-7-x86_64-DVD/
packer init .
packer fmt .
packer build xc.json.pkr.hcl
