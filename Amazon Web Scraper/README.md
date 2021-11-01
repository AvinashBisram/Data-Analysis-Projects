Amazon Web Scraper
==================

**Note:** If you already have **Jupyter Notebooks** installed you can view the _Amazon Web Scraper.ipynb_ file there but if not, please click [here](https://colab.research.google.com/github/AvinashBisram/PortfolioProjects/blob/main/Amazon%20Web%20Scraper/Amazon%20Web%20Scraper.ipynb) to view the project in Google Colaboratory. Thank you!

Overview
--------

**What this project does:**  
This project utilizes Python webscraping to collect and store data about an Amazon product (and collect new data every 24 hours).

**What technologies did I use and why:**  
I utilized the **Beautiful Soup 4** Python module to parse the Amazon page HTML and stored that data in a CSV file (<em>see AmazonWebScrapeData.csv</em>).

**Skills demonstrated by this project:**  
* Data collection (using webscraping to create and update a dataset over time)
* Using BS4 to identify and collect relevant data from a website
* Storing that data in a CSV file
* Creating a script to update that CSV with current product over time

**How is this project organized:**  
The first 7 cells connect to the desired Amazon product page and show examples of retrieving relevant information (such as the product title, brand, description, and price).  
Then, the CSV file is created to store data. A function is defined that will collect current product data and append it to the created CSV file.  
Finally, a simple script is made to call that function every 24 hours (updating the CSV file).


Motivation Behind this Project
------------------------------
This project was created to gain basic experience with utilizing webscraping to create and update a dataset over time.  
It only collects and updates data on a single product in its current state but I plan on improving it to scrape entire ranges/catalogs of products in the future.