# FIFA-26-Player-Analysis---SQL-Power-BI
This project demonstrates my SQL and data analysis skills using the FIFA 26 (FC 26) player dataset.  The dataset includes detailed information about football players, their clubs, leagues, and stats. 

START DATE: 10/2/2025
DATASET name: FC 26 (FIFA 26) Player Data
DATASET creator: rovnez
DATASET link: https://www.kaggle.com/datasets/rovnez/fc-26-fifa-26-player-data

My goal with this project is to showcase the SQL skills I have acquired in my free time through learning from numerous free resources. I selected this dataset because it aligns with my interest, football and, more importantly, it allows me to practice data analysis.
By creating this project, I also aim to provide data insights for FIFA players, helping them understand the best players, clubs, and leagues based on statistics.

##
Database Design:
This project uses a relational database split into four tables for better organization and to practice joins and aggregations. 
I began the project by creating the database tables. All the queries used can be found in create_tables.sql. 
At this stage no major difficulties were encountered. By using basic SQL, I was able to create the table and set the data type for each column.

##
Loading Data into the Database:
After creating the tables, I populated them with data from the FIFA 26 dataset. The SQL queries used for this process are available in populate_tables.sql.
While populating the database tables, several challenges arose:
 - CSV Encoding and File Access: The original file used WIN1252 encoding, which caused errors in PostgreSQL. Moving the file to a simpler folder and saving it as UTF-8 resolved the issue.
 - Staging Table Usage: A staging_fc26 table was created to import the raw CSV first. This allowed us to clean, transform, and selectively populate the normalized tables without errors.
 - Primary Key and Duplicates: Some tables, like players and clubs, had duplicate rows that violated primary key constraints. Using DISTINCT ON in INSERT statements ensured only unique rows were inserted.
 - Data Type Mismatches: Certain columns contained non-numeric characters (e.g., “86+3”), which caused integer errors.I converted these columns to TEXT or cleaned the data to extract base numbers before inserting.
 - Complex Repetitive Queries: Populating the skills table involved many columns, making the SQL repetitive.  

##
Working on beginer level queries:
After populating all the data into the tables and ensuring the tables are clean, I started querying the datasets to find some interesting insights. I began with beginner-level queries where I explored information such as: countries with the most players in FC26, clubs with the most registered players, and the names of the tallest, heaviest, shortest, and lightest players in the game, along with their weight and height. In these queries, I used basic SQL concepts including SELECT, GROUP BY, ORDER BY, LIMIT, JOIN, WHERE, UNION, and even subqueries.
