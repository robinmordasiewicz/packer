# packer create qcow2 from live-media installer


packer init .
packer fmt .
packer build centos7.pkr.hcl
