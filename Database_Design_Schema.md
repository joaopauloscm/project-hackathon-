# Database Schema Design

The database schema was designed to organize raw product and review data into a structured relational format. A new database named `hackathon` was created to store the project data.

## Tables Overview

Three main tables were implemented:

- `product`
- `user`
- `review`

## Product Table

The `product` table stores information about each item, including:

- `product_id` (Primary Key, Auto-Increment)
- `asin`
- `name`
- `brand`
- `dimensions`
- `weight`
- `price`

The primary key is automatically generated using an auto-increment integer, ensuring that each product is uniquely identifiable.

## User Table

The `user` table stores information about individuals who submitted reviews. It includes:

- `user_id` (Primary Key)
- `name`
- `date_joined`

Each user is uniquely identified, allowing the system to track users independently from their reviews.

## Review Table

The `review` table represents the relationship between users and products. It includes:

- `rating`
- `review_title`
- `review_text`
- `review_date`
- `product_id` (Foreign Key)
- `user_id` (Foreign Key)

Foreign keys (`product_id` and `user_id`) establish relationships with the `product` and `user` tables. This structure ensures referential integrity and enforces a relational model.

## Summary

Overall, this schema follows normalization principles by:

- Separating data into distinct entities  
- Reducing redundancy  
- Improving data consistency  

The design supports efficient querying, especially when combining product, user, and review data through `JOIN` operations.
