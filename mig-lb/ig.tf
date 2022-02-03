/*
resource "google_compute_instance_template" "template" {
    name = "p-n-1"
    machine_type = "n1-standard-1"
    #zone = "us-central1-a"
  

    disk {
        source_image = "debian-8-jessie-v20160803"
        auto_delete = true
        boot = true
    }

    network_interface {
        network = "default"
    }

    metadata_startup_script = file("startup.sh")
    tags = ["web","http-server"]
  
}


resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/"
    port         = "80"
  }
}

resource "google_compute_instance_group_manager" "appserver" {
  name = "appserver-igm"

  base_instance_name = "app"
  zone               = "us-central1-a"

  version {
    instance_template  = "${google_compute_instance_template.template.self_link}"
  }

  #target_pools = [google_compute_target_pool.appserver.id]
  target_size  = 2

  /*named_port {
    name = "custom-HTTP"
    port = 80
  }
 

  auto_healing_policies {
    health_check      = "${google_compute_health_check.autohealing.self_link}"
    initial_delay_sec = 300
  }
}



resource "google_compute_firewall" "ig-http" {
    name = "allow-http-ig"
    network = "default"
   

    allow {
   protocol = "icmp"
    }

    allow{
        protocol = "tcp"
        ports = [ "80","443","8080","1000-4000"]
    }

    source_ranges = [ "0.0.0.0/0" ]
    target_tags = ["web"]
  
}

*/