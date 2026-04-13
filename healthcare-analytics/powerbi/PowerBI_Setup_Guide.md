# Power BI Report Setup Guide
## Healthcare Analytics Dashboard

---

## 📁 Files Required
- `data/patients.csv`
- `data/doctors.csv`
- `data/monthly_summary.csv`

---

## 🔌 STEP 1: Load Data into Power BI

1. Open **Power BI Desktop**
2. Click **Home → Get Data → Text/CSV**
3. Load all 3 CSV files one by one:
   - `patients.csv`
   - `doctors.csv`
   - `monthly_summary.csv`
4. Click **Transform Data** to open Power Query Editor

---

## 🔧 STEP 2: Data Transformations in Power Query

### For `patients` table:
| Column | Action |
|--------|--------|
| AdmissionDate | Change type → Date |
| DischargeDate | Change type → Date |
| TreatmentCost | Change type → Decimal Number |
| InsuranceCovered | Change type → Decimal Number |
| OutOfPocket | Change type → Decimal Number |
| Age | Change type → Whole Number |
| HospitalStayDays | Change type → Whole Number |

### Add Custom Column: `AgeGroup`
Go to **Add Column → Custom Column**, paste:
```
if [Age] < 18 then "Under 18"
else if [Age] <= 30 then "18–30"
else if [Age] <= 45 then "31–45"
else if [Age] <= 60 then "46–60"
else "60+"
```

### Add Custom Column: `AdmissionMonth`
```
Date.MonthName([AdmissionDate])
```

### Add Custom Column: `AdmissionYear`
```
Date.Year([AdmissionDate])
```

---

## 🔗 STEP 3: Create Relationships

Go to **Model View** and create:

| From | To | Type |
|------|----|------|
| `patients[DoctorName]` | `doctors[DoctorName]` | Many to One |
| `monthly_summary[Department]` | `patients[Department]` | Many to Many |

---

## 📐 STEP 4: Create DAX Measures

Open **Home → New Measure** and create the following:

### KPI Measures

```DAX
Total Patients = COUNTROWS(patients)
```

```DAX
Total Revenue = SUM(patients[TreatmentCost])
```

```DAX
Avg Treatment Cost = AVERAGE(patients[TreatmentCost])
```

```DAX
Avg Hospital Stay = AVERAGE(patients[HospitalStayDays])
```

```DAX
Avg Satisfaction Score = AVERAGE(patients[Satisfaction])
```

```DAX
Readmission Rate % = 
DIVIDE(
    COUNTROWS(FILTER(patients, patients[Readmission] = "Yes")),
    COUNTROWS(patients)
) * 100
```

```DAX
Insurance Coverage % = 
DIVIDE(SUM(patients[InsuranceCovered]), SUM(patients[TreatmentCost])) * 100
```

```DAX
Pending Payments = 
CALCULATE(
    SUM(patients[OutOfPocket]),
    patients[PaymentStatus] = "Pending"
)
```

```DAX
Total Readmissions = 
CALCULATE(COUNTROWS(patients), patients[Readmission] = "Yes")
```

---

## 📊 STEP 5: Build the Dashboard Pages

### PAGE 1 — Executive Summary (KPI Overview)

**Visuals to Add:**
1. **Card** → Total Patients
2. **Card** → Total Revenue
3. **Card** → Avg Satisfaction Score
4. **Card** → Readmission Rate %
5. **Card** → Avg Hospital Stay
6. **Donut Chart** → Department vs Total Revenue
7. **Bar Chart** → Department vs Patient Count
8. **Line Chart** → AdmissionMonth vs Total Admissions
9. **Slicer** → Department (dropdown)
10. **Slicer** → Gender (dropdown)

---

### PAGE 2 — Financial Analysis

**Visuals to Add:**
1. **Clustered Bar Chart** → Department vs TreatmentCost vs InsuranceCovered vs OutOfPocket
2. **Stacked Column Chart** → AdmissionMonth vs Revenue (by department)
3. **Table** → PatientID, Name, TreatmentCost, PaymentStatus (filter: Pending)
4. **Pie Chart** → PaymentStatus split
5. **KPI Card** → Pending Payments
6. **Gauge** → Insurance Coverage % (target: 80%)

---

### PAGE 3 — Clinical Performance

**Visuals to Add:**
1. **Clustered Column Chart** → Department vs Readmission Rate %
2. **Bar Chart** → Department vs Avg Hospital Stay
3. **Scatter Chart** → AvgCost (X) vs AvgSatisfaction (Y), size by PatientCount
4. **Table** → Top 10 Diagnoses (by count)
5. **Card** → Total Readmissions
6. **Slicer** → AdmissionMonth

---

### PAGE 4 — Doctor Performance

**Visuals to Add:**
1. **Table** → DoctorName, Department, PatientsHandled, AvgSatisfaction, ReadmissionRate
2. **Bar Chart** → DoctorName vs Revenue Generated
3. **Bar Chart** → DoctorName vs Avg Patient Satisfaction
4. **Scatter Chart** → Experience_Years (X) vs AvgRating (Y)
5. **Card** → Top Rated Doctor (Max AvgRating)

---

### PAGE 5 — Patient Demographics

**Visuals to Add:**
1. **Donut Chart** → Gender distribution
2. **Bar Chart** → AgeGroup vs Patient Count
3. **Donut Chart** → BloodGroup distribution
4. **Map / Shape Map** → (optional, if location data available)
5. **Stacked Bar** → AgeGroup vs Gender vs AvgCost
6. **Treemap** → Department vs AgeGroup patient split

---

## 🎨 STEP 6: Formatting & Theme

### Recommended Color Theme:
- **Primary:** #1A6EA8 (Healthcare Blue)
- **Secondary:** #27AE60 (Green for positive KPIs)
- **Accent:** #E74C3C (Red for alerts/readmissions)
- **Background:** #F4F6F9
- **Text:** #2C3E50

### Apply Theme:
1. Go to **View → Themes → Customize current theme**
2. Apply the colors above to Data colors

### Page Layout:
- Canvas size: **1280 × 720** (Widescreen 16:9)
- Background: Light gray `#F4F6F9`
- Add a title text box at the top of each page

---

## 💾 STEP 7: Save & Publish

1. Save the file as `Healthcare_Analytics.pbix`
2. To publish: **Home → Publish → Select your Workspace**
3. Share the link with stakeholders

---

## 📌 Tips for a Better Dashboard
- Use **Bookmarks** for toggle between views
- Add **Tooltips** to charts for more details on hover
- Enable **Drill-through** on Department or Doctor pages
- Use **Conditional Formatting** on tables (red for Pending, green for Paid)
- Add a **Reset Slicers** button using a bookmark
