resource "google_compute_network" "vpc" {
    name = var.vpc_nam
    auto_create_subnetworks = true
   
  
}

resource "google_compute_firewall" "allow_http" {
    name = "allow-http"
    network = google_compute_network.vpc.self_link
    source_ranges = ["0.0.0.0/0"]

    allowed {
        protocol = ["tcp", "udp", "http"]   
        ports = [80]
    }

    target_tags = ["http-server"]
  
}

output "vpc-op" {
    value = "${google_compute_network.vpc.name}"
  
}

output "name-op" {
    value = "${google_compute_firewall.allow_http.target_tags[0]}"
  
}
  
