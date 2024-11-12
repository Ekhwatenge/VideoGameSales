## Video Game Sales Data Analysis

## Project Overview
This project analyzes video game sales data to uncover insights into trends over time, platform and genre performance, and regional preferences. The findings can inform strategic decision-making in game development, marketing, and regional targeting. The analysis is performed in R, with outputs generated as visualizations and summaries.


## Dataset
The dataset contains information on video game sales, including the following columns:

Rank: Ranking of the game based on global sales.
Name: Title of the game.
Platform: The platform on which the game was released (e.g., Wii, NES).
Year: Release year of the game.
Genre: Genre of the game (e.g., Sports, Racing).
Publisher: The company that published the game.
NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales: Sales in millions by region and globally.

## Analysis Objectives
Sales Trends Over Time: Analyze sales patterns to identify seasonal trends and lifecycle patterns.
Platform Performance: Evaluate the popularity of different gaming platforms and examine platform-specific genre preferences.
Genre Trends: Identify top-performing genres and spot emerging genres with recent growth in popularity.
Regional Analysis: Examine regional contributions to global sales and analyze region-specific genre preferences.

## Project Structure
The project contains the following key sections:

1. Sales Trends Over Time: Converts the year column to integer format, groups sales data by year, and visualizes sales trends over time to identify peaks and declines.
2. Platform Performance: Analyzes total sales by platform and investigates genre preferences within each platform.
3. Genre Trends: Identifies top-performing genres and examines trends over time to spot emerging genres.
4. Regional Analysis: Analyzes sales contributions by region and explores genre preferences within each region.

## R libraries Requirements

dplyr: For data manipulation.
ggplot2: For data visualization.
tidyr: For reshaping data.
Ensure that these packages are installed before running the script.

## Usage
Clone this repository to your local machine.
git clone (https://github.com/Ekhwatenge/VideoGameSales/tree/main)
Open the VideoGameSalesAnalysis.R file in RStudio or your preferred R editor.
Load the dataset (vgsales.csv) by placing it in the project directory.
Run the script sections individually or as a whole to generate the analysis and visualizations.

## Results
Sales trends over time: Identify peak sales periods to inform release timing.
Platform popularity: Understand which platforms are most profitable and the genres that perform well on each.
Genre preferences: Guide content development by focusing on popular and emerging genres.
Regional sales trends: Develop region-specific strategies based on the popularity of genres and platforms in different regions.

## Sample Visualizations
Line chart of global sales trends over time.
Bar charts of platform popularity and genre preferences.
Line chart showing genre trends over time.
Regional sales distribution by genre.
