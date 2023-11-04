WITH DailyCost AS (
  SELECT DATE(line_item_usage_start_date) AS usage_date, account,
    SUM(line_item_unblended_cost) AS daily_cost
  FROM cost_usage_report_for_athena
  WHERE line_item_line_item_type != 'Tax'
  GROUP BY DATE(line_item_usage_start_date), account
),
AverageCost AS (
  SELECT account, AVG(daily_cost) AS avg_daily_cost
  FROM DailyCost
  GROUP BY account
)
SELECT d.usage_date, d.account, d.daily_cost
FROM DailyCost d
JOIN AverageCost a ON d.account = a.account
WHERE d.daily_cost > a.avg_daily_cost
ORDER BY d.daily_cost DESC;
