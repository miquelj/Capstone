
resource "google_bigquery_job" "job_create_raw_table" {
  job_id     = "job_create_raw_table4"
    project = var.project_id

  labels = {
    env : var.env
  }

  query {
    query = <<EOF


 CREATE OR REPLACE EXTERNAL TABLE `${google_bigquery_dataset.dataset_0.project}.${google_bigquery_dataset.dataset_0.dataset_id}.immo_images_files` 
 WITH CONNECTION `${google_bigquery_dataset.dataset_0.project}.${var.location}.${google_bigquery_connection.connection.connection_id}` 
 OPTIONS (    
    object_metadata="DIRECTORY",    
    uris = ['gs://${google_storage_bucket.static.name}/*.jpg',
            'gs://${google_storage_bucket.static.name}/*.jpeg'],
    max_staleness=INTERVAL 30 MINUTE, 
    metadata_cache_mode="AUTOMATIC"    
    ); 
EOF    
    
#SELECT column1, column2 FROM `${google_bigquery_dataset.dataset_0.project}.${google_bigquery_dataset.dataset_0.dataset_id}.example_table`

    default_dataset {
      dataset_id = google_bigquery_dataset.dataset_0.id
    }

    allow_large_results = true
    flatten_results = true

  }
}


 