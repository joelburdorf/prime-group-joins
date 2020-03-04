
-- BASE MODE

--1. Get all customers and their addresses.
SELECT * FROM "customers" 
JOIN "addresses"
ON "addresses"."customer_id" = "customers"."id";

--2. Get all orders and their line items (orders, quantity and product).
SELECT "orders","line_items" FROM "line_items"
JOIN "orders"
ON "orders"."id" = "line_items"."order_id";

--3. Which warehouses have cheetos?
SELECT "warehouse" from "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "warehouse_product"."product_id" = 5;

--4. Which warehouses have diet pepsi?
SELECT "warehouse" from "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "warehouse_product"."product_id" = 6;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT  "orders"."address_id", COUNT(DISTINCT "orders"."id")
FROM    "orders"
JOIN "addresses" ON "orders"."address"."id" = "addresses"."customer_id"
GROUP   BY "address_id";
--6. How many customers do we have?
SELECT count("id") FROM  "customers";

--7. How many products do we carry?
SELECT count("id") FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT sum("on_hand") FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "warehouse_product"."product_id" = 6;

-- STRETCH

--9. How much was the total cost for each order?

--10. How much has each customer spent in total?

--11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).