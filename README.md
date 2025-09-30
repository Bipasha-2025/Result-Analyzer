# 📊 Result Analyzer Rails App

A Rails application that processes student test results from a third-party service (MSM), performs **daily aggregations** and **monthly averages**, and stores them for reporting.

---

## 🚀 Overview

- Students take online tests.
- MSM sends test results as JSON to our Rails app.
- Results are stored in the database (`results` table).
- Every day at **6 PM**, the app runs an **End of Day (EOD) job**:
  - Aggregates test results into **Daily Result Stats**.
  - If today is a **Monday in the week of the third Wednesday**, it also computes **Monthly Result Averages**.

---

## 🗂 Models

### `Result`
Stores raw test results from MSM.
- `student_name` (string)  
- `subject` (string)  
- `marks` (integer)  
- `submitted_at` (datetime)  

### `DailyResultStat`
Stores daily aggregated results per subject.
- `date` (date)  
- `subject` (string)  
- `daily_low` (integer)  
- `daily_high` (integer)  
- `result_count` (integer)  

### `MonthlyAverage`
Stores monthly averages of results.
- `month` (date)  
- `subject` (string)  
- `avg_daily_low` (float)  
- `avg_daily_high` (float)  
- `total_results` (integer)  

---

## ⚙️ Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/your-username/result-analyzer.git
cd result-analyzer
