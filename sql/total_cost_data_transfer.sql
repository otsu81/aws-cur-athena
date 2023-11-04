SELECT SUM(line_item_unblended_cost) AS cost, product_from_region_code
FROM cost_usage_report_for_athena
WHERE product_servicecode = 'AWSDataTransfer'
GROUP BY product_from_region_code
ORDER BY cost DESC
