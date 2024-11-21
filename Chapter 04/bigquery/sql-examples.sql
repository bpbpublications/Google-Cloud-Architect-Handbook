''' Creating a partitioned table: '''
CREATE TABLE `your_project.your_dataset.ecommerce_data` (
order_id INT64,
product_id STRING,
customer_id INT64,
order_date DATE,
total_amount FLOAT64
)
PARTITION BY DATE(order_date);
OR
CREATE TABLE my_dataset.newtable PARTITION BY DATE(timestamp_column) AS SELECT *
FROM my_dataset.oldtable;
Creating a clustered table:

''' Clustering in BigQuery '''
CREATE TABLE `your_project.your_dataset.ecommerce_data` (
order_id INT64,
product_id STRING,
customer_id INT64,
order_date DATE,
total_amount FLOAT64
)
CLUSTER BY product_id;
OR
CREATE TABLE your_project.my_dataset.newtable CLUSTER BY column1, column2 AS
SELECT * FROM my_dataset.oldtable;
