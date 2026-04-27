
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
```
### Step 2: Create Tables (Run Table Script)
mysql -u root -p hackathon < create_tables.sql

### Step 3: Load Data (Run ETL Script)
mysql -u root -p hackathon < etl.sql

## Example Queries
-- View tables
SHOW TABLES;

-- Check row counts
SELECT COUNT(*) FROM product;
SELECT COUNT(*) FROM user;
SELECT COUNT(*) FROM review;

-- Top products by number of reviews
SELECT p.name, COUNT(r.review_id) AS review_count
FROM product p
JOIN review r ON p.product_id = r.product_id
GROUP BY p.name
ORDER BY review_count DESC
LIMIT 5;
.
## Create Tables Script

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS hackathon;
USE hackathon;

-- Product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    asin VARCHAR(255),
    name VARCHAR(255),
    brand VARCHAR(100),
    dimension VARCHAR(100),
    weight VARCHAR(50),
    price DECIMAL(10,2)
);

-- User table
CREATE TABLE `user` (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    date_joined DATE
);

-- Review table
CREATE TABLE review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT,
    review_title TEXT,
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (user_id) REFERENCES `user`(user_id)
);
```
## ETL Script

```sql
-- Load Product Table
INSERT INTO product (asin, name, brand, weight, price)
SELECT DISTINCT
    asins,
    name,
    brand,
    weight,
    NULL
FROM raw_data
WHERE asins IS NOT NULL;

-- Load User Table
INSERT INTO user (name, date_joined)
SELECT DISTINCT
    `reviews.username`,
    CURDATE()
FROM raw_data
WHERE `reviews.username` IS NOT NULL;

-- Load Review Table
INSERT INTO review (product_id, user_id, rating, review_title, review_text, review_date)
SELECT
    p.product_id,
    u.user_id,
    r.`reviews.rating`,
    r.`reviews.title`,
    r.`reviews.text`,
    CURDATE()
FROM raw_data r
JOIN product p ON p.asin = r.asins
JOIN user u ON u.name = r.`reviews.username`
WHERE r.`reviews.rating` IS NOT NULL;
```
## Authors
- Quinton Hunter  
- Paulo
