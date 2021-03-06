Data Analysis of M1 Expert Pies
===============================

**Note:** If you already have **Jupyter Notebooks** installed you can view the _M1 Expert Pie Analysis.ipynb_ file there but if not, please click [here](https://colab.research.google.com/github/AvinashBisram/PortfolioProjects/blob/main/M1%20Expert%20Pie%20Analysis/M1%20Expert%20Pie%20Analysis.ipynb) to view the project in Google Colaboratory. Thank you!

Overview
---------

**What this application does:**  
This project is a data visualization and analysis of M1 Finance's premade retirement portfolios (known as Expert Pies).
<br>

**What technologies did I use and why:**  
I utilized **Microsoft Excel** to store the raw data for each portfolio. I utilized the **Pandas** Python module for data cleaning and exploration, and used the **Seaborn** Python module to create data visualizations with hopes of answering my initial questions about the portfolios. 
<br>

**Skills demonstrated by this project:**
 * Data Cleaning (using Pandas)
    - Finding Missing Values
    - Casting to different data types
    - Dropping rows/columns  
 * Data Exploration (using Pandas)
    - Slicing and creating views
    - Sorting by rows/columns
    - Grouping and aggregate functions
 * Data Visualization (using Seaborn)
    - Choosing the right visualization to answer each question (this project mainly used line graphs and heatmaps)
    - Making the visualizations look aesthetically pleasing (modifying colors, legend placement, using subplots, etc.)
 * Ability to interpret and communicate findings
    - Trend summaries objectively explain pertinent findings
    - Deeper analysis was performed after visualizing to provide more context

**How is this project organized:**  
Relevant data for each portfolio was manually recorded into a **Microsoft Excel** file. It was then converted into a CSV file (<em>See m1_pies.csv</em>). The CSV file was put into a **Pandas** data frame where some initial data cleaning and exploration was done.  
<br>
Then, for each of my analysis questions...  
 * I used **Seaborn** to make the appropriate visualization,  
 * followed by any additional "Post-Viz" questions I had (and writing the appropriate queries to answer those questions), 
 * and ending with an overall summary of trends pertaining to that analysis question.  

At the end of my project, I have a small list of potential improvements I could make to my project if I wished to expand on this idea in the future. 
<br>

**My Analysis Questions**  
How does changing the retirement year and/or the risk of the investments affect the...
1. Annual dividend yields?
2. Historic 1-year, 3-year, and 5-year returns?
3. Relative percentage allocated to each type of security (cash, stocks, bond, commodity/blend)?
4. Top 5 individual fund preferences?
5. Bottom 5 individual fund preferences?
6. Preference of fund location (US, international, or all)?
7. Allocation of the different caps?
8. Preference of value vs. growth funds?

About M1 Finance's Expert Pies
-------------------------------

M1 Finance has a unique method of constructing investment portfolios. M1 Finance users construct a "pie" which specify percentage allocations for various securities. A certain percentage of the pie is allocated to each desired security and all percentages must add up to 100%. (Example: One pie might have 50% allocated for VOO and 50% for VTI). Rather than depositing money into the individual securities, M1 users then deposit money to the entire "pie" and that money is then deposited to the comprising securities based on the percentage they were allocated.

<br>

M1 Finance's mobile app has a section for **Research** where one can navigate to their selection of **Expert Pies** or premade investment portfolios. They offer several categories for their Expert Pies including: _General Investment_, _Plan for Retirement_, _Responsible Investing_, _Hedge Fund Followers_, and more.  
<br>

This project analyzes the various premade portfolios listed in the **Plan for Retirement** section. Once within this section, M1 Finance recommends sample portfolios based on the user's desired _Projected Retirement Year_ (between 2020 and 2060) and _Risk Type_ (Aggressive, Moderate, or Conservative). A snapshot of that screen can be seen here:
<br>
<img alt="Plan for Retirement Pies" title="Plan for Retirement Pies" src="readMeImages/Plan for Retirement Pies.jpg" width=300px height=600px style="padding-top:5px;">

<br>

A side-by-side comparison of the "2020 Aggressive", "2020 Conservative", and "2060 Aggressive" Pies can be seen here:  
<img alt="2020 Aggressive Pie" title="2020 Aggressive Pie" src="readMeImages/2020 Aggressive Pie.jpg" width=300px height=600px style="float:left; padding-top:5px;">
<img alt="2020 Conservative Pie" title="2020 Conservative Pie" src="readMeImages/2020 Conservative Pie.jpg" width=300px height=600px style="float:left; padding-top:5px; margin-left:10px; margin-right:10px;">
<img alt="2060 Aggressive Pie" title="2060 Aggressive Pie" src="readMeImages/2060 Aggressive Pie.jpg" width=300px height=600px style="float:left; padding-top:5px;">    
<br style="clear:left;">

As seen above, percentage allocations of securities change when Risk Type varies (within the same Projected Retirement Year) and when the Projected Retirement Year changes as well. Other attributes about the portfolios change as well which prompted me to formulate questions to explore further.

Motivation Behind this Project
-------------------------------

I wanted to learn more about investing in the stock market (particularly for retirement) but I was becoming overwhelmed by the plethora of factors that could influence how one constructs their investment portfolio.  
After researching various investment brokering apps, I stumbled on M1 Finance and decided to learn more about what they offered.  
While looking through their app, I noticed the _Research_ tab and saw their list of Expert Pies designed for Retirement Planning.
<br>  
After perusing the various portfolios offered, I noticed that many qualities of these pies would change depending on Projected Retirement Year and/or Risk Type (such as the expected return, annual dividend yield, but most importantly the percentage allocations into various securities).  
I wondered if I could find and explore any trends within the data and gain valuable insight about investing philosophy by learning from the "experts". 
This seemed like the perfect opportunity to apply my skills for data analysis and visualization so I decided to give it a shot and see what I could learn.
<br>

**Disclaimer:** DO NOT interpret the findings of this project as financial advice. I attempted to display my findings as objectively as possible, but the questions I had might not apply to your specific financial situation and investing philosophy.
