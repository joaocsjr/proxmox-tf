# Global parameters
target_node = "cayenne"
bridge_network = "vmbr0"
bridge_cidr_range = "192.168.15.0/24"
ciuser = "ubuntu"
ssh_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnorn2vfTArzIk0LCva8azZP2+bYhixhLm9cekJOm9cNNM/EnRDmaQ+DWmru2BhPAy3ZcXzBiCPuqine7So4S5DIBg4lp9bqHp3BxR/XqLDeDWdNrOTEzJXnhGrc4RJ/wYTXMIIPm0VhDH0D4ozlGrmtoM2kQypVX1binHR+GBI5ZkBiqoBCtcx+Jm0xYus55wZpmZcZzLde94R3fTMc6uyWgMU+/4B3yxiVzpzogfIikQMGiHYAFmPLiuPrUACJhpnGiDerk2CzYYDHfa7LHy8eaMy32CizapmR0zhqevsXxlZPTKQO73uQ2ZFq75blfk9Xnt9+Q1Kbymof5Y6ONmgyu057BWDOR0QfnSYAjf7CkYUVfMw/LXUwVnxKcl96JPOUxgldsJrCluCL3NZIABDVl9G4OmA6+OKgec+C8cYWqMeMqpGVuViaevNZ2l61ArXHewCyVJrN01Ji0NhBqMod7xbN1t1sUmyW3+XdmakF9bdEXVedsrGKqzZLAB9HE= root@taycan"

# Control plane nodes parameters
master_nr = 1
master_id_range = 240
master_network_range = 241 # It will be used as X.X.X.100, X.X.X.101...
master_naming = "master"
master_cores = 4
master_sockets = 1
master_memory = 4096
master_disksize = "50G"

# Worker nodes parameters
worker_nr = 2
worker_id_range = 500
worker_network_range = 231 # It will be used as X.X.X.200, X.X.X.201...
worker_naming = "worker"
worker_cores = 2
worker_sockets = 1
worker_memory = 8192
worker_disksize = "100G"