provider "google" {
    #project_id = "qwiklabs-gcp-00-c0987005e59c"
    region     = "us-central1"
    zone       = "us-central1-a"
    credentials = file("key.json")
    alias = "gogle"

}

resource "google_container_cluster" "gke" {
    name = "tf-gke-cluster"
    location = "us-central1-a"
    initial_node_count = 1
    node_config {
        machine_type = "n1-standard-1"
    }
    
    #logging_service = "logging.googleapis.com"
    #monitoring_service = "monitoring.googleapis.com"
    network = "default"

    

  
}