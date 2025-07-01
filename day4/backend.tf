terraform {
  backend "gcs" {
    bucket  = "my-bucket1"
    prefix  = "terraform/state"
  }
}