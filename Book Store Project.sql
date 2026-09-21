-- Creating of book store database 

CREATE DATABASE Book_store;

USE Book_store; 

-- Create table of books 

DROP TABLE IF EXISTS books;

CREATE TABLE books(
	book_ID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    published_year INT,
    price DECIMAL(10,2),
    stock  int
);

DROP TABLE IF EXISTS customers;

CREATE  TABLE customers(
	customers_ID INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    country VARCHAR(150)
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
	order_ID  INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customers_ID),
    book_id INT, 
    FOREIGN KEY (book_id) REFERENCES books(book_ID),
    order_date  DATE,
    Quantity  INT,
    total_amount DECIMAL(10, 2)
);

SELECT * FROM books;
SELECT * FROM customers;
SELECT *FROM orders;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
--  load the data from the downloaded file of books data 

LOAD DATA LOCAL INFILE
'data/Books.csv'
INTO TABLE books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock); 


--  load the data from the downloaded file of customers data 

LOAD DATA LOCAL INFILE
'data/Customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customers_ID, name, email, phone, city, country);

-- load the data from the downloaded file of orders data 

LOAD DATA LOCAL INFILE
'data/Orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_ID, customer_id, book_id, order_date, Quantity, total_amount);


--  1) Retrive  all books in the "Fiction" genre:

SELECT * FROM books 
WHERE genre='Fiction';

-- 2) Find books published after the year 1950:

SELECT *FROM books
WHERE published_year >1950; 

-- 3)  List all customers from the canada:

SELECT *FROM customers
WHERE country='Canada';  

SELECT *FROM customers;

SELECT country, LENGTH(country), HEX(country)
FROM customers
WHERE country LIKE 'Canada%';

SET SQL_SAFE_UPDATES=0;

UPDATE customers
SET country = TRIM(country);

UPDATE customers
SET country = REPLACE(country, '\r', '');

SELECT * FROM customers
WHERE country = 'Canada';

-- 4)  Show orders placed in November 2023: 

SELECT * FROM orders;   

SELECT *FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stocks of books available :

SELECT title , stock FROM books; 

SELECT SUM(stock) AS Total_Stocks
FROM books;


-- 6) Find the details of the most expensive books: 

SELECT MAX(price) AS Most_expensive 
FROM books;

-- 2nd Method  

SELECT * FROM books
ORDER BY price DESC 
LIMIT 1; 

-- 7)  Show all customer who ordered more than 1 quantity of a book:
 select * from orders;
 
 SELECT * FROM orders 
 WHERE Quantity >1;
 
 -- 8) Retrieve all orders where the total amount exceeds $20:
 
SELECT * FROM orders 
WHERE total_amount >20;

-- 9)  List all the genres available in the Books Table:
 
 SELECT  DISTINCT genre FROM books;    --  IS code se DISTINCT se duplicate vakue print nhi hota hai
 
 -- 10) Find the book with the lowest stock :
  
 SELECT * FROM books 
 ORDER BY stock ASC;
 
 -- 11) Calculate the total revenue generated from all orders: 
 
 SELECT SUM(total_amount) AS Total_Revenue 
 FROM orders;
 
 
 -- Advanced Question 
 
 -- 1) Retrieve the total number of books sold for each genre :
 
 SELECT b.genre , SUM(o.Quantity) AS Total_Book_Sold
 FROM orders o
 JOIN books b ON o.book_id=b.book_ID
 GROUP BY b.genre;
 
 -- 2) Find the average price of book in the "Fantasy" genre:
 
 SELECT AVG(price) AS Average_Price 
 FROM books
 WHERE genre='Fantasy';
 
 -- 3) List customers who have placed at least 2 orders:
 
 SELECT o.customer_id , c.name , COUNT(o.order_ID) AS ORDER_COUNT
 FROM orders o
 JOIN customers c ON o.customer_id = c.customers_ID
 GROUP BY o.customer_id, c.name
 HAVING COUNT(o.order_ID) >=2 
 ORDER BY (ORDER_COUNT) ASC;
 
 -- 4) Find the most fequently  ordered book :
 
 SELECT o.book_id , b.title, COUNT(order_id) AS order_count 
 FROM orders o
 JOIN books b ON o.book_id = b.book_ID
 GROUP BY book_id
 ORDER BY order_count DESC LIMIT 5;
 
 SELECT * FROM books;
 SELECT * FROM orders;
 SELECT * FROM customers;
 
 -- 5)  Show the top 3 most expensive bbooks sold of 'Fantasy Genre':
 
 SELECT * FROM books
 WHERE genre ='Fantasy'
 ORDER BY Price DESC LIMIT 3;
 
 -- 6)   Retrieve the Total Quantity of books sold by each author :
 
 SELECT b.author , SUM(o.Quantity) AS Total_Book_Sold 
 FROM orders o
 JOIN books b ON o.book_id = b.book_ID
 GROUP BY b.author
 ORDER BY (Total_Book_Sold) DESC;
 
 
 -- 7)  List the cities where customers who spent over $30 are located :
 
 SELECT DISTINCT c.city , total_amount
 FROM orders o
 JOIN customers c ON o.customer_id = c.customers_ID
 WHERE o.total_amount > 30;
 
-- 8) Find the customer who  spent the most on orders:
 
 SELECT c.customers_ID , c.name, SUM(o.total_amount) AS Total_spent
 FROM orders o
 JOIN customers c ON o.customer_id = c.customers_ID
 GROUP BY c.customers_ID , c.name
 ORDER BY Total_spent DESC LIMIT 1;
 
 
 -- 9)  Calculate the stock remaining after fulfilling all orders:
 
 SELECT b.book_ID, b.title, b.stock, COALESCE(SUM(o.Quantity),0) AS order_quantity,
 b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
 FROM books b
 LEFT JOIN orders o ON b.book_ID = o.book_id
 GROUP BY b.book_ID;