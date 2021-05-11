-- 1. get all customers and their addresses
SELECT * FROM customers
JOIN addresses ON addresses.customer_id=customers.id;

-- 2. get all orders and their line items (orders, quantity and product)
SELECT order_date, quantity, products.description FROM orders
JOIN line_items ON line_items.order_id=orders.id
JOIN products ON products.id=line_items.product_id;

-- 3. Which warehouses have cheetos?
SELECT warehouse FROM warehouse
JOIN warehouse_product ON warehouse_id = warehouse.id
JOIN products ON product_id=products.id
WHERE description='cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT warehouse FROM warehouse
JOIN warehouse_product ON warehouse_id = warehouse.id
JOIN products ON product_id=products.id
WHERE description='diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT(orders) FROM customers
JOIN addresses ON customers.id=customer_id
JOIN orders ON addresses.id=address_id
GROUP BY customers.id;
;


-- 6. How many customers do we have?
SELECT COUNT(*) FROM customers;


-- 7. How many products do we carry?
SELECT COUNT(*) FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM products
JOIN warehouse_product ON products.id=warehouse_product.product_id
WHERE description='diet pepsi';

