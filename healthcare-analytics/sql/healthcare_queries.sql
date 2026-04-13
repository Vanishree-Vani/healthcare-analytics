-- ============================================================
-- HEALTHCARE ANALYTICS - SQL QUERIES
-- Project: Healthcare Data Analysis
-- Author: Data Analyst Portfolio Project
-- Database: MySQL / SQL Server / PostgreSQL compatible
-- ============================================================

-- ============================================================
-- SECTION 1: TABLE CREATION
-- ============================================================

CREATE TABLE patients (
    PatientID       VARCHAR(10) PRIMARY KEY,
    Name            VARCHAR(100),
    Age             INT,
    Gender          VARCHAR(10),
    BloodGroup      VARCHAR(5),
    Department      VARCHAR(50),
    AdmissionDate   DATE,
    DischargeDate   DATE,
    DiagnosisCode   VARCHAR(10),
    Diagnosis       VARCHAR(100),
    DoctorName      VARCHAR(50),
    TreatmentCost   DECIMAL(10,2),
    InsuranceCovered DECIMAL(10,2),
    OutOfPocket     DECIMAL(10,2),
    PaymentStatus   VARCHAR(20),
    HospitalStayDays INT,
    Readmission     VARCHAR(5),
    Satisfaction    INT
);

CREATE TABLE doctors (
    DoctorID            VARCHAR(10) PRIMARY KEY,
    DoctorName          VARCHAR(50),
    Department          VARCHAR(50),
    Specialization      VARCHAR(100),
    Experience_Years    INT,
    Qualification       VARCHAR(50),
    PatientsHandled     INT,
    AvgRating           DECIMAL(3,1),
    Consultations_2024  INT
);

-- ============================================================
-- SECTION 2: BASIC EXPLORATORY QUERIES
-- ============================================================

-- 2.1 Total number of patients
SELECT COUNT(*) AS TotalPatients FROM patients;

-- 2.2 Patient count by department
SELECT 
    Department,
    COUNT(*) AS PatientCount
FROM patients
GROUP BY Department
ORDER BY PatientCount DESC;

-- 2.3 Patient count by gender
SELECT 
    Gender,
    COUNT(*) AS Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 2) AS Percentage
FROM patients
GROUP BY Gender;

-- 2.4 Age group distribution
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 45 THEN '31-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+' 
    END AS AgeGroup,
    COUNT(*) AS PatientCount
FROM patients
GROUP BY AgeGroup
ORDER BY PatientCount DESC;

-- ============================================================
-- SECTION 3: FINANCIAL ANALYSIS
-- ============================================================

-- 3.1 Total revenue by department
SELECT 
    Department,
    COUNT(*) AS Patients,
    SUM(TreatmentCost) AS TotalRevenue,
    ROUND(AVG(TreatmentCost), 2) AS AvgTreatmentCost,
    SUM(InsuranceCovered) AS TotalInsuranceClaimed,
    SUM(OutOfPocket) AS TotalOutOfPocket
FROM patients
GROUP BY Department
ORDER BY TotalRevenue DESC;

-- 3.2 Insurance coverage ratio by department
SELECT 
    Department,
    ROUND(SUM(InsuranceCovered) * 100.0 / SUM(TreatmentCost), 2) AS InsuranceCoveragePercent,
    ROUND(SUM(OutOfPocket) * 100.0 / SUM(TreatmentCost), 2) AS OutOfPocketPercent
FROM patients
GROUP BY Department
ORDER BY InsuranceCoveragePercent DESC;

-- 3.3 Pending payments report
SELECT 
    PatientID,
    Name,
    Department,
    TreatmentCost,
    OutOfPocket,
    PaymentStatus,
    AdmissionDate
FROM patients
WHERE PaymentStatus = 'Pending'
ORDER BY TreatmentCost DESC;

-- 3.4 Total outstanding payments
SELECT 
    COUNT(*) AS PendingPatients,
    SUM(OutOfPocket) AS TotalPendingAmount
FROM patients
WHERE PaymentStatus = 'Pending';

-- 3.5 Revenue by month
SELECT 
    YEAR(AdmissionDate) AS Year,
    MONTH(AdmissionDate) AS Month,
    COUNT(*) AS Admissions,
    SUM(TreatmentCost) AS TotalRevenue
FROM patients
GROUP BY YEAR(AdmissionDate), MONTH(AdmissionDate)
ORDER BY Year, Month;

-- ============================================================
-- SECTION 4: CLINICAL PERFORMANCE ANALYSIS
-- ============================================================

