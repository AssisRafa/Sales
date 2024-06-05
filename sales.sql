CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE NOT NULL,
    product_quantity INT NOT NULL
);

INSERT INTO sales (sale_date, product_quantity) VALUES
('2023-06-01', 10),
('2023-06-01', 5),
('2023-06-02', 8),
('2023-06-03', 7),
('2023-06-03', 2);

DELIMITER //

CREATE PROCEDURE DailySalesReport()
BEGIN
    SELECT 
        sale_date,
        SUM(product_quantity) AS total_products_sold
    FROM 
        sales
    GROUP BY 
        sale_date
    ORDER BY 
        sale_date;
END //

DELIMITER ;

CALL DailySalesReport();