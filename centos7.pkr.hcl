
variable "distroversion" {
  type    = string
  default = "7.2009.27"
}

variable "build" {
  type    = string
  default = "202211040823.1667791030"
}

variable "checksum" {
  type    = string
  default = "0d6c8473a526d6c289bab8b899ed1244"
}

variable "isopath" {
  type    = string
  default = "/var/lib/libvirt/images/iso"
}

variable "customversion" {
  type    = string
  default = "vsb-ves-ce-certifiedhw-generic-production-centos-7.2009.27-202211040823.1667791030"
}

variable "downloadurl" {
  type    = string
  default = "https://downloads.volterra.io/dev/images/centos/7.2009.27-202211040823/vsb-ves-ce-certifiedhw-generic-production-centos-7.2009.27-202211040823.1667791030.iso"
}

variable "md5sum" {
  type    = string
  default = "https://downloads.volterra.io/dev/images/centos/7.2009.27-202211040823/vsb-ves-ce-certifiedhw-generic-production-centos-7.2009.27-202211040823.1667791030.iso.md5"
}

source "qemu" "installmedia" {
  #boot_command     = ["<enter><wait2><wait5><enter><wait60>", "admin<enter><wait3>", "${var.old_ssh_pass}<enter><wait3>", "${var.old_ssh_pass}<enter><wait3>", "${var.new_ssh_pass}<enter><wait3>", "${var.new_ssh_pass}<enter><wait3>"]
  #boot_command     = ["<enter><wait5><enter><wait50># waiting to shutdown 1<right><enter><wait10>two<right><enter><wait10>three<right><enter><wait10>shutdown now -H<enter><wait5><enter>"]
  accelerator      = "kvm"
  disk_interface   = "virtio"
  boot_wait        = "2s"
  cpus             = 2
  headless         = false
  iso_checksum     = var.checksum
  iso_target_path  = "${var.isopath}"
  iso_urls         = ["${var.isopath}", "${var.downloadurl}"]
  memory           = "4096"
  disk_size        = "25000M"
  output_directory = "${var.isopath}/../templates/${var.customversion}"
  qemuargs = [
    ["-cpu", "host"],
    ["-device", "isa-fdc,id=floppy-bus"],
  ]
  communicator     = "none"
  #shutdown_timeout = "2m"
  machine_type     = "q35"
  shutdown_command = ""
  vm_name          = "${var.customversion}.qcow2"
}

build {
  sources = ["source.qemu.installmedia"]
}
