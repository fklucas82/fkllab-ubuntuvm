data "vsphere_datacenter" "dc" {
  name = "FKL VSAN LAB"
}

data "vsphere_datastore" "datastore" {
  name          = "vsanDatastore"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "VSANLAB/Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VLAN-Default"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "ubuntu-template"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "fkl-tf-jenkins"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder            = "Linux"
  num_cpus = 2
  memory   = 8192
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"


  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = 30
  }
  disk {
    label            = "disk1"
    size             = 30
    unit_number = 1
  }
  disk {
    label            = "disk2"
    size             = 30
    unit_number = 2
  }
  disk {
    label            = "disk3"
    size             = 30
    unit_number = 3
  }
  disk {
    label            = "disk4"
    size             = 30
    unit_number = 4
  }
  disk {
    label            = "disk5"
    size             = 30
    unit_number = 5
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "fkl-tf-jenkins"
        domain    = "fkl-lab.int"
      }
      network_interface {}
    }
  }
}
