provider "google" {
  project     = var.project_id
  region      = "us-central1" # Cambia según tu región preferida
}

resource "google_cloud_run_service" "isbn-users-ms" {
  name     = "isbn-users-ms"
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
  name             = "isbn-users-db"
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