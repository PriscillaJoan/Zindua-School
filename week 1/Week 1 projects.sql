-- Use the village schema
USE village;

-- Create the District_summary view
CREATE  VIEW District_summary AS
WITH beneficiary_totals AS (
    SELECT 
        j.region_name,
        j.level_name AS district_name,
        SUM(CASE 
            WHEN b.beneficiary_type = 'Individuals' THEN b.beneficiaries
            WHEN b.beneficiary_type = 'Households' THEN b.beneficiaries * 6
        END) AS total_beneficiaries
    FROM beneficiary_partner_data b
    JOIN jurisdiction_hierarchy j ON b.village = j.level_name
    WHERE j.level = 'Village'
    GROUP BY j.region_name, j.level_name
),
district_population AS (
    SELECT 
        j.region_name,
        j.level_name AS district_name,
        SUM(v.total_population) AS total_population
    FROM village_locations v
    JOIN jurisdiction_hierarchy j ON v.village = j.level_name
    WHERE j.level = 'Village'
    GROUP BY j.region_name, j.level_name
)
SELECT 
    tb.district_name AS "District Name",
    tb.region_name AS "Region Name",
    tb.total_beneficiaries AS "No. of Individual Beneficiaries",
    ROUND(tb.total_beneficiaries * 1.0 / dp.total_population, 4) AS "No. of Individual Beneficiaries / Total District Population"
FROM beneficiary_totals tb
JOIN district_population dp ON tb.district_name = dp.district_name AND tb.region_name = dp.region_name;

-- Display the results
SELECT * FROM District_summary;

-- PARTNER SUMMARY
USE village;

-- Create the Partner_summary view
CREATE OR REPLACE VIEW Partner_summary AS
WITH partner_reach AS (
    SELECT DISTINCT
        b.partner,
        b.village,
        j_district.level_name AS district
    FROM beneficiary_partner_data b
    JOIN jurisdiction_hierarchy j_village ON b.village = j_village.level_name AND j_village.level = 'Village'
    JOIN jurisdiction_hierarchy j_district ON j_village.region_name = j_district.level_name AND j_district.level = 'District'
)
SELECT 
    partner AS "Partner Name",
    COUNT(DISTINCT village) AS "No. of Villages reached by partner",
    COUNT(DISTINCT district) AS "No. of Districts reached by partner"
FROM partner_reach
GROUP BY partner
ORDER BY partner;

-- Display the results
SELECT * FROM Partner_summary;