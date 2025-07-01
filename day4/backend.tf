terraform {
  backend "gcs" {
    bucket  = "my-bucket1"   # Replace with your actual bucket name
    prefix  = "terraform/state"
  }
}