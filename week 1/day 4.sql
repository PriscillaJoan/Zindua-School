CREATE schema ABC_DATA;

USE ABC_DATA;

-- CREATE CUSTOMER TABLE
CREATE TABLE customer
(customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR (100),
last_name VARCHAR (100),
email VARCHAR (250)
);

INSERT INTO customer(first_name,last_name,email)
values ('Joe' , 'Doe' , 'johndoe@email.com');

SELECT * FROM customer;

-- create product
CREATE TABLE product 
   (product_id INT AUTO_INCREMENT PRIMARY KEY,  
    product_name VARCHAR(100),                 
    price INT          
    );
INSERT INTO product(product_name,price)
VALUES
('Product A', 10);

SELECT * FROM product;
-- create table orders 

CREATE TABLE orders
(order_id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO orders (order_date,customer_id)
values
('2023-05-021', 1);
SELECT * FROM orders;

-- product id
CREATE TABLE order_items
(order_id INT,
product_id INT,
quantity int,
FOREIGN KEY (order_id) references orders (order_id),
FOREIGN KEY (product_id) references product(product_id)
);

INSERT INTO order_items(order_id,product_id,quantity)
Values
(1 , 1, 2);

SELECT * FROM order_items;



