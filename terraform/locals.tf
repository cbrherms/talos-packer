locals {
  # Master Node configuration
  vm_master_nodes = {
    "0" = {
      vm_id                        = 200
      target_node                  = var.proxmox_node
      node_name                    = "talos-master-00"
      clone_target                 = "talos-v1.7.5-cloud-init-template"
      node_cpu_cores               = "2"
      node_memory                  = 2048
      node_ipconfig                = "ip=192.168.0.170/24,gw=192.168.0.1"
      node_disk                    = "32" # in GB
      node_disk_format             = "raw"
      node_disk_storage            = "local-lvm"
    }
    "1" = {
      vm_id                        = 201
      target_node                  = var.proxmox_node
      node_name                    = "talos-master-01"
      clone_target                 = "talos-v1.7.5-cloud-init-template"
      node_cpu_cores               = "2"
      node_memory                  = 2048
      node_ipconfig                = "ip=192.168.0.171/24,gw=192.168.0.1"
      node_disk                    = "32" # in GB
      node_disk_format             = "raw"
      node_disk_storage            = "local-lvm"
    }
    "2" = {
      vm_id                        = 202
      target_node                  = var.proxmox_node
      node_name                    = "talos-master-02"
      clone_target                 = "talos-v1.7.5-cloud-init-template"
      node_cpu_cores               = "2"
      node_memory                  = 2048
      node_ipconfig                = "ip=192.168.0.172/24,gw=192.168.0.1"
      node_disk                    = "32" # in GB
      node_disk_format             = "raw"
      node_disk_storage            = "local-lvm"
    }
  }
  # Worker Node configuration
  vm_worker_nodes = {
    "0" = {
      vm_id                        = 300
      target_node                  = var.proxmox_node
      node_name                    = "talos-worker-00"
      clone_target                 = "talos-v1.7.5-cloud-init-template"
      node_cpu_cores               = "4"
      node_memory                  = 6144
      node_ipconfig                = "ip=192.168.0.180/24,gw=192.168.0.1"
      node_disk                    = "32"
      node_disk_format             = "raw"
      node_disk_storage            = "local-lvm"
      additional_node_disk         = "128" # for longhorn
      additional_node_disk_format  = "raw"
      additional_node_disk_storage = "local-lvm"
    }
    "1" = {
      vm_id                        = 301
      target_node                  = var.proxmox_node
      node_name                    = "talos-worker-01"
      clone_target                 = "talos-v1.7.5-cloud-init-template"
      node_cpu_cores               = "4"
      node_memory                  = 6144
      node_ipconfig                = "ip=192.168.0.181/24,gw=192.168.0.1"
      node_disk                    = "32"
      node_disk_format             = "raw"
      node_disk_storage            = "local-lvm"
      additional_node_disk         = "128" # for longhorn
      additional_node_disk_format  = "raw"
      additional_node_disk_storage = "local-lvm"
    }
    "2" = {
      vm_id                        = 302
      target_node                  = var.proxmox_node
      node_name                    = "talos-worker-02"
      clone_target                 = "talos-v1.7.5-cloud-init-template"
      node_cpu_cores               = "4"
      node_memory                  = 6144
      node_ipconfig                = "ip=192.168.0.182/24,gw=192.168.0.1"
      node_disk                    = "32"
      node_disk_format             = "raw"
      node_disk_storage            = "local-lvm"
      additional_node_disk         = "128" # for longhorn
      additional_node_disk_format  = "raw"
      additional_node_disk_storage = "local-lvm"
    }
  }
}