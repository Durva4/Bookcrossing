# Book-Crossing Community Data Analysis

This project is a comprehensive SQL-based analysis of the **Book-Crossing** community, a worldwide social experiment where individuals "release" books into the wild for others to discover and track. The analysis focuses on global book consumption, user demographics, and popularity patterns.

## 📊 Project Overview
Using a dataset of over 278,000 entries (sampled for efficiency), this project explores:
* **User Demographics:** Identifying active regions and age distributions.
* **Popularity Trends:** Discovering the highest-rated books and most successful authors.
* **Business Intelligence:** Segmenting users for targeted engagement and inventory management.

## 🗂️ Dataset Description
The analysis utilizes three primary tables:
* **`books_data`**: ISBNs, titles, authors, and publication details.
* **`users`**: User-ID, location, and age.
* **`bookratings`**: Explicit user feedback and ratings.

## 🚀 Key SQL Insights
The project implements 20+ queries covering:
* **Market Dominance:** Analyzed geographical distribution (top regions: USA, Canada, UK).
* **Trend Analysis:** Filtered publications by era for targeted promotional campaigns.
* **Quality Metrics:** Calculated average ratings per author to identify top-tier content.
* **Advanced Analytics:** Used Window Functions to track catalog growth and Joins to maintain data integrity.

## 🛠️ Tech Stack
* **Language:** SQL (MySQL/PostgreSQL)
* **Techniques:** Joins, Window Functions (`OVER`), CTEs, Aggregations, and Pattern Matching.
