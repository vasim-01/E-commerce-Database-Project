USE zack_ecommorce; 
-- q.1
-- finding  the total ravnue  
SELECT SUM(amount) as total_ravnue 
FROM payments;

SELECT product_name,
SUM(oi.quantity * p.price )as revanue 
FROM order_items Oi
JOIN product p on p.product_id = oi.product_id
JOIN orders o on o.order_id = oi.order_id
WHERE o.order_status = 'delivered' 
GROUP  BY p.product_name
ORDER BY revanue DESC;
-- q.2
-- CUSTOMER WHO SPEND MOST 
SELECT c.name, SUM(p.amount)
as total_spend
FROM customer c 
JOIN orders o on c.customer_id = o.customer_id 
JOIN payments p on p.order_id = o.order_id
GROUP BY c.name
ORDER BY total_spend ;
-- q.3
-- MOST SOLD  PRODUCT 
SELECT p.product_name,
SUM(oi.quantity)as total_sold
FROM order_items oi 
JOIN product p ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold  DESC;
-- q.4
-- HOW MANY ORDERS ARE CANCELLED
 SELECT COUNT(*)as cancelled_order
 FROM orders
 WHERE order_status = 'cancelled';






