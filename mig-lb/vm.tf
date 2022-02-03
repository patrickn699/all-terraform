resource "google_compute_instance" "vm-1" {
    name = "apache-instance"
    machine_type = "n1-standard-1"
    zone = "us-central1-a"
    tags = ["web","http-server"]

    boot_disk {
        initialize_params {
            image = "debian-8-jessie-v20160803"
        }
    }

    metadata_startup_script = file("startup.sh")

    network_interface {
        network = "default"
        access_config {
            # The IP address of the VM's external NAT interface.
            
        }
    }

    
  
}

resource "google_compute_firewall" "allow-http" {
    name = "allow-http"
    network = "default"
   

    allow {
   protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports = [ "80","443","8080","1000-4000"]
    }

    source_ranges = [ "0.0.0.0/0" ]
    target_tags = ["web"]
  
}

output "eip" {
    value = "google_compute_instance.vm-1.network_interface[0].access_config[0].nat_ip"
  
}