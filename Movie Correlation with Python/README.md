Movie Correlation with Python
=============================

**Note:** **Note:** If you already have **Jupyter Notebooks** installed you can view the _Movie Correlation with Python.ipynb_ file there but if not, please click [here](https://colab.research.google.com/github/AvinashBisram/PortfolioProjects/blob/main/Movie%20Correlation%20with%20Python/Movie%20Correlation%20with%20Python.ipynb) to view the project in Google Colaboratory. Thank you!

Overview
--------

**What this project does:**  
This project uses Python to explore correlations between features of a movie dataset.

**What technologies did I use and why:**  
Data was extracted from Kaggle's Movie Industry dataset and stored in a CSV file (<em>see movie_correlation.csv</em>).  
The **Pandas** Python module was used for exploring, cleaning, and preparing the data.  
The **Seaborn** Python module was used to create the necessary visualizations.

**Skills demonstrated by this project:**  
* Basic data exploration (gleaming basic information about the dataset as a whole)
* Casting column data types
* Creating/Altering columns
* Filtering data (using conditional statements)
* Identifying and Visualizing feature correlation


**How is this project organized:**  
This project starts with initial data exploration before necessary cleaning is performed (dtype casting, adding columns, removing duplicates).  
Correlations are then identifed and visualized for all numeric feature columns.
Correlations are then identified and visualized for ALL feature columns (data is transformed using cat codes).
Finally, correlations are filtered to find those that may be significant (this project looked for correlations below -0.5 or above 0.5 while excluding that of identical features).


Motivation Behind this Project
------------------------------
I made this project to gain experience approaching data analysis and visualization from a statistical perspective.  
My previous projects explored pre-identified relationships relating to initial questions or topics of curiosity while this project attempted to identify previously unknown
relationships within the dataset.  
I intend to learn more about statistical modeling and application in the future.