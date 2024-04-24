output "cloud_run_service_url" {
  value = google_cloud_run_service.isbn-users-ms.status[0].url
}

output "cloud_sql_instance_ip_address" {
  value = google_sql_database_instance.isbn-users-db.ip_address
}