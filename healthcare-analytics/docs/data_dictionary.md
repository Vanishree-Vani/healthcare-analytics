# Data Dictionary
## Healthcare Analytics Project

---

## Table: `patients`

| Column | Data Type | Description | Example Values |
|--------|-----------|-------------|----------------|
| PatientID | VARCHAR | Unique identifier for each patient | P001, P002 |
| Name | VARCHAR | Full name of the patient | Aarav Sharma |
| Age | INT | Age of patient in years | 45, 32, 60 |
| Gender | VARCHAR | Biological gender | Male, Female |
| BloodGroup | VARCHAR | ABO Rh blood type | A+, B-, O+, AB- |
| Department | VARCHAR | Hospital department for admission | Cardiology, Oncology |
| AdmissionDate | DATE | Date patient was admitted | 2024-01-03 |
| DischargeDate | DATE | Date patient was discharged | 2024-01-08 |
| DiagnosisCode | VARCHAR | ICD-10 diagnosis code | I21, G43, C50 |
| Diagnosis | VARCHAR | Full diagnosis name | Acute Myocardial Infarction |
| DoctorName | VARCHAR | Name of treating doctor | Dr. Priya Nair |
| TreatmentCost | DECIMAL | Total cost of treatment in INR (₹) | 85000, 30000 |
| InsuranceCovered | DECIMAL | Amount paid by insurance in INR (₹) | 72000, 25000 |
| OutOfPocket | DECIMAL | Amount paid by patient in INR (₹) | 13000, 5000 |
| PaymentStatus | VARCHAR | Current payment status | Paid, Pending |
| HospitalStayDays | INT | Number of days admitted | 5, 2, 8 |
| Readmission | VARCHAR | Whether patient was readmitted within 30 days | Yes, No |
| Satisfaction | INT | Patient satisfaction score (1=Very Poor, 5=Excellent) | 1, 2, 3, 4, 5 |

---

## Table: `doctors`

| Column | Data Type | Description | Example Values |
|--------|-----------|-------------|----------------|
| DoctorID | VARCHAR | Unique identifier for doctor | D001, D002 |
| DoctorName | VARCHAR | Full name with title | Dr. Priya Nair |
| Department | VARCHAR | Primary department | Cardiology |
| Specialization | VARCHAR | Area of clinical specialization | Interventional Cardiology |
| Experience_Years | INT | Years of medical practice | 18, 14 |
| Qualification | VARCHAR | Medical degree(s) | MD DM, MS OBG |
| PatientsHandled | INT | Lifetime patients handled | 145, 120 |
| AvgRating | DECIMAL | Average patient rating (1-5) | 4.6, 4.8 |
| Consultations_2024 | INT | Total consultations in 2024 | 312, 280 |

---

## Table: `monthly_summary`

| Column | Data Type | Description | Example Values |
|--------|-----------|-------------|----------------|
| Month | VARCHAR | Month name | January, February |
| Year | INT | Calendar year | 2024 |
| Department | VARCHAR | Hospital department | Cardiology |
| TotalAdmissions | INT | Total patient admissions | 8, 5 |
| TotalRevenue | DECIMAL | Total revenue in INR (₹) | 595000 |
| AvgStayDays | DECIMAL | Average hospital stay length | 6.5, 1.8 |
| ReadmissionCount | INT | Number of readmissions | 2, 0 |
| AvgSatisfaction | DECIMAL | Average patient satisfaction | 3.5, 4.8 |
| InsuranceClaimed | DECIMAL | Total insurance claims in INR (₹) | 476000 |
| OutOfPocketTotal | DECIMAL | Total out-of-pocket collected in INR (₹) | 119000 |

---

## Departments Reference

| Department | Common Diagnoses |
|------------|-----------------|
| Cardiology | Heart failure, MI, Hypertension, Arrhythmia |
| Gynecology | Normal delivery, C-section, Ovarian cyst |
| Orthopedics | Hip fracture, Knee replacement, Back pain |
| General Medicine | Fever, Gastritis, Pneumonia, Typhoid |
| Neurology | Stroke, Epilepsy, Migraine, Parkinson's |
| Oncology | Breast, Lung, Colon, Prostate cancers |
| Endocrinology | Diabetes, Thyroid disorders, Obesity |
| Pulmonology | COPD, Asthma, Respiratory failure |
| Nephrology | CKD, Kidney stones, Renal failure |
| Dermatology | Eczema, Psoriasis, Urticaria |

---

## Notes

- All monetary values are in **Indian Rupees (INR ₹)**
- Satisfaction score: **1** = Very Poor, **5** = Excellent
- Readmission is tracked within a **30-day window** post-discharge
- ICD-10 codes used for diagnosis coding
- Data covers **January 2024 – March 2024**
