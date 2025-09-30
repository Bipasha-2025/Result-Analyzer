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

## ⚠️ Assumptions

- MSM sends a JSON POST with the following fields:
  - `student_name`  
  - `subject`  
  - `marks`  
  - `timestamp` (ISO8601 format)  
- We store MSM submissions as `Result` records, using `submitted_at` from the `timestamp` field.  

- The EOD job runs **daily at 6:00 PM** and aggregates results for the **target date** (by default, `Date.current`) into `DailyResultStat` records, one per subject per date.  

- If the target date is the **Monday of the week containing the third Wednesday of the month**, the job also triggers **monthly-average calculation**.  

- **Monthly-average calculation logic:**
  - Go back from the target date through `DailyResultStat` records (descending by date).  
  - Include at least **5 days**, and keep extending until the aggregated `result_count` ≥ 200 (or until no more historical data exists).  
  - Compute averages of `daily_high` and `daily_low` across the considered days.  
  - Store a `MonthlyAverage` record per subject.  

- The job **accepts a date parameter** if you want different behavior (e.g., aggregate the previous day instead of today).  

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
