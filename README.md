
# Project-hackathon
Databases project 
## Overview

This project focuses on designing and implementing a relational database using MySQL. A raw dataset containing product and review information was cleaned, transformed, and organized into a structured format to support efficient querying and analysis.

<img width="398" height="559" alt="Screenshot 2026-04-23 at 9 03 04 PM" src="https://github.com/user-attachments/assets/5a0adf72-23b1-4124-88b3-8742cb7d99d7" />
---

## Database Structure
The database was normalized into three main tables: `product`, `user`, and `review`. The `product` table stores information about each item, including its ASIN, name, brand, and other attributes. The `user` table stores information about individuals who submitted reviews, allowing users to be tracked independently.

The `review` table connects users and products using foreign keys (`product_id` and `user_id`) and contains review-specific data such as rating, title, and text. This design follows normalization principles by reducing redundancy and ensuring data consistency while enabling efficient queries using JOIN operations.

---

## ETL Process
Data was first imported into a staging table called `raw_data`. Relevant product fields were extracted and transformed using `SELECT DISTINCT` to remove duplicate entries. Rows with missing ASIN values were excluded to maintain data integrity.

The cleaned data was then loaded into the `product` table, with missing price values set to `NULL`. This process ensures that raw, unstructured data is converted into a consistent and queryable format.

---

## How to Run

### 1. Create the Database
```sql
CREATE DATABASE hackathon;
USE hackathon;

