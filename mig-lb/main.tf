provider "google" {
    project = "qwiklabs-gcp-03-ad9ffc113b5c"
    region  = "us-central1"
    credentials = file("lb-key.json")
    
  
}

