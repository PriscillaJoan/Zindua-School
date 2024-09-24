use stud_db;
-- a. Using JOIN get the student names, school id, email, phone number (new_stud_details)

CREATE TABLE new_stud_details AS
SELECT 
    p.stud_name, 
    s.stud_ID, 
    s.stud_email, 
    p.phone_number
FROM 
    personal_details p
JOIN 
    school_details s ON p.stud_ID = s.stud_ID;

-- b. Create a table with all the details from contacts to school and financial details (full_stud_details)
CREATE TABLE full_stud_details AS
SELECT 
    p.stud_name, 
    s.stud_ID, 
    s.stud_email, 
    c.phone_number, 
    f.sem_fee, 
    f.fee_paid
FROM 
    personal_details p
JOIN 
    school_details s ON p.stud_ID = s.stud_ID
JOIN 
    contact_details c ON c.stud_email = s.stud_email
JOIN 
    financial_details f ON f.stud_ID = p.stud_ID;

-- c. Add student names on any empty row of stud_name in financial_details

SET SQL_SAFE_UPDATES = 0;

UPDATE financial_details fd
JOIN personal_details pd ON fd.stud_ID = pd.stud_ID
SET fd.stud_name = pd.stud_name
WHERE fd.stud_name IS NULL;

-- d. On the financial_details table add a column, fee_cleared, that has True if student has cleared current fee and False if not (financial_details_view)
ALTER TABLE financial_details
ADD COLUMN fee_cleared BOOLEAN;

UPDATE financial_details
SET fee_cleared = (fee_paid >= sem_fee);

-- e. Get the national ID and name of all students who have cleared their fees (fee_cleared)
SELECT p.national_ID, p.stud_name
FROM personal_details p
JOIN financial_details f ON p.stud_ID = f.stud_ID
WHERE f.fee_cleared = TRUE;

-- f. Get the total sum of fees paid so far and the total current deficit (total_fee_balance)
SELECT 
SUM(fee_paid) AS total_fees_paid,
SUM(sem_fee - fee_paid) AS total_deficit
FROM financial_details;

-- g. Get the count of students who share a current home county i.e., Say Nairobi, get the number of students who’s current_home_county is Nairobi, and so on for all available counties (home_county_count)
SELECT 
current_home_county, 
COUNT(stud_ID) AS student_count
FROM school_details
GROUP BY current_home_county;

-- h. Get the count of Male and/or Female students from each secondary_school_county (secondary_school_count). The table should contain a column for male student count and female student count for each county.
SELECT 
s.secondary_school_county, 
SUM(CASE WHEN p.gender = 'Male' THEN 1 ELSE 0 END) AS male_count,
SUM(CASE WHEN p.gender = 'Female' THEN 1 ELSE 0 END) AS female_count
FROM school_details s
JOIN personal_details p ON s.stud_ID = p.stud_ID
GROUP BY s.secondary_school_county;

-- i. Get the percentage of students who set their next_of_kin as Mother vs those that set it as Father1. (kin_percentage) 
SELECT 
SUM(CASE WHEN next_of_kin_relation = 'Mother' THEN 1 ELSE 0 END) AS mother_count,
SUM(CASE WHEN next_of_kin_relation = 'Father' THEN 1 ELSE 0 END) AS father_count,
ROUND(SUM(CASE WHEN next_of_kin_relation = 'Mother' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS mother_percentage,
ROUND(SUM(CASE WHEN next_of_kin_relation = 'Father' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS father_percentage
FROM contact_details;