-- 4.1 Readmission rate by department
SELECT 
    Department,
    COUNT(*) AS TotalPatients,
    SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END) AS Readmissions,
    ROUND(SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ReadmissionRate
FROM patients
GROUP BY Department
ORDER BY ReadmissionRate DESC;

-- 4.2 Average hospital stay by department
SELECT 
    Department,
    ROUND(AVG(HospitalStayDays), 2) AS AvgStayDays,
    MIN(HospitalStayDays) AS MinStay,
    MAX(HospitalStayDays) AS MaxStay
FROM patients
GROUP BY Department
ORDER BY AvgStayDays DESC;

-- 4.3 Patient satisfaction by department
SELECT 
    Department,
    ROUND(AVG(Satisfaction), 2) AS AvgSatisfaction,
    COUNT(CASE WHEN Satisfaction = 5 THEN 1 END) AS Excellent,
    COUNT(CASE WHEN Satisfaction = 4 THEN 1 END) AS Good,
    COUNT(CASE WHEN Satisfaction = 3 THEN 1 END) AS Average,
    COUNT(CASE WHEN Satisfaction <= 2 THEN 1 END) AS Poor
FROM patients
GROUP BY Department
ORDER BY AvgSatisfaction DESC;

-- 4.4 Most common diagnoses
SELECT 
    Diagnosis,
    DiagnosisCode,
    COUNT(*) AS CaseCount,
    ROUND(AVG(TreatmentCost), 2) AS AvgCost,
    ROUND(AVG(HospitalStayDays), 1) AS AvgStayDays
FROM patients
GROUP BY Diagnosis, DiagnosisCode
ORDER BY CaseCount DESC
LIMIT 10;

-- ============================================================
-- SECTION 5: DOCTOR PERFORMANCE
-- ============================================================

-- 5.1 Patient load per doctor
SELECT 
    p.DoctorName,
    d.Department,
    d.Experience_Years,
    COUNT(p.PatientID) AS PatientsHandled,
    ROUND(AVG(p.TreatmentCost), 2) AS AvgTreatmentCost,
    ROUND(AVG(p.Satisfaction), 2) AS AvgPatientSatisfaction,
    ROUND(AVG(p.HospitalStayDays), 2) AS AvgStayDays
FROM patients p
JOIN doctors d ON p.DoctorName = d.DoctorName
GROUP BY p.DoctorName, d.Department, d.Experience_Years
ORDER BY PatientsHandled DESC;

-- 5.2 Doctor readmission rates
SELECT 
    p.DoctorName,
    COUNT(*) AS TotalPatients,
    SUM(CASE WHEN p.Readmission = 'Yes' THEN 1 ELSE 0 END) AS ReadmittedPatients,
    ROUND(SUM(CASE WHEN p.Readmission = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ReadmissionRate
FROM patients p
GROUP BY p.DoctorName
ORDER BY ReadmissionRate;

-- 5.3 Revenue generated per doctor
SELECT 
    DoctorName,
    Department,
    COUNT(*) AS Patients,
    SUM(TreatmentCost) AS TotalRevenue,
    ROUND(AVG(TreatmentCost), 2) AS AvgRevenuePerPatient
FROM patients
GROUP BY DoctorName, Department
ORDER BY TotalRevenue DESC;

-- ============================================================
-- SECTION 6: ADVANCED ANALYTICS
-- ============================================================

-- 6.1 Identify high-risk patients (long stay + readmission)
SELECT 
    PatientID,
    Name,
    Age,
    Department,
    Diagnosis,
    HospitalStayDays,
    Readmission,
    TreatmentCost,
    Satisfaction
FROM patients
WHERE HospitalStayDays > 7 AND Readmission = 'Yes'
ORDER BY TreatmentCost DESC;

-- 6.2 Department-wise cost vs satisfaction correlation
SELECT 
    Department,
    ROUND(AVG(TreatmentCost), 0) AS AvgCost,
    ROUND(AVG(Satisfaction), 2) AS AvgSatisfaction,
    COUNT(*) AS PatientCount,
    ROUND(AVG(HospitalStayDays), 1) AS AvgStayDays
FROM patients
GROUP BY Department
ORDER BY AvgCost DESC;

-- 6.3 Monthly trends - Admissions and Revenue
SELECT 
    DATE_FORMAT(AdmissionDate, '%Y-%m') AS YearMonth,
    COUNT(*) AS TotalAdmissions,
    SUM(TreatmentCost) AS TotalRevenue,
    ROUND(AVG(Satisfaction), 2) AS AvgSatisfaction,
    SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END) AS Readmissions
FROM patients
GROUP BY DATE_FORMAT(AdmissionDate, '%Y-%m')
ORDER BY YearMonth;

-- 6.4 Blood group distribution
SELECT 
    BloodGroup,
    COUNT(*) AS PatientCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 2) AS Percentage
FROM patients
GROUP BY BloodGroup
ORDER BY PatientCount DESC;

-- 6.5 Average cost by age group and gender
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Above 50' 
    END AS AgeGroup,
    Gender,
    COUNT(*) AS Patients,
    ROUND(AVG(TreatmentCost), 0) AS AvgCost,
    ROUND(AVG(HospitalStayDays), 1) AS AvgStayDays
FROM patients
GROUP BY AgeGroup, Gender
ORDER BY AgeGroup, Gender;

-- 6.6 Top 5 most expensive treatments
SELECT 
    PatientID,
    Name,
    Age,
    Department,
    Diagnosis,
    TreatmentCost,
    InsuranceCovered,
    OutOfPocket,
    HospitalStayDays
FROM patients
ORDER BY TreatmentCost DESC
LIMIT 5;

-- ============================================================
-- SECTION 7: KPI SUMMARY VIEW
-- ============================================================

-- 7.1 Overall KPI dashboard query
SELECT 
    COUNT(*) AS TotalPatients,
    SUM(TreatmentCost) AS TotalRevenue,
    ROUND(AVG(TreatmentCost), 2) AS AvgTreatmentCost,
    ROUND(AVG(HospitalStayDays), 2) AS AvgHospitalStay,
    ROUND(AVG(Satisfaction), 2) AS AvgSatisfactionScore,
    SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END) AS TotalReadmissions,
    ROUND(SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ReadmissionRate,
    SUM(InsuranceCovered) AS TotalInsuranceClaimed,
    SUM(OutOfPocket) AS TotalOutOfPocket,
    COUNT(CASE WHEN PaymentStatus = 'Pending' THEN 1 END) AS PendingPayments
FROM patients;
