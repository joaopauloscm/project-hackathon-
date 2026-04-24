INSERT INTO product (asin, name, brand, weight, price)
SELECT DISTINCT
    asins,
    name,
    brand,
    weight,
    NULL
FROM raw_data
WHERE asins IS NOT NULL;
INSERT INTO user (name, date_joined)
SELECT DISTINCT
    `reviews.username`,
    CURDATE()
FROM raw_data
WHERE `reviews.username` IS NOT NULL;
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


