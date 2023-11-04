SELECT line_item_usage_account_id, SUM(line_item_unblended_cost) AS cost
FROM cost_usage_report_for_athena
GROUP BY line_item_usage_account_id
ORDER BY cost DESC
