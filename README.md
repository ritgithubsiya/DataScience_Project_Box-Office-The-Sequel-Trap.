# DataScience_Project_Box-Office-The-Sequel-Trap.
Do Movie Sequels Perform Better Than Original Movies?
Project Overview:

Analyzed whether movie sequels perform better than original movies
Used IMDb Top 250 Movies dataset
Tested the common industry belief using data and simple statistical methods
Performed analysis and modeling using R

Project Objectives:

Compare box office performance of original movies and sequels
Identify revenue patterns using visual analysis
Build a predictive model to classify movie performance
Evaluate whether sequels show higher success consistently

Dataset Information

Dataset: IMDb Top 250 Movies
Source: Public IMDb dataset
Key columns used:
Movie name
Release year
IMDb rating
Budget
Box office collection
Created a new feature to identify sequels from movie titles

Data Cleaning Steps

Checked dataset structure and missing values
Removed rows with missing budget or box office values
Verified duplicate records
Prepared a clean dataset for analysis and modeling

Exploratory Data Analysis (EDA)

Used box plots to compare box office earnings
Compared original movies vs sequels
Identified distribution differences using visual analysis
Observed higher median revenue for sequels

Modeling Approach

Converted IMDb ratings into High and Low categories
Used Random Forest classification algorithm
Selected features:
Budget
Box office
Year
Sequel indicator
Split data into training and testing sets (70–30)

Model Evaluation

Evaluated model using confusion matrix
Measured accuracy and classification performance
Identified important features using feature importance plot
Model showed good predictive performance

Repository Structure

/data – Dataset source or sample
/scripts – R scripts for data cleaning, EDA, and modeling
/output – Final PPT and exported plots
README.md – Project description

Key Conclusions

Sequels generally earn higher box office revenue
Budget and box office are strong predictors of performance
Random Forest model effectively captured performance patterns
Not all sequels outperform originals, but the trend is visible

GitHub Repository
Repository link included in final PPT and submission
