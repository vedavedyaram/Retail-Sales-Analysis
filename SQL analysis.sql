CREATE DATABASE  retailsalesdata;
USE retailsalesdata; 
SELECT *FROM Retail_Data_Response LIMIT 2;

CREATE TABLE Sales_Data_Transactions(
customer_id VARCHAR(255),
trans_date DATETIME,
tran_amount INT
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Retail_Data_Transactions.csv'
INTO TABLE Sales_Data_Transaction
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, @trans_date, tran_amount)
SET trans_date = STR_TO_DATE(@trans_date, '%d-%b-%y');

SELECT *FROM Sales_Data_Transaction LIMIT 5;
EXPLAIN SELECT *FROM Sales_Data_Transaction WHERE customer_id = 'CS5295';

CREATE INDEX idx_customer_id ON Sales_Data_Transaction(customer_id);

SELECT SUM(tran_amount) AS total_sales FROM Sales_Data_Transaction;


SELECT customer_id,SUM(tran_amount) AS total_spending
FROM Sales_Data_Transaction
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 5;

SELECT AVG(tran_amount) AS avg_transaction
FROM Sales_Data_Transaction;

SELECT * FROM Sales_Data_Transaction
ORDER BY tran_amount DESC
LIMIT 5;

SELECT MONTH(trans_date) AS month,
       SUM(tran_amount) AS total_sales
FROM Sales_Data_Transaction
GROUP BY month
ORDER BY month;
