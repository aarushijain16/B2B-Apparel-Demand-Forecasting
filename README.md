# End-to-End Demand Forecasting & Supply Chain Analytics for B2B Apparel

## *A full-stack analytics system combining SQL, Python, and Power BI to optimize inventory, improve working capital, and forecast demand.*
# 🚀 Project Overview

This project builds an end-to-end analytics system for a manufacturing business to enable:

  📊 Real-time business monitoring

  💰 Profitability analysis

  📦 Inventory & production tracking
 
  📈 Demand forecasting using time series models

The system integrates SQL + Python + Power BI to convert raw transactional data into actionable business insights.

# 🎯 Business Problem

The business lacked:

- Visibility into top-performing products

- Clarity on working capital inefficiencies

- Alignment between production and demand

- A system to predict future demand

As a result:

- Production was reactive

- Inventory planning was inefficient

- Cash flow was impacted due to delayed payments

# 🧠 Solution

Built a full-stack analytics pipeline:

Pipeline
# 🏗️ Tech Stack

| **Layer**      | **Tools Used**                         |
|:--------------:|:-------------------------------------:|
| Database       | PostgreSQL                            |
| Querying       | SQL                                   |
| Analysis       | Python (Pandas, NumPy)                |
| Visualization  | Power BI                              |
| Forecasting    | Statsmodels (SARIMA, Holt-Winters)    |

# 📊 Key Features
## 🔹 1. SQL-Based Business Analysis
- Price band profitability analysis

- Top-performing SKU identification

- Margin calculation

- Working capital simulation (DSO impact)

👉 Key Insight:

- Mid-price segments (₹240–480) drive maximum revenue

- $60 M working capital can be unlocked by improving collections

## 🔹 2. Real-Time Power BI Dashboards

Connected directly to PostgreSQL for live tracking.

Dashboards Built:

 📈 Sales Overview

 🧾 Distributor Performance

 🧵 Product Analytics

 🏭 Production Monitoring

👉 Key Insight:

- ~11.7% demand-supply gap (underproduction)

## 🔹 3. Time Series Forecasting

Data Preparation

- Daily → Monthly aggregation

- Time series indexing

**Models Used:**

| **Model**        | **Description**                  | **MAPE**      |
| :------------: | :----------------------------: | :---------: |
| SARIMA       | Captures trend + seasonality | 4.91%     |
| Holt-Winters | Exponential smoothing        | **3.09%** |

🏆 Final Model Selected: Holt-Winters

## 🔹 4. Demand Forecasting

Forecasted next 12 months demand captured:

- Seasonality

- Trends

- Volatility

👉 Key Insight:

Demand is highly seasonal but predictable

# 📈 Key Business Insights

## 💣 Demand Gap

11.7% unmet demand → lost revenue opportunity
## 💰 Working Capital

$60 M tied up in receivables

## 📦 SKU Concentration

Revenue dependent on top-performing designs

## 📊 Seasonality

Strong recurring demand patterns across years

# 💡Business Recommendations

## 🏭 1. Demand-Driven Production Planning

🔍 Problem

- ~11.7% demand gap → consistent underproduction

- Production is not aligned with demand cycles

✅ Recommendation

Implement a forecast-led production planning system:

- Use demand forecasts to create monthly production targets

- Increase production 2–3 months before peak seasons

- Introduce rolling production plans (updated monthly)

🎯 Expected Impact

- Reduce lost sales due to stockouts

- Improve service levels

- Better factory capacity utilization

## 📦 2. Dynamic Inventory Optimization

🔍 Problem

- Inventory buildup during low-demand months

- Stockouts during peak periods

✅ Recommendation

Adopt a dynamic inventory strategy:

- Maintain buffer stock for high-demand SKUs

- Reduce inventory for slow-moving products

- Implement reorder point logic based on demand variability

🎯 Expected Impact

- Lower inventory holding costs

- Reduced dead stock

- Improved inventory turnover

## 💰 3. Working Capital Optimization (High Impact)

🔍 Problem

- Average DSO: ~177 days

- Large capital blocked in receivables

✅ Recommendation

A. Segment Distributors by Risk

-  Identify chronic late payers

- Apply stricter credit terms

B. Incentivize Early Payments

- Offer cash discounts for early payments

C. Credit Policy Optimization

- Adjust credit limits based on payment history

🎯 Expected Impact

- $60 M+ working capital release

- Improved cash flow
- Reduced financial risk

## 🧵 4. SKU Rationalization & Portfolio Optimization

🔍 Problem

- Revenue concentrated in top SKUs

- Significant dead stock observed

✅ Recommendation

- Identify and phase out non-performing SKUs

- Focus production on high-demand, high-margin designs

- Introduce data-backed product launch strategy

🎯 Expected Impact

- Reduced inventory waste

- Better capital allocation

- Increased overall profitability

## 📊 5. Production–Demand Alignment System

🔍 Problem

- Frequent mismatch between production and actual demand

✅ Recommendation

- Build a monthly demand vs production review dashboard

- Track:

  - Forecast vs actual demand
  
  - Production gaps

- Set up alerts for major deviations

🎯 Expected Impact

- Faster decision-making

- Reduced demand-supply mismatch

- Improved operational efficiency

## 🤖 6. Automation & AI Integration (Future Ready)

🔍 Problem

- Manual decision-making processes

✅ Recommendation

- Integrate AI agent (n8n-based) for:

- Inventory alerts

- Stockout risk notifications

- Weekly business summaries

🎯 Expected Impact

- Reduced manual effort
  
- Faster operational response
  
- Scalable decision-making

## ⚠️ 7. Risk & Uncertainty Management

🔍 Problem

- Demand volatility across months

✅ Recommendation

- Use forecast confidence intervals

- Maintain safety stock for volatile SKUs

- Scenario planning for:

  - Demand spikes
  
  - Supply disruptions

🎯 Expected Impact

- Reduced stockout risk

- Improved resilience

- Better planning under uncertainty

# 💣 Final Strategic Insight 

The business does not suffer from unpredictable demand — it suffers from poor alignment between predictable demand and operational decisions.

# ⚙️ How to Explore the Project

- SQL scripts are available in the `/sql` folder  
- Power BI dashboards (`.pbix`) provide real-time insights  
- Forecasting models are implemented in the `/notebooks` folder

# 🚀 Future Improvements

## 🔹 1. Advanced Forecasting Models

- Implement ML-based models like XGBoost / Prophet

- Compare performance with statistical models (Holt-Winters)

👉 Goal: Improve accuracy for high-volatility periods

## 🔹 2. SKU-Level Demand Forecasting

- Move from overall demand → SKU-level predictions

- Enable granular production and inventory planning

👉 Goal: Reduce stockouts and overstock at product level

## 🔹 3. Automated Data Pipeline

- Integrate n8n / Airflow for:

- Scheduled data refresh

- Automated reporting

👉 Goal: Fully automated analytics system

## 🔹 4. Real-Time Alert System

- Build alerts for:

  - Stockout risk

  - Demand spikes

  - Payment delays

👉 Goal: Proactive decision-making

## 🔹 5. Working Capital Optimization Model

- Build predictive model for:

- Payment delays

- Credit risk scoring

👉 Goal: Reduce DSO and improve cash flow

## 🔹 6. Cloud Deployment

- Deploy dashboards and pipeline on cloud (AWS / GCP)

- Enable stakeholder access via web

👉 Goal: Scalability and accessibility
