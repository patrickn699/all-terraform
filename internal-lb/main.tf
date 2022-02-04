provider "google" {
    project = "qwiklabs-gcp-04-da24fbd94c38"
    region  = "us-central1"
    credentials = file("lb-key.json")
    
  
}

