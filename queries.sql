-- Query 1: Highest Charge Procedures Nationally
SELECT
  drg_definition,
  AVG(average_covered_charges) AS avg_charge
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
GROUP BY drg_definition
ORDER BY avg_charge DESC;

-- Query 2: Charge vs Payment Gap by State
SELECT
  provider_state,
  AVG(average_covered_charges) - AVG(average_total_payments) AS payment_gap
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
GROUP BY provider_state
ORDER BY payment_gap DESC;

-- Query 3: Hospital vs National Average by Procedure
WITH natl_avg AS (
  SELECT 
    AVG(average_covered_charges) AS natl_charge,
    drg_definition
  FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
  GROUP BY drg_definition
),
hospital_avg AS (
  SELECT 
    AVG(average_covered_charges) AS avg_charge,
    drg_definition,
    provider_name
  FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
  GROUP BY provider_name, drg_definition
)
SELECT 
  h.drg_definition,
  h.provider_name,
  h.avg_charge,
  n.natl_charge,
  h.avg_charge - n.natl_charge AS charge_vs_national
FROM natl_avg n 
JOIN hospital_avg h ON n.drg_definition = h.drg_definition
ORDER BY charge_vs_national DESC;
