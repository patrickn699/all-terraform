resource "google_compute_instance" "compute-engine" {

    name = var.instance_nm
    machine_type = "n1-standard-1"
    zone = var.zone

    network_interface {
        network = var.vpc-nm
        access_config {
            
            
        }
    }

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
            size = 10
        }
    }

    tags = [ "var.tag-nm" ]

    metadata_startup_script = file("metadata-startup-script.sh")
    
  
}


