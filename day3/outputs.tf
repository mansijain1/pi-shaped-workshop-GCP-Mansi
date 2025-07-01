output "vm_public_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  description = "Public IP of the VM instance"
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.storage_bucket.name}"
  description = "URL of the GCS bucket"
}
