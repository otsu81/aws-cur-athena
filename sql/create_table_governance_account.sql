CREATE EXTERNAL TABLE CostUsageReportForAthena.cost_usage_report_for_athena(
  identity_line_item_id STRING,
  identity_time_interval STRING,
  bill_payer_account_id STRING,
  bill_billing_period_start_date TIMESTAMP,
  bill_billing_period_end_date TIMESTAMP,
  line_item_usage_account_id STRING,
  line_item_usage_start_date TIMESTAMP,
  line_item_usage_end_date TIMESTAMP,
  line_item_product_code STRING,
  line_item_line_item_type STRING,
  line_item_usage_type STRING,
  line_item_currency_code STRING,
  line_item_unblended_rate STRING,
  line_item_unblended_cost DOUBLE,
  line_item_blended_rate STRING,
  line_item_blended_cost DOUBLE,
  line_item_line_item_description STRING,
  product_description STRING,
  product_free_overage STRING,
  product_free_query_types STRING,
  product_free_tier STRING,
  product_free_usage_included STRING,
  product_frequency_mode STRING,
  product_from_location STRING,
  product_from_location_type STRING,
  product_from_region_code STRING,
  product_instance_family STRING,
  product_instance_name STRING,
  product_instance_type STRING,
  product_instance_type_family STRING,
  product_invocation STRING,
  product_product_family STRING,
  product_region STRING,
  product_servicecode STRING,
  product_servicename STRING,
  product_sku STRING
)

PARTITIONED BY (
  account STRING,
  year STRING,
  month STRING
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
WITH  SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://cost-usage-reports-aggregated/curs/'
