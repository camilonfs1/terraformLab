provider "google" {
  project     = var.project_id
  region      = var.region
}

resource "google_cloud_run_service" "isbn-users-ms" {
  name     = "isbn-users-ms"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}

resource "google_sql_database_instance" "isbn-users-db" {
  name             = "isbn-users-db"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier             = "db-f1-micro" # Puedes cambiar la configuración según tus necesidades
    activation_policy = "ALWAYS" #  This specifies when the instance should be active. Can be either ALWAYS, NEVER or ON_DEMAND
    disk_size = 10 # The size of data disk, in GB
    disk_type = "PD_SSD" # (Optional) The type of data disk: PD_SSD or PD_HDD
  }
}