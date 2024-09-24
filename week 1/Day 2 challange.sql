INSERT INTO customer (first_name,last_name,email)
VALUES 
('jane' , 'smith' , 'janesmith@email.com'),
('bob' , 'johnson' , 'bobjohnson@gmail.com'),
('alice' , 'brown' , 'alicebrown@gmail.com'),
('charlie','davis','charliedavis@gmail.com'),
('eva','fisher','evafisher@gmail.com'),
('george','harris','georgeharris@gmail.com'),
('ivy','johnes','ivyjohnes@gmail.com'),
('kevin','miller','kevinmiller@gmail.com'),
('lily','nelson','lllynelson@gmail.com'),
('oliver','patterson','oliverpatterson@gmail.com'),
('quinn','roberts','quinnroberts@gmail.com'),
('sophia','thomas','sophiathomas@gmail.com');

SELECT * FROM customer;

INSERT INTO product(product_name,price)
VALUES
('product B' , 15.00),
('product C',20.00),
('product D',25.00),
('product E',30.00),
('product F',35.00),
('product G',40.00),
('product H',45.00),
('product I',50.00),
('product j',55.00),
('product K',60.00),
('product L',65.00),
('product M',70.00);

SELECT * FROM product;

INSERT INTO orders(customer_id,order_date)
VALUES
(2,'2023-05-02'),
(3,'2023-05-03'),
(1,'2023-05-04'),
(2,'2023-05-05'),
(3,'2023-05-06'),
(4,'2023-05-07'),
(5,'2023-05-08'),
(6,'2023-05-09'),
(7,'2023-05-10'),
(8,'2023-05-11'),
(9,'2023-05-12'),
(10,'2023-05-13'),
(11,'2023-05-14'),
(12,'2023-05-15'),
(13,'2023-05-15');

SELECT * FROM orders;

INSERT INTO order_items(order_id,product_id,quantity)
VALUES
(1,1,2),
(1,2,1),
(2,2,1),
(2,3,3),
(3,1,1),
(3,3,2),
(4,2,4),
(4,3,1),
(5,1,1),
(5,3,2),
(6,2,3),
(6,1,1),
(7,4,1),
(7,5,2),
(8,6,3),
(8,7,1),
(9,8,2),
(9,9,1),
(10,10,3),
(10,11,2),
(11,12,1),
(11,13,3),
(12,4,2),
(12,5,1),
(13,6,3),
(13,7,2),
(14,8,1),
(14,9,2),
(15,10,3),
(15,11,1),
(16,12,2),
(16,13,3);
SELECT * FROM order_items;
