\# 📚 SQL Book Store Project



A beginner-friendly \*\*MySQL Book Store Database Project\*\* created to practice SQL concepts and Data Analytics-oriented queries.



\## 📌 Project Overview



This project simulates an online book store database using MySQL.



It contains information about:



\- 📖 Books

\- 👥 Customers

\- 🛒 Orders



The project includes database creation, table relationships, CSV data loading, and SQL queries for analyzing books, customers, sales, and orders.



\---



\## 🛠️ Tools \& Technologies



\- MySQL

\- MySQL Workbench

\- SQL

\- Git

\- GitHub

\- CSV



\---



\## 🗂️ Project Structure



```text

SQL-Book-Store-Project/

│

├── Book Store Project.sql

├── README.md

│

└── data/

&#x20;   ├── Books.csv

&#x20;   ├── Customers.csv

&#x20;   └── Orders.csv







🗄️ Database Tables

1\. Books



Stores information about books.



| Column         | Description      |

| -------------- | ---------------- |

| book\_ID        | Unique book ID   |

| title          | Book title       |

| author         | Author name      |

| genre          | Book genre       |

| published\_year | Publication year |

| price          | Book price       |

| stock          | Available stock  |





2\. Customers



Stores customer information.



| Column       | Description        |

| ------------ | ------------------ |

| customers\_ID | Unique customer ID |

| name         | Customer name      |

| email        | Customer email     |

| phone        | Customer phone     |

| city         | Customer city      |

| country      | Customer country   |





3\. Orders



Stores book order information.



| Column       | Description             |

| ------------ | ----------------------- |

| order\_ID     | Unique order ID         |

| customers\_ID | Customer reference      |

| book\_ID      | Book reference          |

| order\_date   | Order date              |

| Quantity     | Number of books ordered |

| total\_amount | Total order amount      |





🔗 Table Relationships



Customers

&#x20;   │

&#x20;   │ customers\_ID

&#x20;   ▼

&#x20; Orders

&#x20;   ▲

&#x20;   │ book\_ID

&#x20;   │

&#x20; Books

One customer can place multiple orders.

One book can appear in multiple orders.

customers\_ID connects Customers with Orders.

book\_ID connects Books with Orders.





📊 SQL Concepts Practiced



This project covers the following SQL concepts:



CREATE DATABASE

CREATE TABLE

PRIMARY KEY

FOREIGN KEY

AUTO\_INCREMENT

INSERT

SELECT

WHERE

ORDER BY

LIMIT

DISTINCT

Aggregate Functions

COUNT()

SUM()

AVG()

MAX()

MIN()

GROUP BY

HAVING

INNER JOIN

Subqueries

Data filtering

Sales analysis

Customer analysis

Inventory analysis

CSV data import using LOAD DATA LOCAL INFILE





🔍 Analysis Questions



The project includes SQL queries to answer questions such as:



Find all Fiction books.

Find books published after 1950.

Find customers from Canada.

Find orders placed in November 2023.

Calculate total available book stock.

Find the most expensive book.

Find orders where quantity is greater than 1.

Find orders with total amount greater than 20.

Find all distinct book genres.

Find the book with the lowest stock.

Calculate total revenue.

Calculate sales by genre.

Find the average price of Fantasy books.

Find customers who placed multiple orders.

Find frequently ordered books.

Find the top 3 expensive Fantasy books.

Analyze sales by author.

Find cities with high-value orders.

Find the customer with the highest spending.

Calculate remaining stock after orders.





📂 Dataset



The project contains three CSV datasets:



Books.csv

Customers.csv

Orders.csv



All datasets are available inside the data folder.



Loading the CSV Files



The SQL file contains LOAD DATA LOCAL INFILE commands.



If the CSV path does not work on your computer, update the path according to your local project location.



Example:

LOAD DATA LOCAL INFILE 'data/Books.csv'

INTO TABLE books

FIELDS TERMINATED BY ','

ENCLOSED BY '"'

LINES TERMINATED BY '\\n'

IGNORE 1 ROWS

(Book\_ID, Title, Author, Genre, Published\_Year, Price, Stock);



The same approach can be used for Customers.csv and Orders.csv.



🎯 Project Objective



The main objective of this project is to build practical SQL skills by working with a relational database and answering real-world business questions.



This project helped me practice:



Writing SQL queries

Working with multiple tables

Using JOINs

Performing data analysis

Understanding relationships between tables

Solving business problems using SQL





🚀 Future Improvements



Possible future improvements include:



Advanced SQL queries

Window Functions

CTEs

Stored Procedures

Views

More complex business analysis

Connecting the database with Power BI

Creating an interactive Book Store dashboard



👨‍💻 Author



Subhash Kumar Paswan



BCA Student | Aspiring Data Analyst





⭐ Project Status



Completed – Beginner to Intermediate SQL Practice Project





\### Step 3 — Save



Paste karne ke baad:



\*\*Ctrl + S\*\*



Phir Notepad close kar do.



⚠️ \*\*Abhi Git commands mat chalana.\*\*



Bas mujhe \*\*`save ho gaya`\*\* bolna. Phir hum README ko GitHub par update karenge.

