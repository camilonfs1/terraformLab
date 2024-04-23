provider "google" {
  project     = "<YOUR_PROJECT_ID>"
  region      = "us-central1" # Cambia según tu región preferida
}

resource "google_cloud_run_service" "my_service" {
  name     = "my-cloud-run-service"
  location = "us-central1" # Cambia según tu región preferida

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}

resource "google_sql_database_instance" "default" {
  name             = "my-cloud-sql-instance"
  database_version = "POSTGRES_13"
  region           = "us-central1" # Cambia según tu región preferida

  settings {
    tier             = "db-f1-micro" # Puedes cambiar la configuración según tus necesidades
    activation_policy = "ALWAYS"
    disk_size = 10 # Cambia según tus necesidades
    disk_autoresize = true
    disk_type = "PD_SSD"
    maintenance_window {
      day  = 1
      hour = 0
    }
  }
}