source "qemu" "installmedia" {
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
  disk_cache       = "none"
  disk_discard     = "unmap"
  cpu_model        = "host"
  output_directory = "/var/lib/libvirt/templates/${var.customversion}"
  qemuargs = [
    ["-cpu", "host"],
    ["-device", "isa-fdc,id=floppy-bus"],
  ]
  communicator = "none"
  machine_type     = "q35"
  shutdown_command = ""
  vm_name          = "${var.customversion}.qcow2"
}

build {
  sources = ["source.qemu.installmedia"]
}

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
  default = "/var/lib/libvirt/iso"
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

