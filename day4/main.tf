module "gcp_resources" {
  source         = "./modules/gcp_resources"
  project_id     = var.project_id
  region         = var.region
  zone           = var.zone
  bucket_name    = var.bucket_name
  instance_name  = var.instance_name
  machine_type   = var.machine_type
}


