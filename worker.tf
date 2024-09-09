resource "proxmox_vm_qemu" "workers" {

    count = var.worker_nr
    
    # VM General Settings
    target_node = var.target_node
    #vmid = var.worker_id_range + count.index + 1
    name = format("%s-${count.index + 1}", var.worker_naming)
    full_clone = true

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu20"

    # VM System Settings
    agent = 1

   
    # VM CPU Settings
    cores = var.worker_cores
    sockets = var.worker_sockets

 
 

    # VM Memory Settings
    memory = var.worker_memory
    balloon = var.worker_memory

    bootdisk = "virtio0"
    scsihw = "virtio-scsi-pci"


    cpu = "kvm64"
    numa = true
    hotplug = "network,disk,cpu,memory"
    os_type = "cloud-init"
    # Setup the disk
    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = var.worker_disksize
                    cache           = "writeback"
                    storage         = "local-lvm"
                    #storage_type    = "rbd"
                    iothread        = true
                    discard         = true
                }
            }
        }
    }


 # VM Network Settings
    network {
      bridge = var.bridge_network
      model  = "virtio"
      #firewall = true
    }

    # Cloud-Init
    ciuser = var.ciuser
    sshkeys = var.ssh_keys
    ipconfig0 = "ip=${cidrhost(var.bridge_cidr_range, var.worker_network_range + count.index)}/24,gw=${cidrhost(var.bridge_cidr_range, 1)}"


    tags = "workers"

}