resource "google_bigquery_dataset" "dataset_0" {
  dataset_id                  = "immo_0_raw"
  friendly_name               = "immo_0_raw"
  description                 = "raw dataset of real-estate property"
  location                    = var.location
  project = var.project_id
  
  labels = {
    env = var.env
    stage = "raw",
    stage_number = "0",

  }
}

resource "google_bigquery_dataset" "dataset_1" {
  dataset_id                  = "immo_1_central_model"
  friendly_name               = "immo_1_central_model"
  description                 = "dataset enriched central model of real-estate property"
    location                    = var.location
  project = var.project_id
  
  labels = {
    env = var.env,
    stage = "central_model",
    stage_number = "1",
  }
}

resource "google_bigquery_dataset" "dataset_2" {
  dataset_id                  = "immo_2_data_marts"
  friendly_name               = "immo_2_data_marts"
  description                 = "dataset data marts of real-estate property"
    location                    = var.location
  project = var.project_id
  
  labels = {
    env = var.env,
    stage = "data_marts",
    stage_number = "2",
  }
}