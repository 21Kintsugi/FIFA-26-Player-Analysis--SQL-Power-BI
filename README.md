# FIFA-26-Player-Analysis---SQL-Power-BI
This project demonstrates my SQL and data analysis skills using the FIFA 26 (FC 26) player dataset.  The dataset includes detailed information about football players, their clubs, leagues, and stats. 

START DATE: 10/2/2025,
DATABASE: PostgreSQL,
VISUALIZATION: POWER BI,
DATASET name: FC 26 (FIFA 26) Player Data,
DATASET creator: rovnez,
DATASET link: https://www.kaggle.com/datasets/rovnez/fc-26-fifa-26-player-data

The goal of this project is to showcase the SQL skills I have acquired in my free time through learning from numerous free resources. I consider myself a solid beginner progressing into intermediate SQL. I selected this dataset because it aligns with my interest, football and, more importantly, it allows me to practice data analysis.
By creating this project, I also aim to provide data insights for FIFA players, helping them understand the best players, clubs, and leagues based on statistics.

##
Database Design: (create_tables.sql)
This project uses a relational database split into four tables for better organization and to practice joins and aggregations. 
I began the project by creating the database tables. All the queries used can be found in create_tables.sql. 
At this stage no major difficulties were encountered. By using basic SQL, I was able to create the table and set the data type for each column.

##
Loading Data into the Database: (populate_tables.sql)
After creating the tables, I populated them with data from the FIFA 26 dataset. The SQL queries used for this process are available in populate_tables.sql.
While populating the database tables, several challenges arose:
 - CSV Encoding and File Access: The original file used WIN1252 encoding, which caused errors in PostgreSQL. Moving the file to a simpler folder and saving it as UTF-8 resolved the issue.
 - Staging Table Usage: A staging_fc26 table was created to import the raw CSV first. This allowed us to clean, transform, and selectively populate the normalized tables without errors.
 - Primary Key and Duplicates: Some tables, like players and clubs, had duplicate rows that violated primary key constraints. Using DISTINCT ON in INSERT statements ensured only unique rows were inserted.
 - Data Type Mismatches: Certain columns contained non-numeric characters (e.g., “86+3”), which caused integer errors. I converted these columns to TEXT.
 - Complex Repetitive Queries: Populating the skills table involved many columns, making the SQL repetitive.  

##
Working on the first set of queries: (queries_set_1)
After populating all the data into the tables and ensuring the tables are clean, I started querying the datasets to find some interesting insights. I began with basic queries where I explored information such as: countries with the most players in FC26, clubs with the most registered players, and the names of the tallest, heaviest, shortest, and lightest players in the game, along with their weight and height. In these queries, I used basic SQL concepts including SELECT, GROUP BY, ORDER BY, LIMIT, JOIN, WHERE, UNION, OR, comparison operators and even subqueries.

##
Working on the second set of queries: (queries_set_2)
I continued exploring the FC26 dataset with a set of more advanced queries to find more interesting insights. I looked at things like top young players in each league, clubs with the highest average potential, and players who outperform their club’s average. In these queries, I used intermediate SQL concepts such as joins across multiple tables, filtering and conditional logic (CASE, WHERE), Common Table Expressions (CTEs), window functions (ROW_NUMBER), calculated/derived columns, and combined multiple aggregations.

##
Creating Power BI visuals using the queries from the first set of queries: (queries_set_1_visualization.pbix)
I connected to the PostgreSQL database from Power BI, used the advanced SQL query option to load the data, and then created five different visuals based on first set of queries. Below is a screenshot of all the PowerBI visuals:
<img width="1661" height="930" alt="image" src="https://github.com/user-attachments/assets/89d9d4f7-1668-4ed5-9bc5-657efb2ef7e5" />

##
Creating Power BI visuals using the tables from the database (no queries): (Top5_Leagues_Player_Analysis.pbix.pbix)
In this section, I created Power BI dashboards using the raw data directly from the database tables, without relying on SQL queries. All filtering, aggregation, and selection were performed within Power BI itself. The project includes five dashboards that provide insights into Europe’s top five football leagues, showcasing rankings by total player market value, average monthly wage, overall player quality, key football attributes (defending, dribbling, pace, passing, and physicality), as well as the average height of players in each league.
<img width="2109" height="1182" alt="image" src="https://github.com/user-attachments/assets/aba3d991-3852-4550-acc5-30de49063d06" />

##
CONCLUSION:
The goal of this project was to test the SQL and Power BI skills I have acquired and put into practice the concepts I have learned. I can say that the goal was achieved. While this project may not be perfect or industry relevant, I am still satisfied with the results. This project allowed me to independently apply and strengthen my SQL and Power BI skills using the FIFA 26 dataset. I designed a relational database, wrote queries to explore players, clubs, and leagues, and created dashboards to visualize key metrics such as player value, wages, quality, attributes, and height.
Now, onto harder stuff!
