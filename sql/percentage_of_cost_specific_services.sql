SELECT
  (
    SELECT SUM(line_item_unblended_cost)
    FROM cost_usage_report_for_athena
    WHERE product_servicecode IN ('AWSConfig', 'AWSSecurityHub', 'AmazonInspectorV2', 'AmazonGuardDuty')
  )
  /
  (
    SELECT SUM(line_item_unblended_cost)
    FROM cost_usage_report_for_athena
  )
  * 100 AS percentage_cost;
