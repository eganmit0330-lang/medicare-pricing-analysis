# Medicare Hospital Pricing Analysis

Analysis of U.S. hospital pricing using CMS Medicare inpatient charges data 
from Google BigQuery public datasets.

## Business Questions
1. Which medical procedures have the highest average charges nationally?
2. Which states have the largest gap between what hospitals charge vs what gets paid?
3. Which hospitals charge the most above the national average for the same procedure?

## Key Findings
- ECMO and heart transplant procedures carry the highest national average charges
- California has the largest gap between billed charges and actual payments
- Stanford Medical Center charges significantly above the national average for ECMO procedures

## Business Recommendations
- Insurers should benchmark reimbursement rates against national procedure averages
- State-level billing gap analysis can inform Medicare policy and premium pricing
- Hospital outlier identification enables fairer contract negotiations between payers and providers

## Tools
- Google BigQuery (SQL)
- Tableau Public

## Visualizations
https://public.tableau.com/views/MedicareHospitalPricingAnalysis/Dashboard1

## About
Data source: bigquery-public-data.cms_medicare.inpatient_charges_2014
