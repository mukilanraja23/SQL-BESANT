/* ============================================================
   INVENTORY MANAGEMENT SYSTEM
   MySQL Database
   10 Tables
   Total Records = 8,000
   ============================================================ */

DROP DATABASE IF EXISTS inventory_management;
CREATE DATABASE inventory_management;
USE inventory_management;


/* ============================================================
   1. CATEGORIES
   Target records: 20
   ============================================================ */

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);


/* ============================================================
   2. SUPPLIERS
   Target records: 100
   ============================================================ */

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(150) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    status VARCHAR(20)
);


/* ============================================================
   3. WAREHOUSES
   Target records: 20
   ============================================================ */

CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    manager_name VARCHAR(100),
    capacity INT,
    status VARCHAR(20)
);


/* ============================================================
   4. PRODUCTS
   Target records: 1,000
   ============================================================ */

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    warehouse_id INT,
    sku VARCHAR(50) UNIQUE,
    unit_price DECIMAL(10,2),
    stock_quantity INT DEFAULT 0,
    reorder_level INT,
    unit VARCHAR(30),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id),

    FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id)
);


/* ============================================================
   5. EMPLOYEES
   Target records: 100
   ============================================================ */

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    designation VARCHAR(100),
    warehouse_id INT,
    joining_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id)
);


/* ============================================================
   6. PURCHASE ORDERS
   Target records: 700
   ============================================================ */

CREATE TABLE purchase_orders (
    purchase_order_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    employee_id INT,
    order_date DATE,
    expected_date DATE,
    status VARCHAR(30),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id),

    FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);


/* ============================================================
   7. PURCHASE ORDER ITEMS
   Target records: 2,000
   ============================================================ */

