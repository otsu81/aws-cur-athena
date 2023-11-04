SELECT account, sum(line_item_unblended_cost) AS total_cost
FROM cost_usage_report_for_athena
GROUP BY account
ORDER BY total_cost DESC
