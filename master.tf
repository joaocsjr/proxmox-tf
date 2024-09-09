resource "proxmox_vm_qemu" "masters" {

    count = var.master_nr
    
    # VM General Settings
    target_node = var.target_node
    #vmid = var.master_id_range + count.index + 1
    name = format("%s-${count.index + 1}", var.master_naming)
    full_clone = true

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu20"

    # VM System Settings
    agent = 1 
    
    # VM CPU Settings
    cores = var.master_cores
    sockets = var.master_sockets
    
    # VM Memory Settings
    memory = var.master_memory
    balloon = var.master_memory
   
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
                    size            = var.master_disksize
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
    }







    # Cloud-Init
    # Needed for correct state of Terraform
    ciuser = var.ciuser
    sshkeys = var.ssh_keys
    boot = "order=virtio0"
    ipconfig0 = "ip=${cidrhost(var.bridge_cidr_range, var.master_network_range + count.index)}/24,gw=${cidrhost(var.bridge_cidr_range, 1)}"
  


   

    tags = "masters"

}