Covid-19 Data Exploration
=========================

**Note:** I used a few of the SQL queries from this project to create interactive visualizations using Tableau. You can view that dashboard [here](https://public.tableau.com/app/profile/avinash.bisram/viz/CovidStatisticsDashboard_16300901625710/Dashboard1).

Overview
--------

**What this project does:**  
This project explores Covid-19 data, looking at relevant statistics per individual country, continent, and globally.

**What technologies did I use and why:**  
I used **Microsoft Excel** to store data extracted from [Coronavirus (Covid-19) Deaths](https://ourworldindata.org/covid-deaths) dataset from [Our World in Data](https://ourworldindata.org).
I then used **Microsoft SQL Server** to write the appropriate queries to create the statistics I wanted to learn about.

**Skills demonstrated by this project:**  
SQL Querying using...
* Select, From, and Where clauses
* Ordering
* Grouping and Aggregate Functions
* Partitioning
* Joining Tables
* CTEs
* Temp Tables
* Views

**How is this project organized:**  
This project starts with queries showcasing all of the raw data. I then construct queries for additional Covid-19 statistics that were not included in the original data.  
These statistics include those made per country such as:
* Death Likelihood over time (probability of one dying if they contracted Covid-19 in their country),
* Percentage of Population Infected over time, and
* Total Death Count per country
<br>

and those made per continent and globally such as:  
* Total Death Count per continent, and
* Global Death Percentage
<br>

I end by creating queries for rolling statistics of number of people vaccinated and percentage of population vaccinated over time (per country). I create those same statistics using a CTE, Temp Table, and a View.


Motivation Behind this Project
------------------------------
I made this project to become familiar with data exploration using the SQL language. I was already familiar with using the _Pandas_ module in Python, but I wanted to learn how to perform similar operations in SQL as it would be more useful when working with databases. I also wanted to start working with an interactive data visualization software and knew that Tableau could work with SQL queries. You can view the Tableau Dashboard I created using these queries [here](https://public.tableau.com/app/profile/avinash.bisram/viz/CovidStatisticsDashboard_16300901625710/Dashboard1).
