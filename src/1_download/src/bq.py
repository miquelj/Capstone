

def save_bq(df, table_id, project_id):
    import pandas
    import pandas_gbq

    print("save_bq")
    #df = df.astype(str)

    pandas_gbq.to_gbq(df, table_id, project_id=project_id , if_exists='append', verbose= True)




def save_df_bq(df, table_id):

    from google.cloud import bigquery


    project = 'ml-demo-384110' # Project ID inserted based on the query results selected to explore
    location = 'US' # Location inserted based on the query results selected to explore
    client = bigquery.Client(project=project, location=location)

    job_config = bigquery.LoadJobConfig(
    # Specify a (partial) schema. All columns are always written to the
    # table. The schema is used to assist in data type definitions.
    schema=[

bigquery.SchemaField("uri", "STRING")	,
bigquery.SchemaField("fr_text_embedding", bigquery.enums.SqlTypeNames.FLOAT, mode="REPEATED"),
bigquery.SchemaField("fr_statistics","STRING", mode="NULLABLE"),	
bigquery.SchemaField("fr_ml_embed_text_status",  "STRING", mode="NULLABLE"),			
bigquery.SchemaField("caption_fr", "STRING", mode="NULLABLE"),		
bigquery.SchemaField("en_text_embedding", bigquery.enums.SqlTypeNames.FLOAT, mode="REPEATED"),			
bigquery.SchemaField("en_statistics","STRING", mode="NULLABLE"),				
bigquery.SchemaField("en_ml_embed_text_status", "STRING", mode="NULLABLE"),			
bigquery.SchemaField("caption_en", "STRING", mode="NULLABLE"),			
bigquery.SchemaField("tr_text_embedding", bigquery.enums.SqlTypeNames.FLOAT, mode="REPEATED"),			
bigquery.SchemaField("tr_statistics","STRING", mode="NULLABLE"),			
bigquery.SchemaField("tr_ml_embed_text_status", "STRING", mode="NULLABLE"),			
bigquery.SchemaField("caption_fr_translated_en", "STRING", mode="NULLABLE"),	

bigquery.SchemaField("multi_embeddings_image", bigquery.enums.SqlTypeNames.FLOAT, mode="REPEATED"),			
bigquery.SchemaField("multi_embeddings_text_en", bigquery.enums.SqlTypeNames.FLOAT, mode="REPEATED"),			
bigquery.SchemaField("multi_embeddings_text_fr", bigquery.enums.SqlTypeNames.FLOAT, mode="REPEATED"),			
bigquery.SchemaField("multi_embeddings_text_fr_tr", bigquery.enums.SqlTypeNames.FLOAT, mode="REPEATED"),			


    ],
    # Optionally, set the write disposition. BigQuery appends loaded rows
    # to an existing table by default, but with WRITE_TRUNCATE write
    # disposition it replaces the table with the loaded data.
    #write_disposition="WRITE_TRUNCATE",
    
    )

    job = client.load_table_from_dataframe(
        df, table_id, job_config=job_config
    )  # Make an API request.
    job.result()  # Wait for the job to complete.


