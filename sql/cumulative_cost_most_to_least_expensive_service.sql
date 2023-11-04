SELECT line_item_product_code, sum(line_item_blended_cost) AS cost, month
FROM cost_usage_report_for_athena
GROUP BY line_item_product_code, month
HAVING sum(line_item_blended_cost) > 0
ORDER BY cost DESC;
