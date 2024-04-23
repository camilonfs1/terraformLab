output "cloud_run_service_url" {
  value = google_cloud_run_service.my_service.status[0].url
}

output "cloud_sql_instance_ip_address" {
  value = google_sql_database_instance.default.ip_address
}