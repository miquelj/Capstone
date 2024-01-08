CREATE OR REPLACE EXTERNAL TABLE `immo_raw.immo_images_files`
WITH CONNECTION `eu.conn_cloud_ai`
OPTIONS (
    object_metadata="DIRECTORY",
    uris = ['gs://ml-demo-us-central1/automl_dataset_immo/*.jpg',
            'gs://ml-demo-us-central1/automl_dataset_immo/*.jpeg'],
    max_staleness=INTERVAL 30 MINUTE, 
    metadata_cache_mode="AUTOMATIC"    
    ); 

