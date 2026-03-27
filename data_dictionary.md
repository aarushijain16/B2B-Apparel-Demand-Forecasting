# 📘 Data Dictionary

This document describes the structure of the dataset used in the End-to-End Demand Forecasting & Supply Chain Analytics for B2B Apparel project.

## 📊 1. orders

| **Column Name**           | **Data Type** | **Description**                             |
| :---------------------: | :---------: | :---------------------------------------: |
| order_id              | Integer   | Unique identifier for each order        |
| distributor_id        | Integer   | ID of the distributor placing the order |
| order_date            | Date      | Date when order was placed              |
| production_start_date | Date      | Date when production started            |
| dispatch_date         | Date      | Date when order was shipped             |
| payment_received_date | Date      | Date when payment was received          |
| status                | Text      | Order status (e.g., completed, pending) |

## 📦 2. order_items

| **Column Name** | **Data Type** | **Description**               |
| :-----------: | :---------: | :-------------------------: |
| order_id    | Integer   | Reference to orders table |
| sku_id      | Integer   | Unique identifier for SKU |
| quantity    | Integer   | Units ordered for the SKU |


## 🏭 3. production_batches

| **Column Name**           | **Data Type** | **Description**                      |
| :---------------------: | :---------: | :--------------------------------: |
| batch_id              | Integer   | Unique production batch ID       |
| design_id             | Integer   | Design associated with the batch |
| size                  | Integer   | Size produced in the batch       |
| batch_start_date      | Date      | Start date of production batch   |
| batch_completion_date | Date      | Completion date of batch         |
| quantity_produced     | Integer   | Total units produced in batch    |

## 📊 4. inventory_monthly

| **Column Name**      | **Data Type** | **Description**                 |
| :----------------: | :---------: | :---------------------------: |
| month            | Date      | Month of snapshot (YYYY-MM) |
| sku_id           | Integer   | Unique SKU identifier       |
| opening_stock    | Integer   | Stock at beginning of month |
| production_added | Integer   | Units added from production |
| units_sold       | Integer   | Units sold during the month |
| closing_stock    | Integer   | Stock at end of month       |
| inventory_value  | Numeric   | Total value of inventory    |

## 🧑‍💼 5. distributors

| **Column Name**      | **Data Type** | **Description**                      |
| :----------------: | :---------: | :--------------------------------: |
| distributor_id   | Integer   | Unique distributor ID            |
| region           | Text      | Geographic region of distributor |
| avg_payment_days | Integer   | Expected payment cycle           |

## 👕 6. designs

| **Column Name**   | **Data Type** | **Description**                   |
| :-------------: | :---------: | :-----------------------------: |
| design_id     | Integer   | Unique design identifier      |
| category      | Text      | Product category (e.g., kids) |
| price_band    | Text      | Price range (e.g., 240–320)   |
| cost_price    | Numeric   | Cost of manufacturing         |
| selling_price | Numeric   | Selling price                 |
| launch_date   | Date      | Date when design was launched |

## 📏 7. design_sizes

| **Column Name** | **Data Type** | **Description**          |
| :-----------: | :---------: | :--------------------: |
| design_id   | Integer   | Design identifier    |
| sku_id      | Integer   | SKU mapped to design |
| size        | Integer   | Size of product      |

## 🔗 Key Relationships

- orders ↔ order_items → via order_id

- order_items ↔ design_sizes → via sku_id

- design_sizes ↔ designs → via design_id

- orders ↔ distributors → via distributor_id

- inventory_monthly tracks SKU-level inventory over time

## 🧠 Derived Table

sales_base (Created using SQL joins)

This is a fact table used for analysis.

Includes:

- Revenue

- Quantity sold

- SKU, design, pricing, distributor details

👉 Built by joining:

- orders

- order_items

- designs

- design_sizes

- distributors

## ⚠️ Notes

- Dataset is real business-like simulated data

- Financial year considered: April–March

- All monetary values are in USD ($)
