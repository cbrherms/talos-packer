# Create a new VM from a clone

resource "proxmox_vm_qemu" "talos-workers" {

    # Dynamic provisioning of multiple nodes
    count = length(var.nodes)

    # VM General Settings
    target_node = var.nodes[count.index].target_node
    name = var.nodes[count.index].node_name
    vmid = var.nodes[count.index].vm_id

    # VM Advanced General Settings
    onboot = true

    # VM OS Settings
    clone = var.nodes[count.index].clone_target

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = var.nodes[count.index].node_cpu_cores
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = var.nodes[count.index].node_memory

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Disk Settings
    scsihw = "virtio-scsi-single"
    disks {
        scsi {
            scsi0 {
                disk {
                    size      = var.nodes[count.index].node_disk
                    format    = var.nodes[count.index].node_disk_format
                    iothread  = true
                    backup    = false
                    storage   = var.nodes[count.index].node_disk_storage
                }
            }
            scsi1 {
                disk {
                    size      = var.nodes[count.index].additional_node_disk
                    format    = var.nodes[count.index].additional_node_disk_format
                    iothread  = true
                    backup    = false
                    storage   = var.nodes[count.index].additional_node_disk_storage
                }
            }
        }
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    cloudinit_cdrom_storage = var.nodes[count.index].node_disk_storage
    ipconfig0 = var.nodes[count.index].node_ipconfig
}

output "mac_addrs" {
    value = [for value in proxmox_vm_qemu.talos-workers : lower(tostring(value.network[0].macaddr))]
}