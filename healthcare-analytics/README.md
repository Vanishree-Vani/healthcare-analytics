# 🏥 Healthcare Analytics Project
### Power BI | Excel | SQL — Data Analyst Portfolio Project

---

## 📌 Project Overview

This project is a complete end-to-end **Healthcare Data Analytics** solution built for a fictional multi-department hospital. It demonstrates skills in **data cleaning**, **SQL querying**, **Excel analysis**, and **Power BI dashboard creation** — all core skills expected of a professional data analyst.

---

## 🗂️ Project Structure

```
healthcare-analytics/
│
├── 📁 data/
│   ├── patients.csv            # 60 patient records with clinical & billing data
│   ├── doctors.csv             # 10 doctors with performance metrics
│   └── monthly_summary.csv     # Aggregated monthly data by department
│
├── 📁 sql/
│   └── healthcare_queries.sql  # 25+ SQL queries across 7 sections
│
├── 📁 powerbi/
│   ├── PowerBI_Setup_Guide.md  # Step-by-step Power BI report building guide
│   └── DAX_Measures.dax        # All DAX formulas ready to copy-paste
│
├── 📁 docs/
│   └── data_dictionary.md      # Column definitions for all datasets
│
└── README.md
```

---

## 📊 Datasets Description

### 1. `patients.csv` — 60 Records, 18 Columns
| Column | Description |
|--------|-------------|
| PatientID | Unique patient identifier |
| Name | Patient full name |
| Age | Age in years |
| Gender | Male / Female |
| BloodGroup | ABO blood type |
| Department | Hospital department |
| AdmissionDate | Date of hospital admission |
| DischargeDate | Date of discharge |
| DiagnosisCode | ICD-10 diagnosis code |
| Diagnosis | Diagnosis description |
| DoctorName | Treating doctor |
| TreatmentCost | Total treatment cost (INR) |
| InsuranceCovered | Amount covered by insurance |
| OutOfPocket | Patient's personal expense |
| PaymentStatus | Paid / Pending |
| HospitalStayDays | Length of stay in days |
| Readmission | Whether patient was readmitted (Yes/No) |
| Satisfaction | Patient satisfaction score (1–5) |

### 2. `doctors.csv` — 10 Records, 9 Columns
Doctor profiles with specialization, experience, ratings, and consultation counts.

### 3. `monthly_summary.csv` — 30 Records, 11 Columns
Pre-aggregated monthly data per department for trend analysis.

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| **Power BI Desktop** | Interactive dashboard & data visualization |
| **Microsoft Excel** | Data exploration, pivot tables, charts |
| **SQL (MySQL/SQL Server)** | Data querying and analysis |
| **Power Query** | Data transformation & cleaning |
| **DAX** | Calculated measures in Power BI |

---

## 📈 Key KPIs Tracked

- 🏥 Total Patients & Admissions
- 💰 Total Revenue & Avg Treatment Cost
- 📉 Readmission Rate %
- ⭐ Patient Satisfaction Score
- 🛏️ Avg Hospital Stay (Days)
- 🩺 Insurance Coverage %
- ⏳ Pending Payment Amount
- 👨‍⚕️ Doctor Performance Index

---

## 💡 Power BI Dashboard Pages

| Page | Content |
|------|---------|
| **1. Executive Summary** | KPI cards, revenue by department, admissions trend |
| **2. Financial Analysis** | Cost breakdown, insurance vs out-of-pocket, pending payments |
| **3. Clinical Performance** | Readmission rates, avg stay, satisfaction analysis |
| **4. Doctor Performance** | Revenue per doctor, ratings, readmission by doctor |
| **5. Patient Demographics** | Age groups, gender, blood group distribution |

---

## 🗃️ SQL Query Sections

1. **Table Creation** — DDL scripts
2. **Exploratory Queries** — Patient counts, gender split, age groups
3. **Financial Analysis** — Revenue, insurance, pending payments
4. **Clinical Performance** — Readmissions, stay duration, satisfaction
5. **Doctor Performance** — Patient load, revenue, ratings
6. **Advanced Analytics** — High-risk patients, cost vs satisfaction
7. **KPI Summary View** — Single-query overall dashboard metrics

---

## 🚀 How to Use This Project

### Option A — Power BI
1. Download Power BI Desktop (free): https://powerbi.microsoft.com
2. Load all 3 CSV files from the `data/` folder
3. Follow the step-by-step guide in `powerbi/PowerBI_Setup_Guide.md`
4. Copy DAX measures from `powerbi/DAX_Measures.dax`

### Option B — SQL
1. Open any SQL editor (MySQL Workbench, SSMS, DBeaver, etc.)
2. Run the CREATE TABLE statements in `sql/healthcare_queries.sql`
3. Import CSVs into the tables
4. Execute any queries from Sections 2–7

### Option C — Excel
1. Open `data/patients.csv` in Excel
2. Insert a **Pivot Table** to explore by Department, Gender, Month
3. Create charts for Revenue, Readmissions, Satisfaction
4. Use VLOOKUP/INDEX-MATCH with `doctors.csv`

---

## 📸 Suggested Power BI Screenshots to Add

After building the dashboard, take screenshots and add them here:
- `docs/screenshots/page1_summary.png`
- `docs/screenshots/page2_financial.png`
- `docs/screenshots/page3_clinical.png`

---

## 👤 About This Project

This project was built as part of a **Data Analyst Portfolio** to demonstrate:
- Real-world healthcare data analysis
- SQL query writing across multiple complexity levels
- Power BI dashboard design & DAX formula writing
- Data storytelling and KPI reporting

---

## 📄 License

This project is open-source under the [MIT License](LICENSE).  
Feel free to use, modify, and share with attribution.

---

> ⭐ If you found this project helpful, please give it a star on GitHub!
