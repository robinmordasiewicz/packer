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
