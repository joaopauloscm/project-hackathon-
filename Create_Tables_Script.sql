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
CREATE TABLE user (
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
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

