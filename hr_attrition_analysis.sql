-- Total Employees & Attrition Rate

SELECT 
  COUNT(*) AS Total_Employees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition;


 -- Attrition by Department

SELECT 
  Department,
  COUNT(*) AS Total,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Percent
FROM hr_attrition
GROUP BY Department
ORDER BY Attrition_Percent DESC;


-- Attrition by Age Group

SELECT 
  CASE 
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    ELSE '45+' 
  END AS Age_Group,
  COUNT(*) AS Total,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Percent
FROM hr_attrition
GROUP BY Age_Group
ORDER BY Attrition_Percent DESC;


-- Attrition by Salary Band

SELECT 
  CASE 
    WHEN MonthlyIncome < 3000 THEN 'Below 3K'
    WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN '3K-6K'
    WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN '6K-10K'
    ELSE 'Above 10K' 
  END AS Salary_Band,
  COUNT(*) AS Total,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Percent
FROM hr_attrition
GROUP BY Salary_Band
ORDER BY Attrition_Percent DESC;


-- Attrition by Job Role

SELECT 
  JobRole,
  COUNT(*) AS Total,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Percent
FROM hr_attrition
GROUP BY JobRole
ORDER BY Attrition_Percent DESC;