CREATE TABLE purchase_order_items (
    purchase_item_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(12,2),

    FOREIGN KEY (purchase_order_id)
        REFERENCES purchase_orders(purchase_order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


/* ============================================================
   8. SALES
   Target records: 700
   ============================================================ */

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_id INT NOT NULL,
    employee_id INT,
    sale_date DATE,
    customer_name VARCHAR(150),
    payment_method VARCHAR(50),
    status VARCHAR(30),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);


/* ============================================================
   9. SALE ITEMS
   Target records: 2,000
   ============================================================ */

CREATE TABLE sale_items (
    sale_item_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(12,2),

    FOREIGN KEY (sale_id)
        REFERENCES sales(sale_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


/* ============================================================
   10. STOCK MOVEMENTS
   Target records: 1,360
   ============================================================ */

CREATE TABLE stock_movements (
    movement_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    employee_id INT,
    movement_type VARCHAR(30),
    quantity INT,
    movement_date DATE,
    reference_type VARCHAR(50),
    reference_id INT,
    remarks VARCHAR(255),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    FOREIGN KEY (warehouse_id)
        REFERENCES warehouses(warehouse_id),

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);


/* ============================================================
   INSERT CATEGORIES - 20 RECORDS
   ============================================================ */

INSERT INTO categories
(category_name, description)
VALUES
('Electronics', 'Electronic devices'),
('Mobile Phones', 'Smartphones and mobile devices'),
('Laptops', 'Laptop computers'),
('Computer Accessories', 'Accessories for computers'),
('Networking', 'Networking equipment'),
('Storage Devices', 'Data storage products'),
('Printers', 'Printers and accessories'),
('Monitors', 'Computer monitors'),
('Keyboards', 'Computer keyboards'),
('Mice', 'Computer mouse devices'),
('Cables', 'Electronic cables'),
('Power Supplies', 'Power related products'),
('Cameras', 'Digital cameras'),
('Audio', 'Audio equipment'),
('Speakers', 'Computer and Bluetooth speakers'),
('Headphones', 'Headphones and earphones'),
('Tablets', 'Tablet computers'),
('Smart Watches', 'Smart wearable watches'),
('Gaming', 'Gaming accessories'),
('Office Equipment', 'Office equipment');


/* ============================================================
   INSERT SUPPLIERS - 100 RECORDS
   ============================================================ */

INSERT INTO suppliers
(supplier_name, contact_person, phone, email, city, state, status)
VALUES
('ABC Electronics', 'Arun Kumar', '9876500001', 'abc1@gmail.com', 'Chennai', 'Tamil Nadu', 'Active'),
('Tech World', 'Ravi Kumar', '9876500002', 'tech2@gmail.com', 'Madurai', 'Tamil Nadu', 'Active'),
('Global Systems', 'Suresh', '9876500003', 'global3@gmail.com', 'Coimbatore', 'Tamil Nadu', 'Active'),
('Digital India', 'Karthik', '9876500004', 'digital4@gmail.com', 'Salem', 'Tamil Nadu', 'Active'),
('Smart Solutions', 'Vijay', '9876500005', 'smart5@gmail.com', 'Trichy', 'Tamil Nadu', 'Active'),
('NextGen Technologies', 'Ajay', '9876500006', 'nextgen6@gmail.com', 'Chennai', 'Tamil Nadu', 'Active'),
('Prime Electronics', 'Manoj', '9876500007', 'prime7@gmail.com', 'Madurai', 'Tamil Nadu', 'Active'),
('Future Tech', 'Prakash', '9876500008', 'future8@gmail.com', 'Erode', 'Tamil Nadu', 'Active'),
('Galaxy Systems', 'Dinesh', '9876500009', 'galaxy9@gmail.com', 'Tirunelveli', 'Tamil Nadu', 'Active'),
('Micro Solutions', 'Bala', '9876500010', 'micro10@gmail.com', 'Vellore', 'Tamil Nadu', 'Active'),
('Techno Mart', 'Ganesh', '9876500011', 'techno11@gmail.com', 'Chennai', 'Tamil Nadu', 'Active'),
('Elite Systems', 'Mohan', '9876500012', 'elite12@gmail.com', 'Coimbatore', 'Tamil Nadu', 'Active'),
('Bright Technologies', 'Hari', '9876500013', 'bright13@gmail.com', 'Salem', 'Tamil Nadu', 'Active'),
('Computer Point', 'Senthil', '9876500014', 'computer14@gmail.com', 'Madurai', 'Tamil Nadu', 'Active'),
('Digital World', 'Surya', '9876500015', 'digital15@gmail.com', 'Trichy', 'Tamil Nadu', 'Active'),
('IT Solutions', 'Naveen', '9876500016', 'it16@gmail.com', 'Chennai', 'Tamil Nadu', 'Active'),
('Mega Tech', 'Ramesh', '9876500017', 'mega17@gmail.com', 'Erode', 'Tamil Nadu', 'Active'),
('Universal Computers', 'Lokesh', '9876500018', 'universal18@gmail.com', 'Vellore', 'Tamil Nadu', 'Active'),
('Tech Plus', 'Vasanth', '9876500019', 'techplus19@gmail.com', 'Coimbatore', 'Tamil Nadu', 'Active'),
('Smart Mart', 'Gokul', '9876500020', 'smart20@gmail.com', 'Chennai', 'Tamil Nadu', 'Active'),
('Alpha Electronics', 'Sanjay', '9876500021', 'alpha21@gmail.com', 'Madurai', 'Tamil Nadu', 'Active'),
('Beta Systems', 'Rajesh', '9876500022', 'beta22@gmail.com', 'Salem', 'Tamil Nadu', 'Active'),
('Gamma Technologies', 'Muthu', '9876500023', 'gamma23@gmail.com', 'Trichy', 'Tamil Nadu', 'Active'),
('Delta Computers', 'Kannan', '9876500024', 'delta24@gmail.com', 'Chennai', 'Tamil Nadu', 'Active'),
('Omega Tech', 'Sathish', '9876500025', 'omega25@gmail.com', 'Coimbatore', 'Tamil Nadu', 'Active');

/* Generate suppliers 26-100 */

INSERT INTO suppliers
(supplier_name, contact_person, phone, email, city, state, status)
SELECT
    CONCAT('Supplier Company ', n),
    CONCAT('Contact Person ', n),
    CONCAT('98765', LPAD(n,5,'0')),
    CONCAT('supplier', n, '@gmail.com'),
    ELT(((n-1)%10)+1,
        'Chennai','Madurai','Coimbatore','Salem','Trichy',
        'Erode','Vellore','Tirunelveli','Thanjavur','Dindigul'),
    'Tamil Nadu',
    IF(n % 10 = 0, 'Inactive', 'Active')
FROM (
    SELECT 26 n UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL
    SELECT 29 UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL
    SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL
    SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL
    SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40 UNION ALL
    SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL
    SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL
    SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL
    SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL
    SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL
    SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL
    SELECT 59 UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL
    SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL
    SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL
    SELECT 68 UNION ALL SELECT 69 UNION ALL SELECT 70 UNION ALL
    SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL
    SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL
    SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79 UNION ALL
    SELECT 80 UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL
    SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85 UNION ALL
    SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL
    SELECT 89 UNION ALL SELECT 90 UNION ALL SELECT 91 UNION ALL
    SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL
    SELECT 95 UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL
    SELECT 98 UNION ALL SELECT 99 UNION ALL SELECT 100
) AS numbers;


/* ============================================================
   INSERT WAREHOUSES - 20 RECORDS
   ============================================================ */

INSERT INTO warehouses
(warehouse_name, location, manager_name, capacity, status)
VALUES
('Chennai Main Warehouse', 'Chennai', 'Ramesh Kumar', 10000, 'Active'),
('Madurai Warehouse', 'Madurai', 'Suresh Kumar', 8000, 'Active'),
('Coimbatore Warehouse', 'Coimbatore', 'Prakash Kumar', 9000, 'Active'),
('Salem Warehouse', 'Salem', 'Arun Kumar', 7000, 'Active'),
('Trichy Warehouse', 'Trichy', 'Vijay Kumar', 6000, 'Active'),
('Erode Warehouse', 'Erode', 'Mohan Kumar', 6500, 'Active'),
('Vellore Warehouse', 'Vellore', 'Ganesh Kumar', 7500, 'Active'),
('Tirunelveli Warehouse', 'Tirunelveli', 'Bala Kumar', 5500, 'Active'),
('Thanjavur Warehouse', 'Thanjavur', 'Hari Kumar', 5000, 'Active'),
('Dindigul Warehouse', 'Dindigul', 'Karthik Kumar', 4500, 'Active'),
('Karur Warehouse', 'Karur', 'Naveen Kumar', 5000, 'Active'),
('Tiruppur Warehouse', 'Tiruppur', 'Manoj Kumar', 8500, 'Active'),
('Thoothukudi Warehouse', 'Thoothukudi', 'Sanjay Kumar', 5500, 'Active'),
('Nagercoil Warehouse', 'Nagercoil', 'Rajesh Kumar', 4000, 'Active'),
('Cuddalore Warehouse', 'Cuddalore', 'Dinesh Kumar', 4500, 'Active'),
('Kanchipuram Warehouse', 'Kanchipuram', 'Muthu Kumar', 6000, 'Active'),
('Hosur Warehouse', 'Hosur', 'Senthil Kumar', 7500, 'Active'),
('Pudukkottai Warehouse', 'Pudukkottai', 'Lokesh Kumar', 4000, 'Active'),
('Namakkal Warehouse', 'Namakkal', 'Ajay Kumar', 5000, 'Active'),
('Virudhunagar Warehouse', 'Virudhunagar', 'Gokul Kumar', 4500, 'Active');


/* ============================================================
   INSERT PRODUCTS - 1,000 RECORDS
   ============================================================ */

INSERT INTO products
(product_name, category_id, warehouse_id, sku, unit_price,
 stock_quantity, reorder_level, unit)
SELECT
    CONCAT(
        ELT(((n-1)%20)+1,
        'Laptop','Mobile Phone','Keyboard','Mouse','Monitor',
        'Router','SSD','Hard Disk','Printer','USB Cable',
        'Power Supply','Camera','Speaker','Headphone','Tablet',
        'Smart Watch','Gaming Mouse','RAM','Webcam','Projector'),
        ' Model ', n
    ),
    ((n-1)%20)+1,
    ((n-1)%20)+1,
    CONCAT('SKU', LPAD(n,5,'0')),
    ROUND(500 + ((n * 137) % 95000),2),
    20 + ((n * 17) % 480),
    10 + ((n * 7) % 100),
    'Piece'
FROM (
    SELECT @row:=@row+1 AS n
    FROM
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d,
    (SELECT @row:=0) r
    LIMIT 1000
) numbers;


/* ============================================================
   INSERT EMPLOYEES - 100 RECORDS
   ============================================================ */

INSERT INTO employees
(employee_name, email, phone, designation,
 warehouse_id, joining_date, status)
SELECT
    CONCAT('Employee ', n),
    CONCAT('employee', n, '@company.com'),
    CONCAT('90000', LPAD(n,5,'0')),
    ELT(((n-1)%5)+1,
        'Inventory Manager',
        'Sales Executive',
        'Warehouse Staff',
        'Purchase Executive',
        'Stock Analyst'),
    ((n-1)%20)+1,
    DATE_ADD('2021-01-01', INTERVAL n DAY),
    IF(n % 15 = 0, 'Inactive', 'Active')
FROM (
    SELECT @e:=@e+1 AS n
    FROM
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT @e:=0) r
    LIMIT 100
) numbers;


/* ============================================================
   INSERT PURCHASE ORDERS - 700 RECORDS
   ============================================================ */

INSERT INTO purchase_orders
(supplier_id, warehouse_id, employee_id,
 order_date, expected_date, status, total_amount)
SELECT
    ((n-1)%100)+1,
    ((n-1)%20)+1,
    ((n-1)%100)+1,
    DATE_ADD('2024-01-01', INTERVAL n DAY),
    DATE_ADD('2024-01-01', INTERVAL (n+7) DAY),
    ELT(((n-1)%4)+1,
        'Pending','Approved','Received','Cancelled'),
    ROUND(5000 + ((n*731)%95000),2)
FROM (
    SELECT @p:=@p+1 AS n
    FROM
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
    (SELECT @p:=0) r
    LIMIT 700
) numbers;


/* ============================================================
   INSERT PURCHASE ORDER ITEMS - 2,000 RECORDS
   ============================================================ */

INSERT INTO purchase_order_items
(purchase_order_id, product_id, quantity, unit_price, total_price)
SELECT
    ((n-1)%700)+1,
    ((n*13)%1000)+1,
    1 + ((n*7)%50),
    ROUND(500 + ((n*137)%50000),2),
    ROUND(
        (1 + ((n*7)%50)) *
        (500 + ((n*137)%50000)),2
    )
FROM (
    SELECT @poi:=@poi+1 AS n
    FROM
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
    (SELECT @poi:=0) r
    LIMIT 2000
) numbers;


/* ============================================================
   INSERT SALES - 700 RECORDS
   ============================================================ */

INSERT INTO sales
(warehouse_id, employee_id, sale_date,
 customer_name, payment_method, status, total_amount)
SELECT
    ((n-1)%20)+1,
    ((n-1)%100)+1,
    DATE_ADD('2024-01-15', INTERVAL n DAY),
    CONCAT('Customer ', n),
    ELT(((n-1)%5)+1,
        'Cash','UPI','Credit Card','Debit Card','Bank Transfer'),
    ELT(((n-1)%3)+1,
        'Completed','Pending','Cancelled'),
    ROUND(1000 + ((n*913)%75000),2)
FROM (
    SELECT @s:=@s+1 AS n
    FROM
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
    (SELECT @s:=0) r
    LIMIT 700
) numbers;


/* ============================================================
   INSERT SALE ITEMS - 2,000 RECORDS
   ============================================================ */

INSERT INTO sale_items
(sale_id, product_id, quantity, unit_price, total_price)
SELECT
    ((n-1)%700)+1,
    ((n*17)%1000)+1,
    1 + ((n*5)%20),
    ROUND(500 + ((n*97)%50000),2),
    ROUND(
        (1 + ((n*5)%20)) *
        (500 + ((n*97)%50000)),2
    )
FROM (
    SELECT @si:=@si+1 AS n
    FROM
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
    (SELECT @si:=0) r
    LIMIT 2000
) numbers;


/* ============================================================
   INSERT STOCK MOVEMENTS - 1,360 RECORDS
   ============================================================ */

INSERT INTO stock_movements
(product_id, warehouse_id, employee_id,
 movement_type, quantity, movement_date,
 reference_type, reference_id, remarks)
SELECT
    ((n*11)%1000)+1,
    ((n-1)%20)+1,
    ((n-1)%100)+1,

    ELT(((n-1)%4)+1,
        'IN','OUT','ADJUSTMENT','RETURN'),

    1 + ((n*9)%100),

    DATE_ADD('2024-01-01', INTERVAL n DAY),

    ELT(((n-1)%3)+1,
        'Purchase Order','Sale','Manual'),

    ((n-1)%700)+1,

    CASE ((n-1)%4)+1
        WHEN 1 THEN 'Stock received from supplier'
        WHEN 2 THEN 'Stock sold to customer'
        WHEN 3 THEN 'Stock adjusted manually'
        WHEN 4 THEN 'Product returned'
    END

FROM (
    SELECT @sm:=@sm+1 AS n
    FROM
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
    (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
     UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
    (SELECT @sm:=0) r
    LIMIT 1360
) numbers;


/* ============================================================
   CHECK RECORD COUNTS
   ============================================================ */

SELECT 'categories' AS table_name, COUNT(*) AS record_count
FROM categories

UNION ALL

SELECT 'suppliers', COUNT(*)
FROM suppliers

UNION ALL

SELECT 'warehouses', COUNT(*)
FROM warehouses

UNION ALL

SELECT 'products', COUNT(*)
FROM products

UNION ALL

SELECT 'employees', COUNT(*)
FROM employees

UNION ALL

SELECT 'purchase_orders', COUNT(*)
FROM purchase_orders

UNION ALL

SELECT 'purchase_order_items', COUNT(*)
FROM purchase_order_items

UNION ALL

SELECT 'sales', COUNT(*)
FROM sales

UNION ALL

SELECT 'sale_items', COUNT(*)
FROM sale_items

UNION ALL

SELECT 'stock_movements', COUNT(*)
FROM stock_movements;


/* ============================================================
   TOTAL RECORD COUNT
   ============================================================ */

SELECT
(
    (SELECT COUNT(*) FROM categories) +
    (SELECT COUNT(*) FROM suppliers) +
    (SELECT COUNT(*) FROM warehouses) +
    (SELECT COUNT(*) FROM products) +
    (SELECT COUNT(*) FROM employees) +
    (SELECT COUNT(*) FROM purchase_orders) +
    (SELECT COUNT(*) FROM purchase_order_items) +
    (SELECT COUNT(*) FROM sales) +
    (SELECT COUNT(*) FROM sale_items) +
    (SELECT COUNT(*) FROM stock_movements)
) AS TOTAL_RECORDS;