
variable "new_ssh_pass" {
  type    = string
  default = "Volterra123"
}

variable "old_ssh_pass" {
  type    = string
  default = "Volterra123"
}

source "qemu" "autogenerated_1" {
  boot_command     = ["<wait5><enter><wait480>", "admin<enter><wait3>", "${var.old_ssh_pass}<enter><wait3>", "${var.old_ssh_pass}<enter><wait3>", "${var.new_ssh_pass}<enter><wait3>", "${var.new_ssh_pass}<enter><wait3>"]
  boot_wait        = "2s"
  cpus             = 4
  format           = "qcow2"
  headless         = true
  http_directory   = "http"
  iso_checksum     = "0d6c8473a526d6c289bab8b899ed1244"
  iso_target_path  = "/var/lib/libvirt/images/iso/"
  iso_urls         = ["/var/lib/libvirt/images/iso/vsb-ves-ce-certifiedhw-generic-production-centos-7.2009.27-202211040823.1667791030.iso"]
  memory           = "16384"
  output_directory = "output-xc"
  qemuargs         = [["-cpu", "host"], ["-device", "isa-fdc,id=floppy-bus"]]
  ssh_password     = var.new_ssh_pass
  #communicator     = "none"
  shutdown_timeout = "10m"
  ssh_timeout      = "9m"
  ssh_username     = "admin"
  machine_type     = "q35"
  shutdown_command = ""
  vm_name          = "xc.qcow2"
}

build {
  sources = ["source.qemu.autogenerated_1"]

}
