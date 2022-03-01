provider "google" {
    project = "qwiklabs-gcp-03-e36d8ff06bc8"
    region  = "us-central1"

  
}


module "vpc" {
    source = "./vpc"
}

module "instance" {
    vpc-nm = "${module.vpc.vpc-op}"
    tag-nm = "${module.vpc.name-op}"
    source = "./gcp-instances"
  
}