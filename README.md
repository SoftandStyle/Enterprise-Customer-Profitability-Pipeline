# Enterprise Customer Profitability & Financial Benchmarking

## 📌 Business Overview
In enterprise retail, reporting gross sales without factoring in order status leads to inflated revenue metrics. This project establishes an automated, end-to-end data pipeline that extracts raw transactional data from a SQL Server backend, filters exclusively for completed orders, and feeds a dynamic Power BI dashboard to deliver accurate, actionable financial insights.

## 🛠️ Technology Stack
* **Database:** SQL Server (SSMS), T-SQL
* **Business Intelligence:** Power BI, Advanced DAX
* **Data Modeling:** Relational Database Architecture

## 🚀 Key Features & Architecture
1. **Data Engineering (SQL Server):** * Developed robust SQL queries leveraging `INNER` and `LEFT JOIN`s across 5 core enterprise tables (`SalesOrderHeader`, `Customer`, `Person`, etc.).
   * Enforced strict business logic at the server level by filtering exclusively for realized revenue (`Status = 5`), protecting downstream reports from canceled or failed transactions.
   * Utilized **CTEs and Window Functions** (`RANK() OVER(PARTITION BY...)`) to create accurate regional customer benchmarks.
2. **Data Modeling (Power BI):**
   * Avoided static "Top N" SQL aggregations, opting instead to import granular transactional data to maintain full dynamic filtering capabilities in the BI layer.
   * Constructed a dedicated `Date` table to establish a robust foundation for DAX Time-Intelligence operations.
3. **Financial Analytics (DAX):**
   * Engineered dynamic measures to calculate **Year-over-Year (YoY) Growth** and variances, utilizing context transition and `CALCULATE` functions.
   * Built an interactive Executive Dashboard enabling leadership to drill down into Top-10 revenue drivers and cross-regional distributions without manual data manipulation.

## 📊 Business Impact
Transformed static, manual spreadsheet reporting into an automated pipeline that provides real-time visibility into true cash flow and regional profitability, eliminating reporting overhead and reducing financial blind spots.
<img width="1534" height="866" alt="image" src="https://github.com/user-attachments/assets/1628ed6c-a8a4-43c5-a654-ca80f350b1a8" />
