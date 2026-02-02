

🛒 Zepto Data Analysis Project: Fast-Commerce Insights ⚡

Welcome to my Zepto Analysis project! This repository contains a deep-dive analysis into a real-life dataset from Zepto, one of India's leading quick-commerce platforms. Using PostgreSQL, I transformed raw, messy data into meaningful business insights. 🏃‍♂️💨

📖 Project Overview

In the world of 10-minute deliveries, data is everything. This project focuses on analyzing product categories, pricing strategies, and inventory management. I performed end-to-end data handling, from Schema Design and Data Cleaning to Advanced Analytical Queries.

🛠️ Tech Stack

Database: PostgreSQL

Query Language: SQL

Visualization Connection: Power BI (via localhost)

🏗️ Database Schema

The analysis is based on the zepto table with the following key columns:

sku_id: Unique ID for every product (Primary Key)

name & category: Product identification

mrp & discountedSellingPrice: Pricing data

weightInGms: Physical weight of items

outOfStock: Availability status

🚀 Key Analysis Performed

1. 🧹 Data Cleaning & Preprocessing
Identified and handled NULL values across all critical columns.

Fixed data entry errors by removing rows where mrp was 0.

Converted currency from Paise to Rupees for accurate financial reporting.

2. 💰 Pricing & Value Insights
Top 10 Best-Value Products: Found products with the highest discount percentages.

Price Per Gram: Calculated which products offer the best "bang for your buck" based on weight and price.

High-Value Alerts: Identified high-MRP items (over ₹300) that are currently out of stock to minimize revenue loss.

3. 📦 Inventory & Logistics
Weight Categorization: Grouped products into Low, Medium, and Bulk categories to help optimize delivery bag packing.

Total Category Weight: Calculated the total physical weight of inventory per category to understand warehouse load.

4. 📈 Business Performance
Revenue by Category: Summarized potential revenue across different product segments.

Discount Trends: Identified the top 5 categories offering the highest average discounts.

📊 Key Insights from the Data

Out-of-Stock Tracking: Monitored the count of available vs. unavailable SKUs to maintain a healthy supply chain.

Premium Product Analysis: Filtered products with high MRP but low discounts to understand premium market placement.

🛠️ How to Run

Ensure PostgreSQL is installed on your machine.

Create a database named customer_behaviour.

Open the zepto_analysis.sql file provided in this repo.

Run the script to create the table, clean the data, and generate insights!

Happy Analyzing!
