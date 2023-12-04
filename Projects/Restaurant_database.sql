-- Creating tables
CREATE TABLE customer_ID (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    phone_number VARCHAR(15)
);

CREATE TABLE employee_ID (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    position VARCHAR(50)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    total_amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer_ID(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee_ID(employee_id)
);

CREATE TABLE menu (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Inserting data into tables
INSERT INTO customer_ID VALUES (1, 'John Doe', '123-456-7890');
INSERT INTO customer_ID VALUES (2, 'Jane Smith', '987-654-3210');

INSERT INTO employee_ID VALUES (101, 'Alice', 'Waiter');
INSERT INTO employee_ID VALUES (102, 'Bob', 'Chef');

INSERT INTO Transactions VALUES (1001, 1, 101, 35.50, '2023-01-15');
INSERT INTO Transactions VALUES (1002, 2, 102, 45.75, '2023-02-20');

INSERT INTO menu VALUES (501, 'Burger', 10.99);
INSERT INTO menu VALUES (502, 'Pizza', 12.50);
INSERT INTO menu VALUES (503, 'Salad', 8.75);

--Queries
SELECT customer_id, customer_name
FROM customer_ID
WHERE customer_id IN (
    SELECT customer_id
    FROM Transactions
    GROUP BY customer_id
    HAVING AVG(total_amount) > (
        SELECT AVG(total_amount)
        FROM Transactions
    )
);

--with to get total sales by employee
WITH TotalSales AS (
    SELECT employee_id, SUM(total_amount) AS total_sales
    FROM Transactions
    GROUP BY employee_id
) 
SELECT employee_ID.employee_id, employee_name, total_sales
FROM employee_ID
JOIN TotalSales ON employee_ID.employee_id = TotalSales.employee_id;

-- JOIN to display customer, transaction, and menu item details
SELECT c.customer_name, t.transaction_id, m.item_name, m.price
FROM customer_ID c
JOIN Transactions t ON c.customer_id = t.customer_id
JOIN menu m ON t.transaction_id = m.item_id;

--Aggregate function (MAX) to find the most expensive menu item
SELECT item_name, MAX(price) AS max_price
FROM menu;

--Subquery using IN to find employees who handled transactions
SELECT employee_id, employee_name
FROM employee_ID
WHERE employee_id IN (
    SELECT DISTINCT employee_id
    FROM Transactions
);
