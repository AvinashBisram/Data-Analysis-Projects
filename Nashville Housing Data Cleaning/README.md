Nashville Housing Data Cleaning
===============================

Overview
--------

**What this project does:**  
This project cleans and transforms sample Nashville Housing data using SQL queries.

**What technologies did I use and why:**  
The raw data was stored in **Microsoft Excel** (_see Nashville Housing Data.xlsx_) and then brought into **Microsoft SQL Server**.  
**SQL** querying was used from there to perform necessary data cleaning and transformation.

**Skills demonstrated by this project:**  
* Table Altering
* Table Updating
* Removing Duplicates (using a self join)
* Text splicing with Substring
* Text splicing with ParseName
* SQL Case statement
* CTEs and Window Functions
* Deleting columns

**How is this project organized:**  
This project starts with transforming the string representation of dates into that of DATE dtypes.  
Then, a self join is used to resolve missing fields in otherwise duplicate rows.  
Next, string splicing is used to create more specific columns out of a single address (using substring and parsename).  
Then, a case statement is used to conditionally alter certain fields.  
Finally, the duplicate rows mentioned before are removed, before transformed/unused columns are dropped from the table entirely.


Motivation Behind this Project
------------------------------
I made this project to gain more experience with data cleaning and transformation in SQL. I attempted to use slightly more advanced SQL techniques such as string splicing, case statements, and a creative use of table joining to resolve an issue with missing field values. The main goal was become more comfortable modifying data using SQL.
