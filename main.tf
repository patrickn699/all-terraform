provider "google" {
    project = "qwiklabs-gcp-04-06d3924285ae"
    credentials = file("key.json")
    region = "us-central1"
    zone = "us-central1-a"
  
}

resource "google_compute_instance" "by-terraform-1" {
    name = "made-by-teerafrom-instance"
    machine_type = "f1-micro"
    zone = "us-central1-a"
    can_ip_forward = false
    tags = ["allow-http"]
    

    boot_disk {
        initialize_params {
            image = "debian-8-jessie-v20160803"
            
        }
    
       
    }
    
    metadata_startup_script = file("startup.sh")
    network_interface {
        network = "default"
               
        }      
}
    
resource "google_compute_firewall" "myfire" {

    name = "allow-http"
    description = "Allow access to port 8080"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["80", "8080"]
    }

    priority = 1000
    target_tags = ["allow-http"]
    source_tags = ["allow-http"]
    

}


output "public_ip" {
    value = google_compute_instance.by-terraform-1.network_interface[0]
}
  
