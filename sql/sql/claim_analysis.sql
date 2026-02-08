-- 1. Total number of claims by status
SELECT 
    Claim_Status,
    COUNT(*) AS Total_Claims
FROM insurance_claims
GROUP BY Claim_Status;

-- 2. Average claim amount by claim type
SELECT 
    Claim_Type,
    ROUND(AVG(Claim_Amount), 2) AS Avg_Claim_Amount
FROM insurance_claims
GROUP BY Claim_Type
ORDER BY Avg_Claim_Amount DESC;

-- 3. Claim approval rate
SELECT
    COUNT(CASE WHEN Claim_Status = 'Approved' THEN 1 END) * 100.0 / COUNT(*) 
    AS Approval_Rate_Percentage
FROM insurance_claims;

-- 4. Fraud vs Non-Fraud claim comparison
SELECT
    Fraud_Flag,
    COUNT(*) AS Total_Claims,
    ROUND(AVG(Claim_Amount), 2) AS Avg_Claim_Amount
FROM insurance_claims
GROUP BY Fraud_Flag;

-- 5. Average settlement time in days
SELECT
    ROUND(AVG(DATEDIFF(day, Claim_Date, Settlement_Date)), 2) 
    AS Avg_Settlement_Days
FROM insurance_claims;
